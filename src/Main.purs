module Main where

import Prelude

import Affjax (ResponseFormatError)
import Control.Monad.Except (runExcept)
import Data.Either (Either(..))
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class.Console (log)
import Fernet.GraphQL.SelectionSet (SelectionSet(..), FieldName(..), Fields(..))
import Fernet.GraphQL.HTTP (gqlRequest)
import Foreign (F)


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


type Response = { data :: { graphQLHub :: String } }

main :: Effect Unit
main = launchAff_ $ do
  res <- (gqlRequest "https://www.graphqlhub.com/graphql" gqlHubQuery :: (Aff (Either ResponseFormatError (F Response))))
  case res of
    Left _ -> log "uh oh"
    Right fResponse ->
      case runExcept fResponse of
        Left _ -> log "uh oh oh"
        Right response -> log response.data.graphQLHub
