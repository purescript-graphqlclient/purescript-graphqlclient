module Dillonkearns.Examples.Github.Object.UnsubscribedEvent where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Actor, Scope__UnsubscribedEvent, Scope__Subscribable)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__UnsubscribedEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__UnsubscribedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__UnsubscribedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

subscribable
  :: forall r
   . SelectionSet Scope__Subscribable r
  -> SelectionSet Scope__UnsubscribedEvent r
subscribable = selectionForCompositeField
               "subscribable"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer
