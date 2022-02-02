module Examples.Github.Object.DeploymentRequestEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeploymentRequestEdge, Scope__DeploymentRequest)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__DeploymentRequestEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__DeploymentRequest r
  -> SelectionSet Scope__DeploymentRequestEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
