module Examples.Github.Enum.OrganizationMembersCanCreateRepositoriesSettingValue where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
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
  = All
  | Private
  | Internal
  | Disabled

derive instance genericOrganizationMembersCanCreateRepositoriesSettingValue
  ::
  Generic OrganizationMembersCanCreateRepositoriesSettingValue _

instance showOrganizationMembersCanCreateRepositoriesSettingValue
  :: Show OrganizationMembersCanCreateRepositoriesSettingValue where
  show = genericShow

derive instance eqOrganizationMembersCanCreateRepositoriesSettingValue
  ::
  Eq OrganizationMembersCanCreateRepositoriesSettingValue

derive instance ordOrganizationMembersCanCreateRepositoriesSettingValue
  ::
  Ord OrganizationMembersCanCreateRepositoriesSettingValue

fromToMap
  :: Array
     (Tuple String OrganizationMembersCanCreateRepositoriesSettingValue)
fromToMap = [ Tuple "ALL" All
            , Tuple "PRIVATE" Private
            , Tuple "INTERNAL" Internal
            , Tuple "DISABLED" Disabled
            ]

instance organizationMembersCanCreateRepositoriesSettingValueGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder
     OrganizationMembersCanCreateRepositoriesSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrganizationMembersCanCreateRepositoriesSettingValue"
                                        fromToMap

instance organizationMembersCanCreateRepositoriesSettingValueToGraphQLArgumentValue
  :: ToGraphQLArgumentValue
     OrganizationMembersCanCreateRepositoriesSettingValue where
  toGraphQLArgumentValue =
    case _ of
      All -> ArgumentValueEnum "ALL"
      Private -> ArgumentValueEnum "PRIVATE"
      Internal -> ArgumentValueEnum "INTERNAL"
      Disabled -> ArgumentValueEnum "DISABLED"
