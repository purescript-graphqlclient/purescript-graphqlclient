module Dillonkearns.Examples.Github.Object.UnmarkedAsDuplicateEvent where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Actor, Scope__UnmarkedAsDuplicateEvent, Scope__IssueOrPullRequest)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__UnmarkedAsDuplicateEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

canonical
  :: forall r
   . SelectionSet Scope__IssueOrPullRequest r
  -> SelectionSet Scope__UnmarkedAsDuplicateEvent (Maybe r)
canonical = selectionForCompositeField
            "canonical"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__UnmarkedAsDuplicateEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

duplicate
  :: forall r
   . SelectionSet Scope__IssueOrPullRequest r
  -> SelectionSet Scope__UnmarkedAsDuplicateEvent (Maybe r)
duplicate = selectionForCompositeField
            "duplicate"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__UnmarkedAsDuplicateEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isCrossRepository :: SelectionSet Scope__UnmarkedAsDuplicateEvent Boolean
isCrossRepository = selectionForField
                    "isCrossRepository"
                    []
                    graphqlDefaultResponseScalarDecoder
