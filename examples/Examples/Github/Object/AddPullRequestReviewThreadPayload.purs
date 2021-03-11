module Examples.Github.Object.AddPullRequestReviewThreadPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__AddPullRequestReviewThreadPayload, Scope__PullRequestReviewThread)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__AddPullRequestReviewThreadPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

thread
  :: forall r
   . SelectionSet Scope__PullRequestReviewThread r
  -> SelectionSet Scope__AddPullRequestReviewThreadPayload (Maybe r)
thread = selectionForCompositeField
         "thread"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
