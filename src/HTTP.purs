module Fernet.GraphQL.HTTP where

import Prelude

import Affjax (ResponseFormatError, URL, request)
import Affjax.RequestBody as RequestBody
import Affjax.RequestHeader (RequestHeader(..))
import Affjax.ResponseFormat as ResponseFormat
import Data.Argonaut.Core (stringify)
import Data.Either (Either(..))
import Data.HTTP.Method (Method(..))
import Data.Maybe (Maybe(..))
import Data.MediaType (MediaType(..))
import Effect.Aff (Aff )
import Fernet.GraphQL.SelectionSet (SelectionSet)
import Fernet.GraphQL.GQLSerialize (toGQL)
import Foreign (F)
import Simple.JSON (class ReadForeign, readJSON', writeJSON)

gqlRequest ::forall a. ReadForeign a => URL -> SelectionSet -> Aff (Either ResponseFormatError (F a))
gqlRequest url selectionSet = do
  response <- request
    { method: Left POST
    , url
    , headers: [ ContentType (MediaType "application/json") ]
    , content: Just $ RequestBody.string (writeJSON { query: toGQL selectionSet })
    , username: Nothing
    , password: Nothing
    , withCredentials: false
    , responseFormat: ResponseFormat.json
    }
  pure $ readJSON' <$> (stringify <$> response.body)
