module GraphQLClient.HTTP where


import Protolude

import Affjax (Error, Response, Request, URL, defaultRequest, printError, request) as Affjax
import Affjax.RequestBody as Affjax.RequestBody
import Affjax.RequestHeader (RequestHeader) as Affjax
import Affjax.ResponseFormat as Affjax.ResponseFormat
import Control.Monad.Except.Trans (runExceptT, throwError) as Transformers
import Control.Monad.Trans.Class (lift) as Transformers
import Data.Argonaut.Core (jsonNull)
import Data.Argonaut.Core as ArgonautCore
import Data.Argonaut.Decode (class DecodeJson, JsonDecodeError(..), printJsonDecodeError)
import Data.Argonaut.Decode.Decoders (decodeJObject, decodeNonEmptyArray, decodeString) as Data.Argonaut.Decode.Decoders
import Data.Argonaut.Encode (class EncodeJson)
import Data.Argonaut.Encode as ArgonautCodecs.Encode
import Data.Argonaut.Encode.Generic.Rep as ArgonautGeneric
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty (toArray) as NonEmptyArray
import Data.HTTP.Method (Method(..))
--import Data.Time.Duration (Milliseconds)
import Foreign.Object (Object)
import Foreign.Object as Foreign.Object
import GraphQLClient.Implementation (Scope__RootMutation, Scope__RootQuery, SelectionSet(..))
import GraphQLClient.WriteGraphQL (writeGraphQL)
import Record as Record

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

newtype GraphQLUserErrorDetail =
  GraphQLUserErrorDetail
  { message :: String
  , otherDetails :: Object ArgonautCore.Json -- other unparsed error data, but without already parsed, e.g. locations or path
  -- , locations :: Maybe (Array Location)
  -- , path :: Array StringOrInt
  -- , extensions :: { code :: String, timestamp :: Date }
  }

derive instance newtypeGraphQLErrorRecord :: Newtype GraphQLUserErrorDetail _
derive instance genericGraphQLErrorRecord :: Generic GraphQLUserErrorDetail _
derive newtype instance eqGraphQLUserErrorDetail :: Eq GraphQLUserErrorDetail

decodeGraphQLErrorDetail :: ArgonautCore.Json -> Either JsonDecodeError GraphQLUserErrorDetail
decodeGraphQLErrorDetail json = lmap (Named "GraphQLUserErrorDetail") do
  jsonObject <- Data.Argonaut.Decode.Decoders.decodeJObject json
  (messageJson /\ otherDetails) <- Foreign.Object.pop "message" jsonObject # (note $ AtKey "message" $ MissingValue)
  (message :: String) <- Data.Argonaut.Decode.Decoders.decodeString messageJson
  pure $ GraphQLUserErrorDetail { message, otherDetails }

instance decodeJsonGraphQLErrorDetail :: DecodeJson GraphQLUserErrorDetail where
  decodeJson = decodeGraphQLErrorDetail

instance encodeJsonGraphQLErrorRecord :: EncodeJson GraphQLUserErrorDetail where
  encodeJson = ArgonautGeneric.genericEncodeJson

data PossiblyParsedData parsed
  = ParsedData parsed
  | NoDataKey
  | UnparsedData JsonDecodeError ArgonautCore.Json

data GraphQLError parsed
  = GraphQLAffjaxError       Affjax.Error
  -- | GraphQLBadStatus         Affjax.StatusCode String -- status is not in >=200 && <=299 range
  | GraphQLUnexpectedPayloadError JsonDecodeError ArgonautCore.Json -- json is not decoded at all
  | GraphQLUserError      (NonEmptyArray GraphQLUserErrorDetail) (PossiblyParsedData parsed)

