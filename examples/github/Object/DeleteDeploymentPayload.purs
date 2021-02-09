module Examples.Github.Object.DeleteDeploymentPayload where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__DeleteDeploymentPayload)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__DeleteDeploymentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
