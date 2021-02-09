module Dillonkearns.GraphQLClient.HTTP where

import Prelude
import Affjax (Error, Response, Request, URL, defaultRequest, printError, request) as Affjax
import Affjax.RequestBody as Affjax.RequestBody
import Affjax.RequestHeader (RequestHeader) as Affjax
import Affjax.ResponseFormat as Affjax.ResponseFormat
import Control.Monad.Except (except)
import Control.Monad.Except.Trans (runExceptT, throwError) as Transformers
import Control.Monad.Trans.Class (lift) as Transformers
import Data.Argonaut.Core (jsonNull)
import Data.Argonaut.Core as ArgonautCore
import Data.Argonaut.Decode (class DecodeJson, JsonDecodeError(..), printJsonDecodeError)
import Data.Argonaut.Decode.Decoders (decodeJObject, decodeNonEmptyArray, decodeString) as Data.Argonaut.Decode.Decoders
import Data.Argonaut.Encode (class EncodeJson)
import Data.Argonaut.Encode as ArgonautCodecs.Encode
import Data.Argonaut.Encode.Generic as ArgonautGeneric
import Data.Array (intercalate)
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty (toArray) as NonEmptyArray
import Data.Bifunctor (lmap)
import Data.Either (Either(..), either, note)
import Data.Generic.Rep (class Generic)
import Data.HTTP.Method (Method(..))
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, unwrap)
import Data.Time.Duration (Milliseconds)
import Data.Tuple (Tuple(..))
import Effect.Aff (Aff)
import Foreign.Object (Object)
import Foreign.Object as Foreign.Object
import Dillonkearns.GraphQLClient.Implementation (Scope__RootMutation, Scope__RootQuery, SelectionSet(..))
import Dillonkearns.GraphQLClient.WriteGraphQL (writeGraphQL)
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
newtype GraphQLError__UserDetail
  = GraphQLError__UserDetail
  { message :: String
  , otherDetails :: Object ArgonautCore.Json -- other unparsed error data, but without already parsed, e.g. locations or path
  -- , locations :: Maybe (Array { line :: Int, column :: Int })
  -- , path :: Array StringOrInt
  -- , extensions :: { code :: String, timestamp :: Date }
  }

derive instance newtypeGraphQLError__UserDetail :: Newtype GraphQLError__UserDetail _

derive instance genericGraphQLError__UserDetail :: Generic GraphQLError__UserDetail _

derive newtype instance eqGraphQLError__UserDetail :: Eq GraphQLError__UserDetail

decodeGraphQLError__UserDetail :: ArgonautCore.Json -> Either JsonDecodeError GraphQLError__UserDetail
decodeGraphQLError__UserDetail json =
  lmap (Named "GraphQLError__UserDetail") do
    jsonObject <- Data.Argonaut.Decode.Decoders.decodeJObject json
    (Tuple messageJson otherDetails) <- Foreign.Object.pop "message" jsonObject # (note $ AtKey "message" $ MissingValue)
    (message :: String) <- Data.Argonaut.Decode.Decoders.decodeString messageJson
    pure $ GraphQLError__UserDetail { message, otherDetails }

instance decodeJsonGraphQLError__UserDetail :: DecodeJson GraphQLError__UserDetail where
  decodeJson = decodeGraphQLError__UserDetail

instance encodeJsonGraphQLErrorRecord :: EncodeJson GraphQLError__UserDetail where
  encodeJson = ArgonautGeneric.genericEncodeJson

data PossiblyParsedData parsed
  = PossiblyParsedData__ParsedData parsed
  | PossiblyParsedData__NoDataKey
  | PossiblyParsedData__UnparsedData JsonDecodeError ArgonautCore.Json

data GraphQLError parsed
  -- | GraphQLError__BadStatus         Affjax.StatusCode String -- status is not in >=200 && <=299 range
  = GraphQLError__Affjax Affjax.Error
  | GraphQLError__UnexpectedPayload JsonDecodeError ArgonautCore.Json -- json is not decoded at all
  | GraphQLError__User (NonEmptyArray GraphQLError__UserDetail) (PossiblyParsedData parsed)

