module Examples.Github.Object.DeletePullRequestReviewCommentPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeletePullRequestReviewCommentPayload, Scope__PullRequestReview)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__DeletePullRequestReviewCommentPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

pullRequestReview :: forall r . SelectionSet
                                Scope__PullRequestReview
                                r -> SelectionSet
                                     Scope__DeletePullRequestReviewCommentPayload
                                     (Maybe
                                      r)
pullRequestReview = selectionForCompositeField
                    "pullRequestReview"
                    []
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer
