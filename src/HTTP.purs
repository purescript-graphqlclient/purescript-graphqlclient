module Fernet.HTTP where

import Prelude
import Data.Either
import Data.Maybe
import Effect
import Effect.Class
import Effect.Aff
import Effect.Aff.Class
import Affjax as Affjax
import Affjax.RequestBody as Affjax.RequestBody
import Affjax.ResponseFormat as Affjax.ResponseFormat
import Control.Monad.Error.Class as Transformers
import Control.Monad.Except as Transformers
import Control.Monad.Except.Trans as Transformers
import Control.Monad.Trans.Class as Transformers
import Data.Argonaut.Core as ArgonautCore
import Data.Argonaut.Decode as ArgonautCodecs
import Data.Argonaut.Encode as ArgonautCodecs
import Data.Argonaut.Decode.Generic.Rep as ArgonautGeneric
import Data.Argonaut.Encode.Generic.Rep as ArgonautGeneric
import Data.HTTP.Method as HttpMethods
import Data.Int as Integers
import Data.Lazy as Lazy
import Data.Newtype as Newtype
import Data.Void as Void
import Effect.Class.Console as Console
import Effect.Exception as Exception
import Fernet.GraphQL.SelectionSet (RootQuery, SelectionSet)
import Fernet.GraphQL.WriteGraphQL (writeGQL)
import Data.Generic.Rep as GenericRep
import Data.Generic.Rep.Show as GenericRep

data GraphqlError
  = AffjaxError Affjax.Error
  | JsonDecodeError String ArgonautCore.Json

printGraphqlError :: GraphqlError -> String
printGraphqlError = case _ of
  AffjaxError affjaxError -> Affjax.printError affjaxError
  JsonDecodeError error json -> error

gqlRequest ::
  forall row.
  ArgonautCodecs.DecodeJson (Record row) =>
  Affjax.URL ->
  (SelectionSet row RootQuery) ->
  Aff (Either GraphqlError { data :: Record row })
gqlRequest url selectionSet =
  Transformers.runExceptT do
    result <-
      Transformers.lift
        $ Affjax.post
            Affjax.ResponseFormat.json
            url
            (Just $ Affjax.RequestBody.json $ ArgonautCodecs.encodeJson { query: writeGQL selectionSet })
    case result of
      Left error -> Transformers.throwError $ AffjaxError error
      Right response ->
        let
          (json :: ArgonautCore.Json) = response.body
        in
          case ArgonautCodecs.decodeJson json of
            Left error -> Transformers.throwError $ JsonDecodeError error json
            Right output -> pure output
