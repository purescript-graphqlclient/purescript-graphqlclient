module Examples.Github.Enum.OrganizationMembersCanCreateRepositoriesSettingValue where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrganizationMembersCanCreateRepositoriesSettingValue
data OrganizationMembersCanCreateRepositoriesSettingValue
  = All | Private | Disabled

derive instance eqOrganizationMembersCanCreateRepositoriesSettingValue :: Eq OrganizationMembersCanCreateRepositoriesSettingValue

derive instance ordOrganizationMembersCanCreateRepositoriesSettingValue :: Ord OrganizationMembersCanCreateRepositoriesSettingValue

fromToMap :: Array
             (Tuple
              String
              OrganizationMembersCanCreateRepositoriesSettingValue)
fromToMap = [ Tuple "ALL" All
            , Tuple "PRIVATE" Private
            , Tuple "DISABLED" Disabled
            ]

instance organizationMembersCanCreateRepositoriesSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                                    OrganizationMembersCanCreateRepositoriesSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrganizationMembersCanCreateRepositoriesSettingValue"
                                        fromToMap

instance organizationMembersCanCreateRepositoriesSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                                       OrganizationMembersCanCreateRepositoriesSettingValue where
  toGraphqlArgumentValue =
    case _ of
      All -> ArgumentValueEnum "ALL"
      Private -> ArgumentValueEnum "PRIVATE"
      Disabled -> ArgumentValueEnum "DISABLED"
