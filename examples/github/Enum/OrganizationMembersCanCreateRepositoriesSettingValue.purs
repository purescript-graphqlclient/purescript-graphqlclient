module Examples.Github.Enum.OrganizationMembersCanCreateRepositoriesSettingValue where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
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

instance organizationMembersCanCreateRepositoriesSettingValueGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                                    OrganizationMembersCanCreateRepositoriesSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrganizationMembersCanCreateRepositoriesSettingValue"
                                        fromToMap

instance organizationMembersCanCreateRepositoriesSettingValueToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                                       OrganizationMembersCanCreateRepositoriesSettingValue where
  toGraphQLArgumentValue =
    case _ of
      All -> ArgumentValueEnum "ALL"
      Private -> ArgumentValueEnum "PRIVATE"
      Disabled -> ArgumentValueEnum "DISABLED"
