module Examples.Github.Object.PullRequestTimelineConnection where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__PullRequestTimelineItemEdge
  , Scope__PullRequestTimelineConnection
  , Scope__PullRequestTimelineItem
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges :: forall r . SelectionSet
                    Scope__PullRequestTimelineItemEdge
                    r -> SelectionSet
                         Scope__PullRequestTimelineConnection
                         (Maybe
                          (Array
                           (Maybe
                            r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet
                    Scope__PullRequestTimelineItem
                    r -> SelectionSet
                         Scope__PullRequestTimelineConnection
                         (Maybe
                          (Array
                           (Maybe
                            r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo :: forall r . SelectionSet
                       Scope__PageInfo
                       r -> SelectionSet
                            Scope__PullRequestTimelineConnection
                            r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__PullRequestTimelineConnection Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
