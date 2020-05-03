module Fernet.HTTP where

import Data.Argonaut.Decode.Combinators
import Fernet.Graphql.SelectionSet
import Protolude

import Affjax as Affjax
import Affjax.RequestBody as Affjax.RequestBody
import Affjax.ResponseFormat as Affjax.ResponseFormat
import Affjax.StatusCode as Affjax
import Control.Monad.Error.Class as Transformers
import Control.Monad.Except as Transformers
import Control.Monad.Except.Trans as Transformers
import Control.Monad.Trans.Class as Transformers
import Data.Argonaut.Core as ArgonautCore
import Data.Argonaut.Decode (class DecodeJson, Decoder, JsonDecodeError(..), decodeJson, printJsonDecodeError)
import Data.Argonaut.Decode as ArgonautCodecs.Decode
import Data.Argonaut.Decode.Generic.Rep as ArgonautGeneric
import Data.Argonaut.Encode (class EncodeJson)
import Data.Argonaut.Encode as ArgonautCodecs.Encode
import Data.Argonaut.Encode.Generic.Rep as ArgonautGeneric
import Data.Generic.Rep as GenericRep
import Data.Generic.Rep.Show as GenericRep
import Data.HTTP.Method as HttpMethods
import Data.Int as Integers
import Data.Lazy as Lazy
import Data.Map as Data.Map
import Data.Newtype as Newtype
import Data.Void as Void
import Debug.Trace as Debug.Trace
import Effect.Class.Console as Console
import Effect.Exception as Exception
import Fernet.Graphql.WriteGraphql as Fernet.Graphql.WriteGraphql
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

newtype GraphqlErrorDetails =
  GraphqlErrorDetails
  { message :: String
  , otherDetails :: Object ArgonautCore.Json -- other unparsed error data, but without already parsed, e.g. locations or path
  -- , locations :: Maybe (Array Location)
  -- , path :: Array StringOrInt
  -- , extensions :: { code :: String, timestamp :: Date }
  }

derive instance newtypeGraphqlErrorRecord :: Newtype GraphqlErrorDetails _
derive instance genericGraphqlErrorRecord :: Generic GraphqlErrorDetails _

instance decodeJsonGraphqlErrorRecord :: DecodeJson GraphqlErrorDetails where
  decodeJson json = enhanceError do
     jsonObject <- decodeJson json
     (messageJson /\ otherDetails) <- Foreign.Object.pop "message" jsonObject # (note $ AtKey "message" $ MissingValue)
     (message :: String) <- decodeJson messageJson
     pure $ GraphqlErrorDetails { message, otherDetails }
    where
      enhanceError = lmap (Named "GraphqlErrorDetails")

instance encodeJsonGraphqlErrorRecord :: EncodeJson GraphqlErrorDetails where
  encodeJson = ArgonautGeneric.genericEncodeJson

data PossiblyParsedData parsed
  = ParsedData parsed
  | NoDataKey
  | UnparsedData JsonDecodeError ArgonautCore.Json

data GraphqlRawError parsed
  = AffjaxError       Affjax.Error
  -- | BadStatus         Affjax.StatusCode String -- status is not in >=200 && <=299 range
  | UnexpectedPayload JsonDecodeError ArgonautCore.Json -- json is not decoded at all
  | GraphqlError      (Array GraphqlErrorDetails) (PossiblyParsedData parsed)

type GraphqlResponse parsed = Either (GraphqlRawError parsed) parsed