printGraphQLError :: ∀ a . GraphQLError a -> String
printGraphQLError = case _ of
  GraphQLAffjaxError affjaxError -> Affjax.printError affjaxError
  GraphQLUnexpectedPayloadError error jsonBody -> intercalate "\n"
    [ "Unexpected payload:"
    , "  error = " <> printJsonDecodeError error
    , "  body = " <> ArgonautCore.stringifyWithIndent 2 jsonBody
    ]
  GraphQLUserError errorsArray possiblyParsedData ->
    let errorsArray' = errorsArray <#> unwrap <#> _.message <#> ("  " <> _)
     in case possiblyParsedData of
        ParsedData _parsed -> intercalate "\n" $ ["Data is parsed, but there are graphql errors:"] <> NonEmptyArray.toArray errorsArray'
        NoDataKey -> intercalate "\n" $ ["Data is not present because of the graphql errors:"] <> NonEmptyArray.toArray errorsArray'
        UnparsedData dataDecoderError _json -> (intercalate "\n" $ ["Data cannot be parsed because of the graphql errors:"] <> NonEmptyArray.toArray errorsArray') <> printJsonDecodeError dataDecoderError
  where
  quote x = "\"" <> x <> "\""


errorsOrBodyDecoder :: ArgonautCore.Json -> JsonDecodeError \/ { errors :: NonEmptyArray GraphQLUserErrorDetail, dataJson :: ArgonautCore.Json } \/ ArgonautCore.Json
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
           (nonEmptyArrayErrors :: NonEmptyArray GraphQLUserErrorDetail) <- Data.Argonaut.Decode.Decoders.decodeNonEmptyArray decodeGraphQLErrorDetail errorsJson
           pure $ Left { errors: nonEmptyArrayErrors, dataJson: jsonNull }
    -- present (including null) -> errors can be present and NonEmptyArray OR no errors
    Just dataJson -> do
       case maybeErrorJson of
         Nothing -> pure $ Right dataJson
         Just errorsJson -> do
            (nonEmptyArrayErrors :: NonEmptyArray GraphQLUserErrorDetail) <- Data.Argonaut.Decode.Decoders.decodeNonEmptyArray decodeGraphQLErrorDetail errorsJson
            pure $ Left { errors: nonEmptyArrayErrors, dataJson }

tryDecodeGraphQLResponse :: ∀ parsed . (ArgonautCore.Json -> Either JsonDecodeError parsed) -> ArgonautCore.Json -> Either (GraphQLError parsed) parsed
tryDecodeGraphQLResponse decoderForData jsonBody = graphqlResponseOrError # (\error -> Left $ GraphQLUnexpectedPayloadError error jsonBody) \/ identity
  where
    graphqlResponseOrError :: JsonDecodeError \/ Either (GraphQLError parsed) parsed
    graphqlResponseOrError = do
      errorsOrBodyDecoder jsonBody >>= case _ of
        Right dataJson -> do
          parsed <- decoderForData dataJson
          Right $ Right parsed
        Left { errors, dataJson } -> do
          (possiblyParsedData :: PossiblyParsedData parsed) <- decoderForData dataJson # (\error -> Right $ UnparsedData error dataJson) \/ (Right <<< ParsedData)
          Right $ Left $ GraphQLUserError errors possiblyParsedData

type RequestOptions =
  { headers :: Array Affjax.RequestHeader
  , username :: Maybe String
  , password :: Maybe String
  , withCredentials :: Boolean
  --, timeout :: Maybe Milliseconds
  }

defaultRequestOptions :: RequestOptions
defaultRequestOptions =
  { headers: []
  , username: Nothing
  , password: Nothing
  , withCredentials: false
  --, timeout: Nothing
  }

post :: Affjax.URL -> RequestOptions -> ArgonautCore.Json -> Aff (Either Affjax.Error (Affjax.Response ArgonautCore.Json))
post url requestOptions body = Affjax.request request
  where
  request :: Affjax.Request ArgonautCore.Json
  request =
    Record.merge requestOptions $
      (Affjax.defaultRequest
        { method = Left POST
        , url = url
        , content = Just $ Affjax.RequestBody.json $ ArgonautCodecs.Encode.encodeJson body
        , responseFormat = Affjax.ResponseFormat.json
        } :: Affjax.Request ArgonautCore.Json)

graphqlRequestImpl
  :: forall a
   . Affjax.URL
  -> RequestOptions
  -> String
  -> (ArgonautCore.Json -> Either JsonDecodeError a)
  -> Aff (Either (GraphQLError a) a)
graphqlRequestImpl url requestOptions query decoder = Transformers.runExceptT do
  (result :: Either Affjax.Error (Affjax.Response ArgonautCore.Json)) <- Transformers.lift $ post url requestOptions $ ArgonautCodecs.Encode.encodeJson { query }
  jsonBody <- case result of
    Left error -> Transformers.throwError $ GraphQLAffjaxError error
    Right response -> pure response.body
  -- | traceWithoutInspectM $ "[graphqlRequestImpl] jsonBody " <> ArgonautCore.stringifyWithIndent 2 jsonBody -- TODO: move outside
  except $ tryDecodeGraphQLResponse decoder jsonBody

-- graphqlRequestImplWithTrace
--   :: forall a
--    . Show a
--   => Affjax.URL
--   -> Array Affjax.RequestHeader
--   -> String
--   -> (ArgonautCore.Json -> Either JsonDecodeError a)
--   -> Aff (Either (GraphQLError a) a)
-- graphqlRequestImplWithTrace url headers query decoder = do
--   traceWithoutInspectM $ "[graphqlRequestImplWithTrace] query = " <> query
--   result <- graphqlRequestImpl url headers query decoder
--   case result of
--     Right output -> traceWithoutInspectM $ "[graphqlRequestImplWithTrace] output" <> show output
--     Left graphqlError -> traceWithoutInspectM $ "[graphqlRequestImplWithTrace] " <> printGraphQLError graphqlError
--   pure $ result

graphqlQueryRequest
  :: forall a
   . Affjax.URL
  -> RequestOptions
  -> SelectionSet Scope__RootQuery a
  -> Aff (Either (GraphQLError a) a)
graphqlQueryRequest url requestOptions selectionSet@(SelectionSet _fields decoder) = graphqlRequestImpl url requestOptions (writeGraphQL selectionSet) decoder

graphqlMutationRequest
  :: forall a
   . Affjax.URL
  -> RequestOptions
  -> SelectionSet Scope__RootMutation a
  -> Aff (Either (GraphQLError a) a)
graphqlMutationRequest url requestOptions selectionSet@(SelectionSet _fields decoder) = graphqlRequestImpl url requestOptions (writeGraphQL selectionSet) decoder
