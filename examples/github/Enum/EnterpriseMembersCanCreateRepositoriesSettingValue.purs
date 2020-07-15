module Examples.Github.Enum.EnterpriseMembersCanCreateRepositoriesSettingValue where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseMembersCanCreateRepositoriesSettingValue
data EnterpriseMembersCanCreateRepositoriesSettingValue
  = NoPolicy
  | All
  | Public
  | Private
  | Disabled

fromToMap :: Array (Tuple String EnterpriseMembersCanCreateRepositoriesSettingValue)
fromToMap = [Tuple "NO_POLICY" NoPolicy, Tuple "ALL" All, Tuple "PUBLIC" Public, Tuple "PRIVATE" Private, Tuple "DISABLED" Disabled]

instance enterpriseMembersCanCreateRepositoriesSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseMembersCanCreateRepositoriesSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseMembersCanCreateRepositoriesSettingValue" fromToMap

instance enterpriseMembersCanCreateRepositoriesSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseMembersCanCreateRepositoriesSettingValue where
  toGraphqlArgumentValue =
    case _ of
      NoPolicy -> ArgumentValueString "NO_POLICY"
      All -> ArgumentValueString "ALL"
      Public -> ArgumentValueString "PUBLIC"
      Private -> ArgumentValueString "PRIVATE"
      Disabled -> ArgumentValueString "DISABLED"
