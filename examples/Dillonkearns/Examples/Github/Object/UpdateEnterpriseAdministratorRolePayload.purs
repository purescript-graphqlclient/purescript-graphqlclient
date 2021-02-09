module Dillonkearns.Examples.Github.Object.UpdateEnterpriseAdministratorRolePayload where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes
  (Scope__UpdateEnterpriseAdministratorRolePayload)
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
