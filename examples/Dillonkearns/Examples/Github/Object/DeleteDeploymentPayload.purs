module Dillonkearns.Examples.Github.Object.DeleteDeploymentPayload where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__DeleteDeploymentPayload)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__DeleteDeploymentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
