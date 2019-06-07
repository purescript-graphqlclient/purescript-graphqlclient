module Main where

import Prelude

import Affjax (ResponseFormatError, URL, request)
import Affjax.RequestBody as RequestBody
import Affjax.RequestHeader (RequestHeader(..))
import Affjax.ResponseFormat as ResponseFormat
import Data.Argonaut.Core (Json)
import Data.Either (Either(..))
import Data.HTTP.Method (Method(..))
import Data.Maybe (Maybe(..))
import Data.MediaType (MediaType(..))
import Data.String (joinWith)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class.Console (log)
import Simple.JSON (writeJSON)

newtype FieldName = FieldName String
newtype Fields a = Fields (Array a)

data SelectionSet = SelectionSet FieldName (Fields SelectionSet)

class GQLSerialize a where
  toGQL :: a -> String

instance gqlSerializeFieldName :: GQLSerialize FieldName where
  toGQL (FieldName s) = s

instance gqlSerializeFields :: (GQLSerialize a) => GQLSerialize (Fields a) where
  toGQL (Fields []) = ""
  toGQL (Fields a) = " { " <> (joinWith ", " (toGQL <$> a)) <> " } "

instance gqlSerializeSelectionSet :: GQLSerialize SelectionSet where
  toGQL (SelectionSet fn fs) = (toGQL fn) <> (toGQL fs)

testSet :: SelectionSet
testSet = SelectionSet
  (FieldName "query")
  (Fields [SelectionSet
            (FieldName "person")
            (Fields [SelectionSet (FieldName "name") (Fields [])])])

gqlHubQuery :: SelectionSet
gqlHubQuery = SelectionSet
  (FieldName "query")
  (Fields [ SelectionSet (FieldName "graphQLHub") (Fields []) ])

--post :: forall a. ResponseFormat a -> URL -> RequestBody -> Aff (Response (Either ResponseFormatError a))

executeGQL :: URL -> SelectionSet -> Aff (Either ResponseFormatError Json)
executeGQL url selectionSet = do
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
  pure response.body

main :: Effect Unit
main = launchAff_ $ do
  res <- executeGQL "https://www.graphqlhub.com/graphql" gqlHubQuery
  case res of
    Left _ -> log "uh oh"
    Right _ -> log "cool"
