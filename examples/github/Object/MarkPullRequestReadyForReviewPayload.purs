module Examples.Github.Object.MarkPullRequestReadyForReviewPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__MarkPullRequestReadyForReviewPayload
  , Scope__PullRequest
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__MarkPullRequestReadyForReviewPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__MarkPullRequestReadyForReviewPayload (Maybe r)
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