printGraphQLError :: ∀ a. GraphQLError a -> String
printGraphQLError = case _ of
  GraphQLError__Affjax affjaxError -> Affjax.printError affjaxError
  GraphQLError__UnexpectedPayload error jsonBody ->
    intercalate "\n"
      [ "Unexpected payload:"
      , "  error = " <> printJsonDecodeError error
      , "  body = " <> ArgonautCore.stringifyWithIndent 2 jsonBody
      ]
  GraphQLError__User errorsArray pissiblyParsedData ->
    let
      errorsArray' = NonEmptyArray.toArray $ map (unwrap >>> _.message >>> ("  " <> _)) errorsArray
    in
      case pissiblyParsedData of
        PossiblyParsedData__ParsedData _parsed -> intercalate "\n" $ [ "Data is parsed, but there are graphql errors:" ] <> errorsArray'
        PossiblyParsedData__NoDataKey -> intercalate "\n" $ [ "Data is not present because of the graphql errors:" ] <> errorsArray'
        PossiblyParsedData__UnparsedData dataDecoderError _json -> (intercalate "\n" $ [ "Data cannot be parsed because of the graphql errors:" ] <> errorsArray') <> printJsonDecodeError dataDecoderError

errorsOrBodyDecoder :: ArgonautCore.Json -> Either JsonDecodeError (Either { errors :: NonEmptyArray GraphQLError__UserDetail, dataJson :: ArgonautCore.Json } ArgonautCore.Json)
errorsOrBodyDecoder json = do
  (jsonObject :: Object ArgonautCore.Json) <- Data.Argonaut.Decode.Decoders.decodeJObject json
  let
    maybeErrorJson = Foreign.Object.lookup "errors" jsonObject

    maybeDataJson = Foreign.Object.lookup "data" jsonObject -- http://spec.graphql.org/draft/#sec-Errors
  case maybeDataJson of
    -- not present -> errors should be NonEmptyArray
    Nothing -> case maybeErrorJson of
      Nothing -> Left $ AtKey "errors" MissingValue
      Just errorsJson -> do
        (nonEmptyArrayErrors :: NonEmptyArray GraphQLError__UserDetail) <- Data.Argonaut.Decode.Decoders.decodeNonEmptyArray decodeGraphQLError__UserDetail errorsJson
        pure $ Left { errors: nonEmptyArrayErrors, dataJson: jsonNull }
    -- present (including null) -> errors can be present and NonEmptyArray OR no errors
    Just dataJson -> do
      case maybeErrorJson of
        Nothing -> pure $ Right dataJson
        Just errorsJson -> do
          (nonEmptyArrayErrors :: NonEmptyArray GraphQLError__UserDetail) <- Data.Argonaut.Decode.Decoders.decodeNonEmptyArray decodeGraphQLError__UserDetail errorsJson
          pure $ Left { errors: nonEmptyArrayErrors, dataJson }

tryDecodeGraphQLResponse :: ∀ parsed. (ArgonautCore.Json -> Either JsonDecodeError parsed) -> ArgonautCore.Json -> Either (GraphQLError parsed) parsed
tryDecodeGraphQLResponse decoderForData jsonBody = graphqlResponseOrError # either (\error -> Left $ GraphQLError__UnexpectedPayload error jsonBody) identity
  where
  graphqlResponseOrError :: Either JsonDecodeError (Either (GraphQLError parsed) parsed)
  graphqlResponseOrError = do
    errorsOrBodyDecoder jsonBody
      >>= case _ of
          Right dataJson -> do
            parsed <- decoderForData dataJson
            Right $ Right parsed
          Left { errors, dataJson } -> do
            (pissiblyParsedData :: PossiblyParsedData parsed) <- decoderForData dataJson # either (\error -> Right $ PossiblyParsedData__UnparsedData error dataJson) (Right <<< PossiblyParsedData__ParsedData)
            Right $ Left $ GraphQLError__User errors pissiblyParsedData

type RequestOptions
  = { headers :: Array Affjax.RequestHeader
    , username :: Maybe String
    , password :: Maybe String
    , withCredentials :: Boolean
    , timeout :: Maybe Milliseconds
    }

defaultRequestOptions :: RequestOptions
defaultRequestOptions =
  { headers: []
  , username: Nothing
  , password: Nothing
  , withCredentials: false
  , timeout: Nothing
  }

post :: Affjax.URL -> RequestOptions -> ArgonautCore.Json -> Aff (Either Affjax.Error (Affjax.Response ArgonautCore.Json))
post url requestOptions body = Affjax.request request
  where
  request :: Affjax.Request ArgonautCore.Json
  request =
    Record.merge requestOptions
      $ ( Affjax.defaultRequest
            { method = Left POST
            , url = url
            , content = Just $ Affjax.RequestBody.json $ ArgonautCodecs.Encode.encodeJson body
            , responseFormat = Affjax.ResponseFormat.json
            } ::
            Affjax.Request ArgonautCore.Json
        )

graphqlRequestImpl ::
  forall a.
  Affjax.URL ->
  RequestOptions ->
  String ->
  (ArgonautCore.Json -> Either JsonDecodeError a) ->
  Aff (Either (GraphQLError a) a)
graphqlRequestImpl url requestOptions query decoder =
  Transformers.runExceptT do
    (result :: Either Affjax.Error (Affjax.Response ArgonautCore.Json)) <- Transformers.lift $ post url requestOptions $ ArgonautCodecs.Encode.encodeJson { query }
    jsonBody <- case result of
      Left error -> Transformers.throwError $ GraphQLError__Affjax error
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
graphqlQueryRequest ::
  forall a.
  Affjax.URL ->
  RequestOptions ->
  SelectionSet Scope__RootQuery a ->
  Aff (Either (GraphQLError a) a)
graphqlQueryRequest url requestOptions selectionSet@(SelectionSet _fields decoder) = graphqlRequestImpl url requestOptions (writeGraphQL selectionSet) decoder

graphqlMutationRequest ::
  forall a.
  Affjax.URL ->
  RequestOptions ->
  SelectionSet Scope__RootMutation a ->
  Aff (Either (GraphQLError a) a)
graphqlMutationRequest url requestOptions selectionSet@(SelectionSet _fields decoder) = graphqlRequestImpl url requestOptions (writeGraphQL selectionSet) decoder
