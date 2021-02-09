module Dillonkearns.Examples.Normalize.Object.Cat where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Normalize.Scopes (Scope__Cat)
import Dillonkearns.Examples.Normalize.Scalars (CatId)

id :: SelectionSet Scope__Cat CatId
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
