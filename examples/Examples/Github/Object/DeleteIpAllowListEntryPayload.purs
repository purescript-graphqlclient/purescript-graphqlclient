module Examples.Github.Object.DeleteIpAllowListEntryPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeleteIpAllowListEntryPayload, Scope__IpAllowListEntry)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__DeleteIpAllowListEntryPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

ipAllowListEntry
  :: forall r
   . SelectionSet Scope__IpAllowListEntry r
  -> SelectionSet Scope__DeleteIpAllowListEntryPayload (Maybe r)
ipAllowListEntry = selectionForCompositeField
                   "ipAllowListEntry"
                   []
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer
