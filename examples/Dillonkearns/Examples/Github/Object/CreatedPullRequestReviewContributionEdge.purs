module Dillonkearns.Examples.Github.Object.CreatedPullRequestReviewContributionEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__CreatedPullRequestReviewContributionEdge
  , Scope__CreatedPullRequestReviewContribution
  )
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__CreatedPullRequestReviewContributionEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__CreatedPullRequestReviewContribution r
  -> SelectionSet Scope__CreatedPullRequestReviewContributionEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
