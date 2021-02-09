module Dillonkearns.Examples.Github.Object.BaseRefChangedEvent where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Actor, Scope__BaseRefChangedEvent, Scope__PullRequest)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__BaseRefChangedEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__BaseRefChangedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

currentRefName :: SelectionSet Scope__BaseRefChangedEvent String
currentRefName = selectionForField
                 "currentRefName"
                 []
                 graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__BaseRefChangedEvent (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__BaseRefChangedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

previousRefName :: SelectionSet Scope__BaseRefChangedEvent String
previousRefName = selectionForField
                  "previousRefName"
                  []
                  graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__BaseRefChangedEvent r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