printGraphqlError :: ∀ a . GraphqlRawError a -> String
printGraphqlError = case _ of
  AffjaxError affjaxError -> Affjax.printError affjaxError
  -- BadStatus statusCode statusText -> "Expected status in 200-299 range, but got " <> show statusCode <> " " <> statusText
  UnexpectedPayload error jsonBody -> intercalate "\n"
    [ "Unexpected payload:"
    , "  error = " <> printJsonDecodeError error
    , "  body = " <> ArgonautCore.stringifyWithIdentation 2 jsonBody
    ]
  GraphqlError errorsArray possiblyParsedData ->
    let errorsArray' = errorsArray <#> unwrap <#> _.message <#> ("  " <> _)
     in case possiblyParsedData of
         ParsedData _parsed -> intercalate "\n" $ ["Data is parsed, but there are graphql errors:"] <> errorsArray'
         NoDataKey -> intercalate "\n" $ ["Data is not present because of the graphql errors:"] <> errorsArray'
         UnparsedData dataDecoderError _json -> (intercalate "\n" $ ["Data cannot be parsed because of the graphql errors:"] <> errorsArray') <> printJsonDecodeError dataDecoderError
  where
  quote x = "\"" <> x <> "\""


tryDecodeGraphqlResponse :: ∀ parsed . Decoder parsed -> ArgonautCore.Json -> GraphqlResponse parsed
tryDecodeGraphqlResponse decoderForData jsonBody = (\error -> Left $ UnexpectedPayload error jsonBody) \/ identity $ go
  where
    go :: JsonDecodeError \/ GraphqlResponse parsed
    go = do
      (jsonObject :: Object ArgonautCore.Json) <- ArgonautCodecs.Decode.decodeJson jsonBody

      case Foreign.Object.lookup "errors" jsonObject of
        Just errorsJson -> do
          (errors :: Array GraphqlErrorDetails) <- decodeJson errorsJson
          (possiblyParsedData :: PossiblyParsedData parsed) <-
            case Foreign.Object.lookup "data" jsonObject of
              Nothing -> Right $ NoDataKey
              Just dataJson -> decoderForData dataJson # (\error -> Right $ UnparsedData error dataJson) \/ (Right <<< ParsedData)
          Right $ Left $ GraphqlError errors possiblyParsedData
        Nothing -> do
          (dataJson :: ArgonautCore.Json) <- jsonObject .: "data"
          parsed <- decoderForData dataJson
          Right $ Right parsed

post :: Affjax.URL -> ArgonautCore.Json -> Aff (Either Affjax.Error (Affjax.Response ArgonautCore.Json))
post url body = Affjax.post Affjax.ResponseFormat.json url (Just $ Affjax.RequestBody.json $ ArgonautCodecs.Encode.encodeJson body)

-- let (Affjax.StatusCode int) = response.status
--  in if between 200 299 int
--   then pure response.body
--   else Transformers.throwError $ BadStatus response.status response.statusText

gqlRequestImpl
  :: forall a
   . Affjax.URL
  -> String
  -> Decoder a
  -> Aff (GraphqlResponse a)
gqlRequestImpl url query decoder =
  Transformers.runExceptT do
    (result :: Either Affjax.Error (Affjax.Response ArgonautCore.Json)) <- Transformers.lift $ post url $ ArgonautCodecs.Encode.encodeJson { query }
    jsonBody <- case result of
      Left error -> Transformers.throwError $ AffjaxError error
      Right response -> pure response.body
    traceWithoutInspectM $ "[gqlRequest] jsonBody " <> ArgonautCore.stringifyWithIdentation 2 jsonBody
    except $ tryDecodeGraphqlResponse decoder jsonBody

gqlRequestImplWithTrace
  :: forall a
   . Show a
  => Affjax.URL
  -> String
  -> Decoder a
  -> Aff (GraphqlResponse a)
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
  -> SelectionSet RootQuery a
  -> Aff (GraphqlResponse a)
gqlRequest url selectionSet@(SelectionSet _fields decoder) = do
  let query = Fernet.Graphql.WriteGraphql.writeGraphql selectionSet
  result <- gqlRequestImpl url query decoder
  pure $ result

-- gqlRequestWithTrace
--   :: forall a
--    . Show a
--   => Affjax.URL
--   -> SelectionSet RootQuery a
--   -> Aff (Either GraphqlRawError a)
-- gqlRequest url selectionSet@(SelectionSet _fields decoder) = do
--   let query = writeGQL selectionSet
--   Debug.Trace.traceM $ "[gqlRequest] query = " <> query
--   result <- gqlRequestImpl url query decoder
--   case result of
--     Right output -> Debug.Trace.traceM $ "[gqlRequest] output" <> show output
--     Left graphqlError -> Debug.Trace.traceM $ "[gqlRequest]" <> printGraphqlError graphqlError
--   pure $ result
