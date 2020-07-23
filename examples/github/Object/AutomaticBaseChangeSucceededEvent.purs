module Examples.Github.Object.AutomaticBaseChangeSucceededEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__AutomaticBaseChangeSucceededEvent
  , Scope__PullRequest
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__AutomaticBaseChangeSucceededEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__AutomaticBaseChangeSucceededEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__AutomaticBaseChangeSucceededEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

newBase :: SelectionSet Scope__AutomaticBaseChangeSucceededEvent String
newBase = selectionForField "newBase" [] graphqlDefaultResponseScalarDecoder

oldBase :: SelectionSet Scope__AutomaticBaseChangeSucceededEvent String
oldBase = selectionForField "oldBase" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__AutomaticBaseChangeSucceededEvent r
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
