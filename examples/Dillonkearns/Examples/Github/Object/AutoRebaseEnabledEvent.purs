module Dillonkearns.Examples.Github.Object.AutoRebaseEnabledEvent where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Actor, Scope__AutoRebaseEnabledEvent, Scope__User, Scope__PullRequest)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__AutoRebaseEnabledEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__AutoRebaseEnabledEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

enabler
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__AutoRebaseEnabledEvent (Maybe r)
enabler = selectionForCompositeField
          "enabler"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__AutoRebaseEnabledEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__AutoRebaseEnabledEvent (Maybe r)
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
