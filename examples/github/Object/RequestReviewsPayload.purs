module Examples.Github.Object.RequestReviewsPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__RequestReviewsPayload
  , Scope__PullRequest
  , Scope__UserEdge
  )
import Data.Maybe (Maybe)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__RequestReviewsPayload (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet Scope__RequestReviewsPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__RequestReviewsPayload (Maybe r)
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

requestedReviewersEdge
  :: forall r
   . SelectionSet Scope__UserEdge r
  -> SelectionSet Scope__RequestReviewsPayload (Maybe r)
requestedReviewersEdge = selectionForCompositeField
                         "requestedReviewersEdge"
                         []
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
