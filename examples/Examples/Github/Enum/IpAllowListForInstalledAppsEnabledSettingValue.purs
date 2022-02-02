module Examples.Github.Enum.IpAllowListForInstalledAppsEnabledSettingValue where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - IpAllowListForInstalledAppsEnabledSettingValue
data IpAllowListForInstalledAppsEnabledSettingValue = Enabled | Disabled

derive instance genericIpAllowListForInstalledAppsEnabledSettingValue
  ::
  Generic IpAllowListForInstalledAppsEnabledSettingValue _

instance showIpAllowListForInstalledAppsEnabledSettingValue
  :: Show IpAllowListForInstalledAppsEnabledSettingValue where
  show = genericShow

derive instance eqIpAllowListForInstalledAppsEnabledSettingValue
  ::
  Eq IpAllowListForInstalledAppsEnabledSettingValue

derive instance ordIpAllowListForInstalledAppsEnabledSettingValue
  ::
  Ord IpAllowListForInstalledAppsEnabledSettingValue

fromToMap :: Array (Tuple String IpAllowListForInstalledAppsEnabledSettingValue)
fromToMap = [ Tuple "ENABLED" Enabled, Tuple "DISABLED" Disabled ]

instance ipAllowListForInstalledAppsEnabledSettingValueGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder
     IpAllowListForInstalledAppsEnabledSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "IpAllowListForInstalledAppsEnabledSettingValue"
                                        fromToMap

instance ipAllowListForInstalledAppsEnabledSettingValueToGraphQLArgumentValue
  :: ToGraphQLArgumentValue IpAllowListForInstalledAppsEnabledSettingValue where
  toGraphQLArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      Disabled -> ArgumentValueEnum "DISABLED"
