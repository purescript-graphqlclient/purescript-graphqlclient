module Examples.Github.Object.UpdatePullRequestReviewPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdatePullRequestReviewPayload
  , Scope__PullRequestReview
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__UpdatePullRequestReviewPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

pullRequestReview :: forall r . SelectionSet Scope__PullRequestReview r -> SelectionSet Scope__UpdatePullRequestReviewPayload (Maybe r)
pullRequestReview = selectionForCompositeField "pullRequestReview" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
