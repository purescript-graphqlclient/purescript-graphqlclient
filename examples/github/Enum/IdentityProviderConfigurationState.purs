module Examples.Github.Enum.IdentityProviderConfigurationState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - IdentityProviderConfigurationState
data IdentityProviderConfigurationState
  = Enforced
  | Configured
  | Unconfigured

fromToMap :: Array (Tuple String IdentityProviderConfigurationState)
fromToMap = [Tuple "ENFORCED" Enforced, Tuple "CONFIGURED" Configured, Tuple "UNCONFIGURED" Unconfigured]

instance identityProviderConfigurationStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder IdentityProviderConfigurationState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "IdentityProviderConfigurationState" fromToMap

instance identityProviderConfigurationStateToGraphqlArgumentValue :: ToGraphqlArgumentValue IdentityProviderConfigurationState where
  toGraphqlArgumentValue =
    case _ of
      Enforced -> ArgumentValueString "ENFORCED"
      Configured -> ArgumentValueString "CONFIGURED"
      Unconfigured -> ArgumentValueString "UNCONFIGURED"
