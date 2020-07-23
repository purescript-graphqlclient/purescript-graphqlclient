module Examples.Github.Object.ProjectCardConnection where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__ProjectCardEdge
  , Scope__ProjectCardConnection
  , Scope__ProjectCard
  , Scope__PageInfo
  )
import Data.Maybe
  ( Maybe
  )

edges :: forall r . SelectionSet Scope__ProjectCardEdge r -> SelectionSet Scope__ProjectCardConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField "edges" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet Scope__ProjectCard r -> SelectionSet Scope__ProjectCardConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField "nodes" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo :: forall r . SelectionSet Scope__PageInfo r -> SelectionSet Scope__ProjectCardConnection r
pageInfo = selectionForCompositeField "pageInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__ProjectCardConnection Int
totalCount = selectionForField "totalCount" [] graphqlDefaultResponseScalarDecoder
