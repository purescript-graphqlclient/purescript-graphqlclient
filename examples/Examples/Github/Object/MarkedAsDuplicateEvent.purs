module Examples.Github.Object.MarkedAsDuplicateEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__MarkedAsDuplicateEvent, Scope__IssueOrPullRequest)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__MarkedAsDuplicateEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

canonical
  :: forall r
   . SelectionSet Scope__IssueOrPullRequest r
  -> SelectionSet Scope__MarkedAsDuplicateEvent (Maybe r)
canonical = selectionForCompositeField
            "canonical"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__MarkedAsDuplicateEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

duplicate
  :: forall r
   . SelectionSet Scope__IssueOrPullRequest r
  -> SelectionSet Scope__MarkedAsDuplicateEvent (Maybe r)
duplicate = selectionForCompositeField
            "duplicate"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__MarkedAsDuplicateEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isCrossRepository :: SelectionSet Scope__MarkedAsDuplicateEvent Boolean
isCrossRepository = selectionForField
                    "isCrossRepository"
                    []
                    graphqlDefaultResponseScalarDecoder
