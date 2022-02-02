module Examples.Github.Object.UpdateIpAllowListForInstalledAppsEnabledSettingPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdateIpAllowListForInstalledAppsEnabledSettingPayload
  , Scope__IpAllowListOwner
  )
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateIpAllowListForInstalledAppsEnabledSettingPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

owner
  :: forall r
   . SelectionSet Scope__IpAllowListOwner r
  -> SelectionSet
        Scope__UpdateIpAllowListForInstalledAppsEnabledSettingPayload
        (Maybe r)
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
