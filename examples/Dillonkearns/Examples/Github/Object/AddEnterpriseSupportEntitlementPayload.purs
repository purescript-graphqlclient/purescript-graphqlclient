module Dillonkearns.Examples.Github.Object.AddEnterpriseSupportEntitlementPayload where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes
  (Scope__AddEnterpriseSupportEntitlementPayload)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__AddEnterpriseSupportEntitlementPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

message
  :: SelectionSet
     Scope__AddEnterpriseSupportEntitlementPayload
     (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
