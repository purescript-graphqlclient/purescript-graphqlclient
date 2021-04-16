module Examples.Github.Object.PinnedIssue where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__PinnedIssue, Scope__Issue, Scope__Actor, Scope__Repository)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id)

databaseId :: SelectionSet Scope__PinnedIssue (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__PinnedIssue Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

issue
  :: forall r
   . SelectionSet Scope__Issue r
  -> SelectionSet Scope__PinnedIssue r
issue = selectionForCompositeField
        "issue"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pinnedBy
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__PinnedIssue r
pinnedBy = selectionForCompositeField
           "pinnedBy"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__PinnedIssue r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
