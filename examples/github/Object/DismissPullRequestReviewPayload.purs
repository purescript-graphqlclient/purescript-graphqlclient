module Examples.Github.Object.DismissPullRequestReviewPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DismissPullRequestReviewPayload, Scope__PullRequestReview)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__DismissPullRequestReviewPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

pullRequestReview :: forall r . SelectionSet
                                Scope__PullRequestReview
                                r -> SelectionSet
                                     Scope__DismissPullRequestReviewPayload
                                     (Maybe
                                      r)
pullRequestReview = selectionForCompositeField
                    "pullRequestReview"
                    []
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer
