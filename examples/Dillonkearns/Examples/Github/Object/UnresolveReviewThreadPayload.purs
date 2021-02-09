module Dillonkearns.Examples.Github.Object.UnresolveReviewThreadPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UnresolveReviewThreadPayload, Scope__PullRequestReviewThread)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UnresolveReviewThreadPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

thread
  :: forall r
   . SelectionSet Scope__PullRequestReviewThread r
  -> SelectionSet Scope__UnresolveReviewThreadPayload (Maybe r)
thread = selectionForCompositeField
         "thread"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
