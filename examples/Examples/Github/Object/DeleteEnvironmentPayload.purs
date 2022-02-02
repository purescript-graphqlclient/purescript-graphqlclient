module Examples.Github.Object.DeleteEnvironmentPayload where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__DeleteEnvironmentPayload)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__DeleteEnvironmentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
