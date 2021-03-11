module Examples.Normalize.Object.ListId where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Normalize.Scopes (Scope__ListId)
import Data.Maybe (Maybe)
import Examples.Normalize.Scalars (DogId)

id :: SelectionSet Scope__ListId (Maybe (Array (Maybe DogId)))
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
