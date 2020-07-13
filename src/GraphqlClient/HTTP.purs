module GraphqlClient.HTTP where

import GraphqlClient.Implementation
import GraphqlClient.WriteGraphql
import Protolude

import Affjax as Affjax
import Affjax.RequestBody as Affjax.RequestBody
import Affjax.ResponseFormat as Affjax.ResponseFormat
import Control.Monad.Except.Trans as Transformers
import Control.Monad.Trans.Class as Transformers
import Data.Argonaut.Core (jsonNull)
import Data.Argonaut.Core as ArgonautCore
import Data.Argonaut.Decode (class DecodeJson, JsonDecodeError(..), printJsonDecodeError)
import Data.Argonaut.Decode.Decoders (decodeJObject, decodeNonEmptyArray, decodeString) as Data.Argonaut.Decode.Decoders
import Data.Argonaut.Encode (class EncodeJson)
import Data.Argonaut.Encode as ArgonautCodecs.Encode
import Data.Argonaut.Encode.Generic.Rep as ArgonautGeneric
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty (toArray) as NonEmptyArray
import Foreign.Object (Object)
import Foreign.Object as Foreign.Object

{-
  TODO

  errors of type

  {
    errors: [
      {
        message: 'Cannot query field "description" on type "Root".',
        locations: [ { line: 1, column: 10 } ]
      }
    ]
  }

-}

type Location = { line :: Int, column :: Int }

newtype GraphqlUserErrorDetail =
  GraphqlUserErrorDetail
  { message :: String
  , otherDetails :: Object ArgonautCore.Json -- other unparsed error data, but without already parsed, e.g. locations or path
  -- , locations :: Maybe (Array Location)
  -- , path :: Array StringOrInt
  -- , extensions :: { code :: String, timestamp :: Date }
  }

derive instance newtypeGraphqlErrorRecord :: Newtype GraphqlUserErrorDetail _
derive instance genericGraphqlErrorRecord :: Generic GraphqlUserErrorDetail _
derive newtype instance eqGraphqlUserErrorDetail :: Eq GraphqlUserErrorDetail

decodeGraphqlErrorDetail :: ArgonautCore.Json -> Either JsonDecodeError GraphqlUserErrorDetail
decodeGraphqlErrorDetail json = lmap (Named "GraphqlUserErrorDetail") do
  jsonObject <- Data.Argonaut.Decode.Decoders.decodeJObject json
  (messageJson /\ otherDetails) <- Foreign.Object.pop "message" jsonObject # (note $ AtKey "message" $ MissingValue)
  (message :: String) <- Data.Argonaut.Decode.Decoders.decodeString messageJson
  pure $ GraphqlUserErrorDetail { message, otherDetails }

instance decodeJsonGraphqlErrorDetail :: DecodeJson GraphqlUserErrorDetail where
  decodeJson = decodeGraphqlErrorDetail

instance encodeJsonGraphqlErrorRecord :: EncodeJson GraphqlUserErrorDetail where
  encodeJson = ArgonautGeneric.genericEncodeJson

data PossiblyParsedData parsed
  = ParsedData parsed
  | NoDataKey
  | UnparsedData JsonDecodeError ArgonautCore.Json

data GraphqlError parsed
  = GraphqlAffjaxError       Affjax.Error
  -- | GraphqlBadStatus         Affjax.StatusCode String -- status is not in >=200 && <=299 range
  | GraphqlUnexpectedPayloadError JsonDecodeError ArgonautCore.Json -- json is not decoded at all
  | GraphqlUserError      (NonEmptyArray GraphqlUserErrorDetail) (PossiblyParsedData parsed)

