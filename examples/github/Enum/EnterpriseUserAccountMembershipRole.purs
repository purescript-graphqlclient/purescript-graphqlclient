module Examples.Github.Enum.EnterpriseUserAccountMembershipRole where

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

-- | original name - EnterpriseUserAccountMembershipRole
data EnterpriseUserAccountMembershipRole = Member | Owner

derive instance genericEnterpriseUserAccountMembershipRole :: Generic EnterpriseUserAccountMembershipRole _

instance showEnterpriseUserAccountMembershipRole :: Show
                                                    EnterpriseUserAccountMembershipRole where
  show = genericShow

derive instance eqEnterpriseUserAccountMembershipRole :: Eq EnterpriseUserAccountMembershipRole

derive instance ordEnterpriseUserAccountMembershipRole :: Ord EnterpriseUserAccountMembershipRole

fromToMap :: Array (Tuple String EnterpriseUserAccountMembershipRole)
fromToMap = [ Tuple "MEMBER" Member, Tuple "OWNER" Owner ]

instance enterpriseUserAccountMembershipRoleGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                   EnterpriseUserAccountMembershipRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseUserAccountMembershipRole"
                                        fromToMap

instance enterpriseUserAccountMembershipRoleToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                      EnterpriseUserAccountMembershipRole where
  toGraphQLArgumentValue =
    case _ of
      Member -> ArgumentValueEnum "MEMBER"
      Owner -> ArgumentValueEnum "OWNER"
