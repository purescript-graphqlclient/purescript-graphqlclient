module Dillonkearns.Examples.Github.Object.RegenerateVerifiableDomainTokenPayload where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes
  (Scope__RegenerateVerifiableDomainTokenPayload)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__RegenerateVerifiableDomainTokenPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

verificationToken
  :: SelectionSet
     Scope__RegenerateVerifiableDomainTokenPayload
     (Maybe String)
verificationToken = selectionForField
                    "verificationToken"
                    []
                    graphqlDefaultResponseScalarDecoder
