module Dillonkearns.Examples.Github.Object.AddPullRequestReviewThreadPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
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
