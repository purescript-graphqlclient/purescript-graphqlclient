module Dillonkearns.Examples.Normalize.Object.ListId where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Normalize.Scopes (Scope__ListId)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Normalize.Scalars (DogId)

id :: SelectionSet Scope__ListId (Maybe (Array (Maybe DogId)))
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
