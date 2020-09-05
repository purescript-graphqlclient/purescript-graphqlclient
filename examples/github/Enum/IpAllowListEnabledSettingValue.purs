module Examples.Github.Enum.IpAllowListEnabledSettingValue where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - IpAllowListEnabledSettingValue
data IpAllowListEnabledSettingValue = Enabled | Disabled

derive instance eqIpAllowListEnabledSettingValue :: Eq IpAllowListEnabledSettingValue

derive instance ordIpAllowListEnabledSettingValue :: Ord IpAllowListEnabledSettingValue

fromToMap :: Array (Tuple String IpAllowListEnabledSettingValue)
fromToMap = [ Tuple "ENABLED" Enabled, Tuple "DISABLED" Disabled ]

instance ipAllowListEnabledSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                              IpAllowListEnabledSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "IpAllowListEnabledSettingValue"
                                        fromToMap

instance ipAllowListEnabledSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                 IpAllowListEnabledSettingValue where
  toGraphqlArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      Disabled -> ArgumentValueEnum "DISABLED"
