module Dillonkearns.Examples.Normalize.Object.Dog where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Normalize.Scopes (Scope__Dog)
import Dillonkearns.Examples.Normalize.Scalars (DogId)

id :: SelectionSet Scope__Dog DogId
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
