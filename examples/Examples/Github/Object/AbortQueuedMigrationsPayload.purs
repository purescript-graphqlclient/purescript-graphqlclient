module Examples.Github.Object.AbortQueuedMigrationsPayload where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__AbortQueuedMigrationsPayload)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__AbortQueuedMigrationsPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

success :: SelectionSet Scope__AbortQueuedMigrationsPayload (Maybe Boolean)
success = selectionForField "success" [] graphqlDefaultResponseScalarDecoder
