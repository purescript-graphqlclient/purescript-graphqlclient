module Dillonkearns.Examples.Github.Object.SubmitPullRequestReviewPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__SubmitPullRequestReviewPayload, Scope__PullRequestReview)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__SubmitPullRequestReviewPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

pullRequestReview
  :: forall r
   . SelectionSet Scope__PullRequestReview r
  -> SelectionSet Scope__SubmitPullRequestReviewPayload (Maybe r)
pullRequestReview = selectionForCompositeField
                    "pullRequestReview"
                    []
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer
