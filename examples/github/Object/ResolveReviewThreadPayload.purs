module Examples.Github.Object.ResolveReviewThreadPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__ResolveReviewThreadPayload, Scope__PullRequestReviewThread)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__ResolveReviewThreadPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

thread :: forall r . SelectionSet
                     Scope__PullRequestReviewThread
                     r -> SelectionSet
                          Scope__ResolveReviewThreadPayload
                          (Maybe
                           r)
thread = selectionForCompositeField
         "thread"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
