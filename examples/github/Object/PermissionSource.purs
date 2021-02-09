module Examples.Github.Object.PermissionSource where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Organization, Scope__PermissionSource, Scope__PermissionGranter)
import Examples.Github.Enum.DefaultRepositoryPermissionField
  (DefaultRepositoryPermissionField)

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__PermissionSource r
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

permission
  :: SelectionSet
     Scope__PermissionSource
     DefaultRepositoryPermissionField
permission = selectionForField
             "permission"
             []
             graphqlDefaultResponseScalarDecoder

source
  :: forall r
   . SelectionSet Scope__PermissionGranter r
  -> SelectionSet Scope__PermissionSource r
source = selectionForCompositeField
         "source"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
