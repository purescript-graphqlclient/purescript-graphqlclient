module Examples.Github.Object.RepositoryCollaboratorEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__RepositoryCollaboratorEdge
  , Scope__User
  , Scope__PermissionSource
  )
import Examples.Github.Enum.RepositoryPermission
  ( RepositoryPermission
  )
import Data.Maybe
  ( Maybe
  )

cursor :: SelectionSet Scope__RepositoryCollaboratorEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__RepositoryCollaboratorEdge r
node = selectionForCompositeField "node" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

permission :: SelectionSet Scope__RepositoryCollaboratorEdge RepositoryPermission
permission = selectionForField "permission" [] graphqlDefaultResponseScalarDecoder

permissionSources :: forall r . SelectionSet Scope__PermissionSource r -> SelectionSet Scope__RepositoryCollaboratorEdge (Maybe (Array r))
permissionSources = selectionForCompositeField "permissionSources" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
