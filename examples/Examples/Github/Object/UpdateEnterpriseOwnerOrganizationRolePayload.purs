module Examples.Github.Object.UpdateEnterpriseOwnerOrganizationRolePayload where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes
  (Scope__UpdateEnterpriseOwnerOrganizationRolePayload)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateEnterpriseOwnerOrganizationRolePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

message
  :: SelectionSet
     Scope__UpdateEnterpriseOwnerOrganizationRolePayload
     (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
