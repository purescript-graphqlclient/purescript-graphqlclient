module Dillonkearns.Examples.Github.Object.ProjectColumnEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__ProjectColumnEdge, Scope__ProjectColumn)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__ProjectColumnEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__ProjectColumn r
  -> SelectionSet Scope__ProjectColumnEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
