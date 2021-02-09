module Dillonkearns.Examples.Github.Object.IssueTimelineItemsEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__IssueTimelineItemsEdge, Scope__IssueTimelineItems)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__IssueTimelineItemsEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__IssueTimelineItems r
  -> SelectionSet Scope__IssueTimelineItemsEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
