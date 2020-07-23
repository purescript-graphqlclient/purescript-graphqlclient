module Examples.Github.Object.SubmoduleConnection where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__SubmoduleEdge
  , Scope__SubmoduleConnection
  , Scope__Submodule
  , Scope__PageInfo
  )
import Data.Maybe
  ( Maybe
  )

edges :: forall r . SelectionSet Scope__SubmoduleEdge r -> SelectionSet Scope__SubmoduleConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField "edges" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet Scope__Submodule r -> SelectionSet Scope__SubmoduleConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField "nodes" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo :: forall r . SelectionSet Scope__PageInfo r -> SelectionSet Scope__SubmoduleConnection r
pageInfo = selectionForCompositeField "pageInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__SubmoduleConnection Int
totalCount = selectionForField "totalCount" [] graphqlDefaultResponseScalarDecoder
