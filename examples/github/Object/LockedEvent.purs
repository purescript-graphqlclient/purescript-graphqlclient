module Examples.Github.Object.LockedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__LockedEvent
  , Scope__Lockable
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  )
import Examples.Github.Enum.LockReason
  ( LockReason
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__LockedEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__LockedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__LockedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

lockReason :: SelectionSet Scope__LockedEvent (Maybe LockReason)
lockReason = selectionForField "lockReason" [] graphqlDefaultResponseScalarDecoder

lockable :: forall r . SelectionSet Scope__Lockable r -> SelectionSet Scope__LockedEvent r
lockable = selectionForCompositeField "lockable" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
