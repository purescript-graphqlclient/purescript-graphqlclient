module Examples.Github.Object.PinnedIssueConnection where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__PinnedIssueEdge
  , Scope__PinnedIssueConnection
  , Scope__PinnedIssue
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges
  :: forall r
   . SelectionSet Scope__PinnedIssueEdge r
  -> SelectionSet Scope__PinnedIssueConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes
  :: forall r
   . SelectionSet Scope__PinnedIssue r
  -> SelectionSet Scope__PinnedIssueConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo
  :: forall r
   . SelectionSet Scope__PageInfo r
  -> SelectionSet Scope__PinnedIssueConnection r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__PinnedIssueConnection Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
