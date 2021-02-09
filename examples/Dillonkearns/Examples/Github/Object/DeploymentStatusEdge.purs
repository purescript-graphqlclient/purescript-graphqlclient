module Dillonkearns.Examples.Github.Object.DeploymentStatusEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__DeploymentStatusEdge, Scope__DeploymentStatus)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__DeploymentStatusEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__DeploymentStatus r
  -> SelectionSet Scope__DeploymentStatusEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
