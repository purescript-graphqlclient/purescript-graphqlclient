module Examples.Github.Object.AddPullRequestReviewCommentPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__AddPullRequestReviewCommentPayload
  , Scope__PullRequestReviewComment
  , Scope__PullRequestReviewCommentEdge
  )
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__AddPullRequestReviewCommentPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

comment :: forall r . SelectionSet
                      Scope__PullRequestReviewComment
                      r -> SelectionSet
                           Scope__AddPullRequestReviewCommentPayload
                           (Maybe
                            r)
comment = selectionForCompositeField
          "comment"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commentEdge :: forall r . SelectionSet
                          Scope__PullRequestReviewCommentEdge
                          r -> SelectionSet
                               Scope__AddPullRequestReviewCommentPayload
                               (Maybe
                                r)
commentEdge = selectionForCompositeField
              "commentEdge"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
