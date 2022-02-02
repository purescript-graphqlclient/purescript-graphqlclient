module Examples.Github.Enum.RoleInOrganization where

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

-- | original name - RoleInOrganization
data RoleInOrganization = Owner | DirectMember | Unaffiliated

derive instance genericRoleInOrganization :: Generic RoleInOrganization _

instance showRoleInOrganization :: Show RoleInOrganization where
  show = genericShow

derive instance eqRoleInOrganization :: Eq RoleInOrganization

derive instance ordRoleInOrganization :: Ord RoleInOrganization

fromToMap :: Array (Tuple String RoleInOrganization)
fromToMap = [ Tuple "OWNER" Owner
            , Tuple "DIRECT_MEMBER" DirectMember
            , Tuple "UNAFFILIATED" Unaffiliated
            ]

instance roleInOrganizationGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RoleInOrganization where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RoleInOrganization"
                                        fromToMap

instance roleInOrganizationToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RoleInOrganization where
  toGraphQLArgumentValue =
    case _ of
      Owner -> ArgumentValueEnum "OWNER"
      DirectMember -> ArgumentValueEnum "DIRECT_MEMBER"
      Unaffiliated -> ArgumentValueEnum "UNAFFILIATED"
