module Examples.Github.Object.DeploymentReviewEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeploymentReviewEdge, Scope__DeploymentReview)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__DeploymentReviewEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__DeploymentReview r
  -> SelectionSet Scope__DeploymentReviewEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
