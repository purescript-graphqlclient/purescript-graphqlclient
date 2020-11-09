module Examples.Github.Enum.OrganizationMemberRole where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrganizationMemberRole
data OrganizationMemberRole = Member | Admin

derive instance genericOrganizationMemberRole :: Generic OrganizationMemberRole _

instance showOrganizationMemberRole :: Show OrganizationMemberRole where
  show = genericShow

derive instance eqOrganizationMemberRole :: Eq OrganizationMemberRole

derive instance ordOrganizationMemberRole :: Ord OrganizationMemberRole

fromToMap :: Array (Tuple String OrganizationMemberRole)
fromToMap = [ Tuple "MEMBER" Member, Tuple "ADMIN" Admin ]

instance organizationMemberRoleGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                      OrganizationMemberRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrganizationMemberRole"
                                        fromToMap

instance organizationMemberRoleToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                         OrganizationMemberRole where
  toGraphQLArgumentValue =
    case _ of
      Member -> ArgumentValueEnum "MEMBER"
      Admin -> ArgumentValueEnum "ADMIN"
