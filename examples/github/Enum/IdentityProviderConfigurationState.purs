module Examples.Github.Enum.IdentityProviderConfigurationState where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      Enforced -> ArgumentValueEnum "ENFORCED"
      Configured -> ArgumentValueEnum "CONFIGURED"
      Unconfigured -> ArgumentValueEnum "UNCONFIGURED"
