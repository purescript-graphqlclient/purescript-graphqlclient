module Dillonkearns.Examples.Github.Enum.IdentityProviderConfigurationState where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - IdentityProviderConfigurationState
data IdentityProviderConfigurationState = Enforced | Configured | Unconfigured

derive instance genericIdentityProviderConfigurationState
  ::
  Generic IdentityProviderConfigurationState _

instance showIdentityProviderConfigurationState
  :: Show IdentityProviderConfigurationState where
  show = genericShow

derive instance eqIdentityProviderConfigurationState
  ::
  Eq IdentityProviderConfigurationState

derive instance ordIdentityProviderConfigurationState
  ::
  Ord IdentityProviderConfigurationState

fromToMap :: Array (Tuple String IdentityProviderConfigurationState)
fromToMap = [ Tuple "ENFORCED" Enforced
            , Tuple "CONFIGURED" Configured
            , Tuple "UNCONFIGURED" Unconfigured
            ]

instance identityProviderConfigurationStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder
     IdentityProviderConfigurationState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "IdentityProviderConfigurationState"
                                        fromToMap

instance identityProviderConfigurationStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue IdentityProviderConfigurationState where
  toGraphQLArgumentValue =
    case _ of
      Enforced -> ArgumentValueEnum "ENFORCED"
      Configured -> ArgumentValueEnum "CONFIGURED"
      Unconfigured -> ArgumentValueEnum "UNCONFIGURED"
