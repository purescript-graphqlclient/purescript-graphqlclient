module Fernet.HTTP where

import Prelude
import Affjax (ResponseFormatError(..), URL, request)
import Affjax.RequestBody as RequestBody
import Affjax.RequestHeader (RequestHeader(..))
import Affjax.ResponseFormat as ResponseFormat
import Data.Argonaut.Core (stringify)
import Data.Bifunctor (lmap)
import Data.Either (Either(..))
import Data.HTTP.Method (Method(..))
import Data.List.NonEmpty (singleton)
import Data.Maybe (Maybe(..))
import Data.MediaType (MediaType(..))
import Effect.Aff (Aff)
import Fernet.GraphQL.SelectionSet (RootQuery, SelectionSet)
import Fernet.GraphQL.WriteGraphQL (writeGQL)
import Foreign (MultipleErrors)
import Simple.JSON (class ReadForeign, readJSON, writeJSON)

transformError :: ResponseFormatError -> MultipleErrors
transformError (ResponseFormatError e _) = singleton e

gqlRequest ::
  forall row.
  ReadForeign (Record row) =>
  URL ->
  (SelectionSet row RootQuery) ->
  Aff (Either MultipleErrors { data :: (Record row) })
gqlRequest url selectionSet = do
  response <-
    request
      { method: Left POST
      , url
      , headers: [ ContentType (MediaType "application/json") ]
      , content: Just $ RequestBody.string (writeJSON { query: writeGQL selectionSet })
      , username: Nothing
      , password: Nothing
      , withCredentials: false
      , responseFormat: ResponseFormat.json
      }
  pure $ (lmap transformError (stringify <$> response.body)) >>= readJSON
