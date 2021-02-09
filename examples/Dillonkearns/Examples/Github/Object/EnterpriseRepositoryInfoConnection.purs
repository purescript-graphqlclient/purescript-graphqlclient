module Dillonkearns.Examples.Github.Object.EnterpriseRepositoryInfoConnection where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__EnterpriseRepositoryInfoEdge
  , Scope__EnterpriseRepositoryInfoConnection
  , Scope__EnterpriseRepositoryInfo
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges
  :: forall r
   . SelectionSet Scope__EnterpriseRepositoryInfoEdge r
  -> SelectionSet
        Scope__EnterpriseRepositoryInfoConnection
        (Maybe (Array (Maybe r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes
  :: forall r
   . SelectionSet Scope__EnterpriseRepositoryInfo r
  -> SelectionSet
        Scope__EnterpriseRepositoryInfoConnection
        (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo
  :: forall r
   . SelectionSet Scope__PageInfo r
  -> SelectionSet Scope__EnterpriseRepositoryInfoConnection r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__EnterpriseRepositoryInfoConnection Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
