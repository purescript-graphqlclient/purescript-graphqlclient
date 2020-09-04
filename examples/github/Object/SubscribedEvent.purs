module Examples.Github.Object.SubscribedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__SubscribedEvent
  , Scope__Subscribable
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__SubscribedEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__SubscribedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__SubscribedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

subscribable :: forall r . SelectionSet Scope__Subscribable r -> SelectionSet Scope__SubscribedEvent r
subscribable = selectionForCompositeField "subscribable" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
