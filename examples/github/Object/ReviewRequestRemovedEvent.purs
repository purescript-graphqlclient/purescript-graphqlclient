module Examples.Github.Object.ReviewRequestRemovedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__ReviewRequestRemovedEvent
  , Scope__PullRequest
  , Scope__RequestedReviewer
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__ReviewRequestRemovedEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ReviewRequestRemovedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ReviewRequestRemovedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__ReviewRequestRemovedEvent r
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

requestedReviewer :: forall r . SelectionSet Scope__RequestedReviewer r -> SelectionSet Scope__ReviewRequestRemovedEvent (Maybe r)
requestedReviewer = selectionForCompositeField "requestedReviewer" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
