module Examples.Github.Enum.EnterpriseMembersCanMakePurchasesSettingValue where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      Enabled -> ArgumentValueEnum "ENABLED"
      Disabled -> ArgumentValueEnum "DISABLED"
