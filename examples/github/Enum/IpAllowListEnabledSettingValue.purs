module Examples.Github.Enum.IpAllowListEnabledSettingValue where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - IpAllowListEnabledSettingValue
data IpAllowListEnabledSettingValue = Enabled | Disabled

derive instance genericIpAllowListEnabledSettingValue :: Generic IpAllowListEnabledSettingValue _

instance showIpAllowListEnabledSettingValue :: Show
                                               IpAllowListEnabledSettingValue where
  show = genericShow

derive instance eqIpAllowListEnabledSettingValue :: Eq IpAllowListEnabledSettingValue

derive instance ordIpAllowListEnabledSettingValue :: Ord IpAllowListEnabledSettingValue

fromToMap :: Array (Tuple String IpAllowListEnabledSettingValue)
fromToMap = [ Tuple "ENABLED" Enabled, Tuple "DISABLED" Disabled ]

instance ipAllowListEnabledSettingValueGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                              IpAllowListEnabledSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "IpAllowListEnabledSettingValue"
                                        fromToMap

instance ipAllowListEnabledSettingValueToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                 IpAllowListEnabledSettingValue where
  toGraphQLArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      Disabled -> ArgumentValueEnum "DISABLED"
