module Examples.Normalize.Object.Dog where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Normalize.Scopes (Scope__Dog)
import Examples.Normalize.Scalars (DogId)

id :: SelectionSet Scope__Dog DogId
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
