module Examples.Github.Object.FollowingConnection where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__UserEdge
  , Scope__FollowingConnection
  , Scope__User
  , Scope__PageInfo
  )
import Data.Maybe
  ( Maybe
  )

edges :: forall r . SelectionSet Scope__UserEdge r -> SelectionSet Scope__FollowingConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField "edges" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__FollowingConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField "nodes" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo :: forall r . SelectionSet Scope__PageInfo r -> SelectionSet Scope__FollowingConnection r
pageInfo = selectionForCompositeField "pageInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__FollowingConnection Int
totalCount = selectionForField "totalCount" [] graphqlDefaultResponseScalarDecoder
