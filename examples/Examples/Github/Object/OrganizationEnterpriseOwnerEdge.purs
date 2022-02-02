module Examples.Github.Object.OrganizationEnterpriseOwnerEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__OrganizationEnterpriseOwnerEdge, Scope__User)
import Data.Maybe (Maybe)
import Examples.Github.Enum.RoleInOrganization (RoleInOrganization)

cursor :: SelectionSet Scope__OrganizationEnterpriseOwnerEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__OrganizationEnterpriseOwnerEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationRole
  :: SelectionSet
     Scope__OrganizationEnterpriseOwnerEdge
     RoleInOrganization
organizationRole = selectionForField
                   "organizationRole"
                   []
                   graphqlDefaultResponseScalarDecoder
