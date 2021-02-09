module Dillonkearns.Examples.Github.Object.RemoveEnterpriseSupportEntitlementPayload where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes
  (Scope__RemoveEnterpriseSupportEntitlementPayload)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__RemoveEnterpriseSupportEntitlementPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

message
  :: SelectionSet
     Scope__RemoveEnterpriseSupportEntitlementPayload
     (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
