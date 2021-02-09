module Dillonkearns.Examples.Github.Object.PullRequestReviewThreadEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__PullRequestReviewThreadEdge, Scope__PullRequestReviewThread)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__PullRequestReviewThreadEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__PullRequestReviewThread r
  -> SelectionSet Scope__PullRequestReviewThreadEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
