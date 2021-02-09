module Dillonkearns.Examples.Github.Object.CheckAnnotationConnection where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__CheckAnnotationEdge
  , Scope__CheckAnnotationConnection
  , Scope__CheckAnnotation
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges
  :: forall r
   . SelectionSet Scope__CheckAnnotationEdge r
  -> SelectionSet Scope__CheckAnnotationConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes
  :: forall r
   . SelectionSet Scope__CheckAnnotation r
  -> SelectionSet Scope__CheckAnnotationConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo
  :: forall r
   . SelectionSet Scope__PageInfo r
  -> SelectionSet Scope__CheckAnnotationConnection r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__CheckAnnotationConnection Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
