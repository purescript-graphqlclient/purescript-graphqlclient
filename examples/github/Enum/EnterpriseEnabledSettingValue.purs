module Examples.Github.Enum.EnterpriseEnabledSettingValue where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseEnabledSettingValue
data EnterpriseEnabledSettingValue
  = Enabled
  | NoPolicy

fromToMap :: Array (Tuple String EnterpriseEnabledSettingValue)
fromToMap = [Tuple "ENABLED" Enabled, Tuple "NO_POLICY" NoPolicy]

instance enterpriseEnabledSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseEnabledSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseEnabledSettingValue" fromToMap

instance enterpriseEnabledSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseEnabledSettingValue where
  toGraphqlArgumentValue =
    case _ of
      Enabled -> ArgumentValueString "ENABLED"
      NoPolicy -> ArgumentValueString "NO_POLICY"
