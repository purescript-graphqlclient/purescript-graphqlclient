module Examples.Github.Object.ReopenedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__ReopenedEvent
  , Scope__Closable
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__ReopenedEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

closable :: forall r . SelectionSet Scope__Closable r -> SelectionSet Scope__ReopenedEvent r
closable = selectionForCompositeField "closable" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ReopenedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ReopenedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
