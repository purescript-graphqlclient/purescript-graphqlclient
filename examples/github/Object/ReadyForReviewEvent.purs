module Examples.Github.Object.ReadyForReviewEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__ReadyForReviewEvent
  , Scope__PullRequest
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  , Uri
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__ReadyForReviewEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ReadyForReviewEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ReadyForReviewEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__ReadyForReviewEvent r
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__ReadyForReviewEvent Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__ReadyForReviewEvent Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
