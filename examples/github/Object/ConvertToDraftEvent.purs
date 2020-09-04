module Examples.Github.Object.ConvertToDraftEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__ConvertToDraftEvent
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

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__ConvertToDraftEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ConvertToDraftEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ConvertToDraftEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__ConvertToDraftEvent r
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__ConvertToDraftEvent Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__ConvertToDraftEvent Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
