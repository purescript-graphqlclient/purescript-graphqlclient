module Dillonkearns.Examples.Github.Object.DeleteRefPayload where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__DeleteRefPayload)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__DeleteRefPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
