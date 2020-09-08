module Examples.Github.Object.PullRequestTimelineItemsConnection where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__PullRequestTimelineItemsEdge
  , Scope__PullRequestTimelineItemsConnection
  , Scope__PullRequestTimelineItems
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime)

edges :: forall r . SelectionSet
                    Scope__PullRequestTimelineItemsEdge
                    r -> SelectionSet
                         Scope__PullRequestTimelineItemsConnection
                         (Maybe
                          (Array
                           (Maybe
                            r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

filteredCount :: SelectionSet Scope__PullRequestTimelineItemsConnection Int
filteredCount = selectionForField
                "filteredCount"
                []
                graphqlDefaultResponseScalarDecoder

nodes :: forall r . SelectionSet
                    Scope__PullRequestTimelineItems
                    r -> SelectionSet
                         Scope__PullRequestTimelineItemsConnection
                         (Maybe
                          (Array
                           (Maybe
                            r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageCount :: SelectionSet Scope__PullRequestTimelineItemsConnection Int
pageCount = selectionForField "pageCount" [] graphqlDefaultResponseScalarDecoder

pageInfo :: forall r . SelectionSet
                       Scope__PageInfo
                       r -> SelectionSet
                            Scope__PullRequestTimelineItemsConnection
                            r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__PullRequestTimelineItemsConnection Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__PullRequestTimelineItemsConnection DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
