module Examples.Github.Object.PullRequestTimelineItemsEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__PullRequestTimelineItemsEdge, Scope__PullRequestTimelineItems)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__PullRequestTimelineItemsEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__PullRequestTimelineItems
                   r -> SelectionSet
                        Scope__PullRequestTimelineItemsEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
