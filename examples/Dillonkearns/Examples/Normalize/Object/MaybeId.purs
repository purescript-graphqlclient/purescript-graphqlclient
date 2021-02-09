module Dillonkearns.Examples.Normalize.Object.MaybeId where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Normalize.Scopes (Scope__MaybeId)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Normalize.Scalars (DogId)

id :: SelectionSet Scope__MaybeId (Maybe DogId)
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
