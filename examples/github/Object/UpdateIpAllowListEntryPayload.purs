module Examples.Github.Object.UpdateIpAllowListEntryPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__UpdateIpAllowListEntryPayload, Scope__IpAllowListEntry)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__UpdateIpAllowListEntryPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

ipAllowListEntry :: forall r . SelectionSet
                               Scope__IpAllowListEntry
                               r -> SelectionSet
                                    Scope__UpdateIpAllowListEntryPayload
                                    (Maybe
                                     r)
ipAllowListEntry = selectionForCompositeField
                   "ipAllowListEntry"
                   []
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer
