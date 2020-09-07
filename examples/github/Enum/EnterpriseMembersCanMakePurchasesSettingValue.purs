module Examples.Github.Enum.EnterpriseMembersCanMakePurchasesSettingValue where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseMembersCanMakePurchasesSettingValue
data EnterpriseMembersCanMakePurchasesSettingValue = Enabled | Disabled

derive instance eqEnterpriseMembersCanMakePurchasesSettingValue :: Eq EnterpriseMembersCanMakePurchasesSettingValue

derive instance ordEnterpriseMembersCanMakePurchasesSettingValue :: Ord EnterpriseMembersCanMakePurchasesSettingValue

fromToMap :: Array (Tuple String EnterpriseMembersCanMakePurchasesSettingValue)
fromToMap = [ Tuple "ENABLED" Enabled, Tuple "DISABLED" Disabled ]

instance enterpriseMembersCanMakePurchasesSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                             EnterpriseMembersCanMakePurchasesSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseMembersCanMakePurchasesSettingValue"
                                        fromToMap

instance enterpriseMembersCanMakePurchasesSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                                EnterpriseMembersCanMakePurchasesSettingValue where
  toGraphqlArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      Disabled -> ArgumentValueEnum "DISABLED"
