module Dillonkearns.Examples.Github.Object.DeleteBranchProtectionRulePayload where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes
  (Scope__DeleteBranchProtectionRulePayload)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__DeleteBranchProtectionRulePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
