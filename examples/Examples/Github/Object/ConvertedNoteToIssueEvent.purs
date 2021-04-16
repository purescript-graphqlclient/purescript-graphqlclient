module Examples.Github.Object.ConvertedNoteToIssueEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes (Scope__Actor, Scope__ConvertedNoteToIssueEvent)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__ConvertedNoteToIssueEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ConvertedNoteToIssueEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__ConvertedNoteToIssueEvent (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ConvertedNoteToIssueEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
