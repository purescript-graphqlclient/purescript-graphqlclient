module Examples.Github.Object.PinnedIssueEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__PinnedIssueEdge, Scope__PinnedIssue)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__PinnedIssueEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__PinnedIssue r
  -> SelectionSet Scope__PinnedIssueEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
