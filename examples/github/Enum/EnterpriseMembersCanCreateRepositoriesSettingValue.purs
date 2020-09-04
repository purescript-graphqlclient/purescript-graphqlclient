module Examples.Github.Enum.EnterpriseMembersCanCreateRepositoriesSettingValue where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseMembersCanCreateRepositoriesSettingValue
data EnterpriseMembersCanCreateRepositoriesSettingValue
  = NoPolicy
  | All
  | Public
  | Private
  | Disabled

derive instance eqEnterpriseMembersCanCreateRepositoriesSettingValue :: Eq EnterpriseMembersCanCreateRepositoriesSettingValue

derive instance ordEnterpriseMembersCanCreateRepositoriesSettingValue :: Ord EnterpriseMembersCanCreateRepositoriesSettingValue

fromToMap :: Array (Tuple String EnterpriseMembersCanCreateRepositoriesSettingValue)
fromToMap = [Tuple "NO_POLICY" NoPolicy, Tuple "ALL" All, Tuple "PUBLIC" Public, Tuple "PRIVATE" Private, Tuple "DISABLED" Disabled]

instance enterpriseMembersCanCreateRepositoriesSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseMembersCanCreateRepositoriesSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseMembersCanCreateRepositoriesSettingValue" fromToMap

instance enterpriseMembersCanCreateRepositoriesSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseMembersCanCreateRepositoriesSettingValue where
  toGraphqlArgumentValue =
    case _ of
      NoPolicy -> ArgumentValueEnum "NO_POLICY"
      All -> ArgumentValueEnum "ALL"
      Public -> ArgumentValueEnum "PUBLIC"
      Private -> ArgumentValueEnum "PRIVATE"
      Disabled -> ArgumentValueEnum "DISABLED"
