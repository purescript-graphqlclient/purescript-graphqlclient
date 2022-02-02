module Examples.Github.Object.GrantMigratorRolePayload where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__GrantMigratorRolePayload)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__GrantMigratorRolePayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

success :: SelectionSet Scope__GrantMigratorRolePayload (Maybe Boolean)
success = selectionForField "success" [] graphqlDefaultResponseScalarDecoder
