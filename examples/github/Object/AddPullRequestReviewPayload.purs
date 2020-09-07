module Examples.Github.Object.AddPullRequestReviewPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__AddPullRequestReviewPayload
  , Scope__PullRequestReview
  , Scope__PullRequestReviewEdge
  )
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__AddPullRequestReviewPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

pullRequestReview :: forall r . SelectionSet
                                Scope__PullRequestReview
                                r -> SelectionSet
                                     Scope__AddPullRequestReviewPayload
                                     (Maybe
                                      r)
pullRequestReview = selectionForCompositeField
                    "pullRequestReview"
                    []
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

reviewEdge :: forall r . SelectionSet
                         Scope__PullRequestReviewEdge
                         r -> SelectionSet
                              Scope__AddPullRequestReviewPayload
                              (Maybe
                               r)
reviewEdge = selectionForCompositeField
             "reviewEdge"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
