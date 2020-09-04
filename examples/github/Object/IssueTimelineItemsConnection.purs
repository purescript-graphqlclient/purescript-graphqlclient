module Examples.Github.Object.IssueTimelineItemsConnection where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__IssueTimelineItemsEdge
  , Scope__IssueTimelineItemsConnection
  , Scope__IssueTimelineItems
  , Scope__PageInfo
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  )

edges :: forall r . SelectionSet Scope__IssueTimelineItemsEdge r -> SelectionSet Scope__IssueTimelineItemsConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField "edges" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

filteredCount :: SelectionSet Scope__IssueTimelineItemsConnection Int
filteredCount = selectionForField "filteredCount" [] graphqlDefaultResponseScalarDecoder

nodes :: forall r . SelectionSet Scope__IssueTimelineItems r -> SelectionSet Scope__IssueTimelineItemsConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField "nodes" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageCount :: SelectionSet Scope__IssueTimelineItemsConnection Int
pageCount = selectionForField "pageCount" [] graphqlDefaultResponseScalarDecoder

pageInfo :: forall r . SelectionSet Scope__PageInfo r -> SelectionSet Scope__IssueTimelineItemsConnection r
pageInfo = selectionForCompositeField "pageInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__IssueTimelineItemsConnection Int
totalCount = selectionForField "totalCount" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__IssueTimelineItemsConnection DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
