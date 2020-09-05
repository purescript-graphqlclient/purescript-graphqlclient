module Examples.Github.Object.EnterpriseOrganizationMembershipEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__EnterpriseOrganizationMembershipEdge, Scope__Organization)
import Data.Maybe (Maybe)
import Examples.Github.Enum.EnterpriseUserAccountMembershipRole
  (EnterpriseUserAccountMembershipRole)

cursor :: SelectionSet Scope__EnterpriseOrganizationMembershipEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__Organization
                   r -> SelectionSet
                        Scope__EnterpriseOrganizationMembershipEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

role :: SelectionSet
        Scope__EnterpriseOrganizationMembershipEdge
        EnterpriseUserAccountMembershipRole
role = selectionForField "role" [] graphqlDefaultResponseScalarDecoder
