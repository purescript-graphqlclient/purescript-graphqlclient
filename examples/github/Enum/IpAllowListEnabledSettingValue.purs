module Examples.Github.Enum.IpAllowListEnabledSettingValue where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - IpAllowListEnabledSettingValue
data IpAllowListEnabledSettingValue
  = Enabled
  | Disabled

fromToMap :: Array (Tuple String IpAllowListEnabledSettingValue)
fromToMap = [Tuple "ENABLED" Enabled, Tuple "DISABLED" Disabled]

instance ipAllowListEnabledSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder IpAllowListEnabledSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder "IpAllowListEnabledSettingValue" fromToMap

instance ipAllowListEnabledSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue IpAllowListEnabledSettingValue where
  toGraphqlArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      Disabled -> ArgumentValueEnum "DISABLED"
