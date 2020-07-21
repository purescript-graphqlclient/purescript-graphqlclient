module Examples.Github.Enum.OrganizationMembersCanCreateRepositoriesSettingValue where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrganizationMembersCanCreateRepositoriesSettingValue
data OrganizationMembersCanCreateRepositoriesSettingValue
  = All
  | Private
  | Disabled

fromToMap :: Array (Tuple String OrganizationMembersCanCreateRepositoriesSettingValue)
fromToMap = [Tuple "ALL" All, Tuple "PRIVATE" Private, Tuple "DISABLED" Disabled]

instance organizationMembersCanCreateRepositoriesSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrganizationMembersCanCreateRepositoriesSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrganizationMembersCanCreateRepositoriesSettingValue" fromToMap

instance organizationMembersCanCreateRepositoriesSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue OrganizationMembersCanCreateRepositoriesSettingValue where
  toGraphqlArgumentValue =
    case _ of
      All -> ArgumentValueEnum "ALL"
      Private -> ArgumentValueEnum "PRIVATE"
      Disabled -> ArgumentValueEnum "DISABLED"
