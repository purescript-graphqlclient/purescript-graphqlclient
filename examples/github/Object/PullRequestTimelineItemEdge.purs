module Examples.Github.Object.PullRequestTimelineItemEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__PullRequestTimelineItemEdge, Scope__PullRequestTimelineItem)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__PullRequestTimelineItemEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__PullRequestTimelineItem
                   r -> SelectionSet
                        Scope__PullRequestTimelineItemEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
