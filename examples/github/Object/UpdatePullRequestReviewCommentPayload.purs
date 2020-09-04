module Examples.Github.Object.UpdatePullRequestReviewCommentPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdatePullRequestReviewCommentPayload
  , Scope__PullRequestReviewComment
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__UpdatePullRequestReviewCommentPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

pullRequestReviewComment :: forall r . SelectionSet Scope__PullRequestReviewComment r -> SelectionSet Scope__UpdatePullRequestReviewCommentPayload (Maybe r)
pullRequestReviewComment = selectionForCompositeField "pullRequestReviewComment" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
