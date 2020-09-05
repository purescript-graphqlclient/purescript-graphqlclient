module Examples.Github.Object.LockLockablePayload where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__LockLockablePayload, Scope__Lockable)
import Data.Maybe (Maybe)

actor :: forall r . SelectionSet
                    Scope__Actor
                    r -> SelectionSet
                         Scope__LockLockablePayload
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet Scope__LockLockablePayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

lockedRecord :: forall r . SelectionSet
                           Scope__Lockable
                           r -> SelectionSet
                                Scope__LockLockablePayload
                                (Maybe
                                 r)
lockedRecord = selectionForCompositeField
               "lockedRecord"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer
