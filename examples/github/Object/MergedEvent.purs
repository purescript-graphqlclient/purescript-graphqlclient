module Examples.Github.Object.MergedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__MergedEvent
  , Scope__Commit
  , Scope__Ref
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

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__MergedEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__MergedEvent (Maybe r)
commit = selectionForCompositeField "commit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__MergedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__MergedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

mergeRef :: forall r . SelectionSet Scope__Ref r -> SelectionSet Scope__MergedEvent (Maybe r)
mergeRef = selectionForCompositeField "mergeRef" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mergeRefName :: SelectionSet Scope__MergedEvent String
mergeRefName = selectionForField "mergeRefName" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__MergedEvent r
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__MergedEvent Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__MergedEvent Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
