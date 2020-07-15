module Examples.Github.Enum.EnterpriseMembersCanMakePurchasesSettingValue where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseMembersCanMakePurchasesSettingValue
data EnterpriseMembersCanMakePurchasesSettingValue
  = Enabled
  | Disabled

fromToMap :: Array (Tuple String EnterpriseMembersCanMakePurchasesSettingValue)
fromToMap = [Tuple "ENABLED" Enabled, Tuple "DISABLED" Disabled]

instance enterpriseMembersCanMakePurchasesSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseMembersCanMakePurchasesSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseMembersCanMakePurchasesSettingValue" fromToMap

instance enterpriseMembersCanMakePurchasesSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseMembersCanMakePurchasesSettingValue where
  toGraphqlArgumentValue =
    case _ of
      Enabled -> ArgumentValueString "ENABLED"
      Disabled -> ArgumentValueString "DISABLED"
