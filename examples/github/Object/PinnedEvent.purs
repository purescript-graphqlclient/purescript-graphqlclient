module Examples.Github.Object.PinnedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__PinnedEvent
  , Scope__Issue
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__PinnedEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__PinnedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__PinnedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

issue :: forall r . SelectionSet Scope__Issue r -> SelectionSet Scope__PinnedEvent r
issue = selectionForCompositeField "issue" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
