module Examples.Normalize.Object.MaybeId where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Normalize.Scopes (Scope__MaybeId)
import Data.Maybe (Maybe)
import Examples.Normalize.Scalars (DogId)

id :: SelectionSet Scope__MaybeId (Maybe DogId)
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
