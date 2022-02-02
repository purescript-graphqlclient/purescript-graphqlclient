module Examples.Github.Object.DeploymentReviewerEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeploymentReviewerEdge, Scope__DeploymentReviewer)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__DeploymentReviewerEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__DeploymentReviewer r
  -> SelectionSet Scope__DeploymentReviewerEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
