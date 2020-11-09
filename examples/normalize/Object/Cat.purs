module Examples.Normalize.Object.Cat where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Normalize.Scopes (Scope__Cat)
import Examples.Normalize.Scalars (CatId)

id :: SelectionSet Scope__Cat CatId
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
