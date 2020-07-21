module Examples.Github.Enum.EnterpriseEnabledDisabledSettingValue where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseEnabledDisabledSettingValue
data EnterpriseEnabledDisabledSettingValue
  = Enabled
  | Disabled
  | NoPolicy

fromToMap :: Array (Tuple String EnterpriseEnabledDisabledSettingValue)
fromToMap = [Tuple "ENABLED" Enabled, Tuple "DISABLED" Disabled, Tuple "NO_POLICY" NoPolicy]

instance enterpriseEnabledDisabledSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseEnabledDisabledSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseEnabledDisabledSettingValue" fromToMap

instance enterpriseEnabledDisabledSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseEnabledDisabledSettingValue where
  toGraphqlArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      Disabled -> ArgumentValueEnum "DISABLED"
      NoPolicy -> ArgumentValueEnum "NO_POLICY"
