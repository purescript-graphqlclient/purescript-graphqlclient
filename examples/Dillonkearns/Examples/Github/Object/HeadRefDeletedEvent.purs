module Dillonkearns.Examples.Github.Object.HeadRefDeletedEvent where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Actor, Scope__HeadRefDeletedEvent, Scope__Ref, Scope__PullRequest)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__HeadRefDeletedEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__HeadRefDeletedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

headRef
  :: forall r
   . SelectionSet Scope__Ref r
  -> SelectionSet Scope__HeadRefDeletedEvent (Maybe r)
headRef = selectionForCompositeField
          "headRef"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

headRefName :: SelectionSet Scope__HeadRefDeletedEvent String
headRefName = selectionForField
              "headRefName"
              []
              graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__HeadRefDeletedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__HeadRefDeletedEvent r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
