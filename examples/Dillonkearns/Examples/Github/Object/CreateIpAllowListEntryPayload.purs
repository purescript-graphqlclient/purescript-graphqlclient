module Dillonkearns.Examples.Github.Object.CreateIpAllowListEntryPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__CreateIpAllowListEntryPayload, Scope__IpAllowListEntry)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__CreateIpAllowListEntryPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

ipAllowListEntry
  :: forall r
   . SelectionSet Scope__IpAllowListEntry r
  -> SelectionSet Scope__CreateIpAllowListEntryPayload (Maybe r)
ipAllowListEntry = selectionForCompositeField
                   "ipAllowListEntry"
                   []
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer
