module Examples.Github.Object.EnterpriseOutsideCollaboratorConnection where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__EnterpriseOutsideCollaboratorEdge
  , Scope__EnterpriseOutsideCollaboratorConnection
  , Scope__User
  , Scope__PageInfo
  )
import Data.Maybe
  ( Maybe
  )

edges :: forall r . SelectionSet Scope__EnterpriseOutsideCollaboratorEdge r -> SelectionSet Scope__EnterpriseOutsideCollaboratorConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField "edges" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__EnterpriseOutsideCollaboratorConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField "nodes" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo :: forall r . SelectionSet Scope__PageInfo r -> SelectionSet Scope__EnterpriseOutsideCollaboratorConnection r
pageInfo = selectionForCompositeField "pageInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__EnterpriseOutsideCollaboratorConnection Int
totalCount = selectionForField "totalCount" [] graphqlDefaultResponseScalarDecoder
