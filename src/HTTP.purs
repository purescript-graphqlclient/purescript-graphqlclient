module Fernet.HTTP where

import Data.Either
import Data.Maybe
import Effect
import Effect.Aff
import Effect.Aff.Class
import Effect.Class
import Prelude
import Affjax as Affjax
import Affjax.RequestBody as Affjax.RequestBody
import Affjax.ResponseFormat as Affjax.ResponseFormat
import Control.Monad.Error.Class as Transformers
import Control.Monad.Except as Transformers
import Control.Monad.Except.Trans as Transformers
import Control.Monad.Trans.Class as Transformers
import Data.Argonaut.Core as ArgonautCore
import Data.Argonaut.Decode as ArgonautCodecs
import Data.Argonaut.Decode.Generic.Rep as ArgonautGeneric
import Data.Argonaut.Encode as ArgonautCodecs
import Data.Argonaut.Encode.Generic.Rep as ArgonautGeneric
import Data.Generic.Rep as GenericRep
import Data.Generic.Rep.Show as GenericRep
import Data.HTTP.Method as HttpMethods
import Data.Int as Integers
import Data.Lazy as Lazy
import Data.Newtype as Newtype
import Data.Void as Void
import Debug.Trace as Debug.Trace
import Effect.Class.Console as Console
import Effect.Exception as Exception
import Fernet.GraphQL.SelectionSet (RootQuery, SelectionSet)
import Fernet.GraphQL.WriteGraphQL (writeGQL)

data GraphqlError
  = AffjaxError Affjax.Error
  | JsonDecodeError String ArgonautCore.Json

printGraphqlError :: GraphqlError -> String
printGraphqlError = case _ of
  AffjaxError affjaxError -> Affjax.printError affjaxError
  JsonDecodeError error json -> "Json decode error:\n  error = " <> quote error <> "\n  json = " <> ArgonautCore.stringifyWithIdentation 2 json
  where
  quote x = "\"" <> x <> "\""

gqlRequest ::
  forall row.
  ArgonautCodecs.DecodeJson (Record row) =>
  Affjax.URL ->
  (SelectionSet row RootQuery) ->
  Aff (Either GraphqlError { data :: Record row })
gqlRequest url selectionSet =
  Transformers.runExceptT do
    let
      query = writeGQL selectionSet
    Debug.Trace.traceM $ "[gqlRequest] query = " <> query
    result <-
      Transformers.lift
        $ Affjax.post
            Affjax.ResponseFormat.json
            url
            (Just $ Affjax.RequestBody.json $ ArgonautCodecs.encodeJson { query })
    case result of
      Left error -> do
        let
          graphqlError = AffjaxError error
        Debug.Trace.traceM $ "[gqlRequest]" <> printGraphqlError graphqlError
        Transformers.throwError graphqlError
      Right response ->
        let
          (json :: ArgonautCore.Json) = response.body
        in
          case ArgonautCodecs.decodeJson json of
            Left error -> do
              let
                graphqlError = JsonDecodeError error json
              Debug.Trace.traceM $ "[gqlRequest]" <> printGraphqlError graphqlError
              Transformers.throwError graphqlError
            Right output -> pure output
