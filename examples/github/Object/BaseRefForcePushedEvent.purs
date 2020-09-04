module Examples.Github.Object.BaseRefForcePushedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__BaseRefForcePushedEvent
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

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__BaseRefForcePushedEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

afterCommit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__BaseRefForcePushedEvent (Maybe r)
afterCommit = selectionForCompositeField "afterCommit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

beforeCommit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__BaseRefForcePushedEvent (Maybe r)
beforeCommit = selectionForCompositeField "beforeCommit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__BaseRefForcePushedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__BaseRefForcePushedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__BaseRefForcePushedEvent r
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ref :: forall r . SelectionSet Scope__Ref r -> SelectionSet Scope__BaseRefForcePushedEvent (Maybe r)
ref = selectionForCompositeField "ref" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
