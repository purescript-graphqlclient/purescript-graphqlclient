module Dillonkearns.Examples.Github.Object.PinnableItemConnection where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__PinnableItemEdge
  , Scope__PinnableItemConnection
  , Scope__PinnableItem
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges
  :: forall r
   . SelectionSet Scope__PinnableItemEdge r
  -> SelectionSet Scope__PinnableItemConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes
  :: forall r
   . SelectionSet Scope__PinnableItem r
  -> SelectionSet Scope__PinnableItemConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo
  :: forall r
   . SelectionSet Scope__PageInfo r
  -> SelectionSet Scope__PinnableItemConnection r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__PinnableItemConnection Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