printGraphqlError :: ∀ a . GraphqlError a -> String
printGraphqlError = case _ of
  GraphqlAffjaxError affjaxError -> Affjax.printError affjaxError
  GraphqlUnexpectedPayloadError error jsonBody -> intercalate "\n"
    [ "Unexpected payload:"
    , "  error = " <> printJsonDecodeError error
    , "  body = " <> ArgonautCore.stringifyWithSpace 2 jsonBody
    ]
  GraphqlUserError errorsArray possiblyParsedData ->
    let errorsArray' = errorsArray <#> unwrap <#> _.message <#> ("  " <> _)
     in case possiblyParsedData of
        ParsedData _parsed -> intercalate "\n" $ ["Data is parsed, but there are graphql errors:"] <> NonEmptyArray.toArray errorsArray'
        NoDataKey -> intercalate "\n" $ ["Data is not present because of the graphql errors:"] <> NonEmptyArray.toArray errorsArray'
        UnparsedData dataDecoderError _json -> (intercalate "\n" $ ["Data cannot be parsed because of the graphql errors:"] <> NonEmptyArray.toArray errorsArray') <> printJsonDecodeError dataDecoderError
  where
  quote x = "\"" <> x <> "\""


errorsOrBodyDecoder :: ArgonautCore.Json -> JsonDecodeError \/ { errors :: NonEmptyArray GraphqlUserErrorDetail, dataJson :: ArgonautCore.Json } \/ ArgonautCore.Json
errorsOrBodyDecoder json = do
  (jsonObject :: Object ArgonautCore.Json) <- Data.Argonaut.Decode.Decoders.decodeJObject json

  let
    maybeErrorJson = Foreign.Object.lookup "errors" jsonObject
    maybeDataJson = Foreign.Object.lookup "data" jsonObject -- http://spec.graphql.org/draft/#sec-Errors

  case maybeDataJson of
    -- not present -> errors should be NonEmptyArray
    Nothing ->
      case maybeErrorJson of
        Nothing -> Left $ AtKey "errors" MissingValue
        Just errorsJson -> do
           (nonEmptyArrayErrors :: NonEmptyArray GraphqlUserErrorDetail) <- Data.Argonaut.Decode.Decoders.decodeNonEmptyArray decodeGraphqlErrorDetail errorsJson
           pure $ Left { errors: nonEmptyArrayErrors, dataJson: jsonNull }
    -- present (including null) -> errors can be present and NonEmptyArray OR no errors
    Just dataJson -> do
       case maybeErrorJson of
         Nothing -> pure $ Right dataJson
         Just errorsJson -> do
            (nonEmptyArrayErrors :: NonEmptyArray GraphqlUserErrorDetail) <- Data.Argonaut.Decode.Decoders.decodeNonEmptyArray decodeGraphqlErrorDetail errorsJson
            pure $ Left { errors: nonEmptyArrayErrors, dataJson }

tryDecodeGraphqlResponse :: ∀ parsed . (ArgonautCore.Json -> Either JsonDecodeError parsed) -> ArgonautCore.Json -> Either (GraphqlError parsed) parsed
tryDecodeGraphqlResponse decoderForData jsonBody = graphqlResponseOrError # (\error -> Left $ GraphqlUnexpectedPayloadError error jsonBody) \/ identity
  where
    graphqlResponseOrError :: JsonDecodeError \/ Either (GraphqlError parsed) parsed
    graphqlResponseOrError = do
      errorsOrBodyDecoder jsonBody >>= case _ of
        Right dataJson -> do
          parsed <- decoderForData dataJson
          Right $ Right parsed
        Left { errors, dataJson } -> do
          (possiblyParsedData :: PossiblyParsedData parsed) <- decoderForData dataJson # (\error -> Right $ UnparsedData error dataJson) \/ (Right <<< ParsedData)
          Right $ Left $ GraphqlUserError errors possiblyParsedData

post :: Affjax.URL -> ArgonautCore.Json -> Aff (Either Affjax.Error (Affjax.Response ArgonautCore.Json))
post url body = Affjax.post Affjax.ResponseFormat.json url (Just $ Affjax.RequestBody.json $ ArgonautCodecs.Encode.encodeJson body)

gqlRequestImpl
  :: forall a
   . Affjax.URL
  -> String
  -> (ArgonautCore.Json -> Either JsonDecodeError a)
  -> Aff (Either (GraphqlError a) a)
gqlRequestImpl url query decoder = Transformers.runExceptT do
  (result :: Either Affjax.Error (Affjax.Response ArgonautCore.Json)) <- Transformers.lift $ post url $ ArgonautCodecs.Encode.encodeJson { query }
  jsonBody <- case result of
    Left error -> Transformers.throwError $ GraphqlAffjaxError error
    Right response -> pure response.body
  -- traceWithoutInspectM $ "[gqlRequest] jsonBody " <> ArgonautCore.stringifyWithIdentation 2 jsonBody -- TODO: move outside
  except $ tryDecodeGraphqlResponse decoder jsonBody

gqlRequestImplWithTrace
  :: forall a
   . Show a
  => Affjax.URL
  -> String
  -> (ArgonautCore.Json -> Either JsonDecodeError a)
  -> Aff (Either (GraphqlError a) a)
gqlRequestImplWithTrace url query decoder = do
  traceWithoutInspectM $ "[gqlRequest] query = " <> query
  result <- gqlRequestImpl url query decoder
  case result of
    Right output -> traceWithoutInspectM $ "[gqlRequest] output" <> show output
    Left graphqlError -> traceWithoutInspectM $ "[gqlRequest] " <> printGraphqlError graphqlError
  pure $ result

gqlRequest
  :: forall a
   . Affjax.URL
  -> SelectionSet Scope__RootQuery a
  -> Aff (Either (GraphqlError a) a)
gqlRequest url selectionSet@(SelectionSet _fields decoder) = do
  let query = writeGraphql selectionSet
  result <- gqlRequestImpl url query decoder
  pure $ result
