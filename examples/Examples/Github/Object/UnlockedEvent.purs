module Examples.Github.Object.UnlockedEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__UnlockedEvent, Scope__Lockable)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__UnlockedEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__UnlockedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__UnlockedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

lockable
  :: forall r
   . SelectionSet Scope__Lockable r
  -> SelectionSet Scope__UnlockedEvent r
lockable = selectionForCompositeField
           "lockable"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer
