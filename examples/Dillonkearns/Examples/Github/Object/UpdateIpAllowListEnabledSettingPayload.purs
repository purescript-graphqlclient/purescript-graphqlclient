module Dillonkearns.Examples.Github.Object.UpdateIpAllowListEnabledSettingPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UpdateIpAllowListEnabledSettingPayload, Scope__IpAllowListOwner)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateIpAllowListEnabledSettingPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

owner
  :: forall r
   . SelectionSet Scope__IpAllowListOwner r
  -> SelectionSet Scope__UpdateIpAllowListEnabledSettingPayload (Maybe r)
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
