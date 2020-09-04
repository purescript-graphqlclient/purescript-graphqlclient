module Examples.Github.Object.HeadRefForcePushedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__HeadRefForcePushedEvent
  , Scope__Commit
  , Scope__PullRequest
  , Scope__Ref
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__HeadRefForcePushedEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

afterCommit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__HeadRefForcePushedEvent (Maybe r)
afterCommit = selectionForCompositeField "afterCommit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

beforeCommit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__HeadRefForcePushedEvent (Maybe r)
beforeCommit = selectionForCompositeField "beforeCommit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__HeadRefForcePushedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__HeadRefForcePushedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__HeadRefForcePushedEvent r
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ref :: forall r . SelectionSet Scope__Ref r -> SelectionSet Scope__HeadRefForcePushedEvent (Maybe r)
ref = selectionForCompositeField "ref" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
