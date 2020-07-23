module Examples.Github.Object.UnlockLockablePayload where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__UnlockLockablePayload
  , Scope__Lockable
  )
import Data.Maybe
  ( Maybe
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__UnlockLockablePayload (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet Scope__UnlockLockablePayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

unlockedRecord :: forall r . SelectionSet Scope__Lockable r -> SelectionSet Scope__UnlockLockablePayload (Maybe r)
unlockedRecord = selectionForCompositeField "unlockedRecord" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
