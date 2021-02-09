module Dillonkearns.Examples.Github.Object.UserContentEditEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UserContentEditEdge, Scope__UserContentEdit)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__UserContentEditEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__UserContentEdit r
  -> SelectionSet Scope__UserContentEditEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
