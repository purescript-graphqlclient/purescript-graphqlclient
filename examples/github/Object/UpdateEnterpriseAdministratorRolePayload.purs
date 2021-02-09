module Examples.Github.Object.UpdateEnterpriseAdministratorRolePayload where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__UpdateEnterpriseAdministratorRolePayload)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateEnterpriseAdministratorRolePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

message
  :: SelectionSet
     Scope__UpdateEnterpriseAdministratorRolePayload
     (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
