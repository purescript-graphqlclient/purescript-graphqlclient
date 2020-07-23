module Examples.Github.Object.UnresolveReviewThreadPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UnresolveReviewThreadPayload
  , Scope__PullRequestReviewThread
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__UnresolveReviewThreadPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

thread :: forall r . SelectionSet Scope__PullRequestReviewThread r -> SelectionSet Scope__UnresolveReviewThreadPayload (Maybe r)
thread = selectionForCompositeField "thread" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
