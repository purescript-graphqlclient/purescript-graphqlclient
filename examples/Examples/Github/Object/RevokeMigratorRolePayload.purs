module Examples.Github.Object.RevokeMigratorRolePayload where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__RevokeMigratorRolePayload)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__RevokeMigratorRolePayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

success :: SelectionSet Scope__RevokeMigratorRolePayload (Maybe Boolean)
success = selectionForField "success" [] graphqlDefaultResponseScalarDecoder
