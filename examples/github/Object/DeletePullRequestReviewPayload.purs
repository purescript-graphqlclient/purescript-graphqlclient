module Examples.Github.Object.DeletePullRequestReviewPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeletePullRequestReviewPayload, Scope__PullRequestReview)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__DeletePullRequestReviewPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

pullRequestReview
  :: forall r
   . SelectionSet Scope__PullRequestReview r
  -> SelectionSet Scope__DeletePullRequestReviewPayload (Maybe r)
pullRequestReview = selectionForCompositeField
                    "pullRequestReview"
                    []
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer
