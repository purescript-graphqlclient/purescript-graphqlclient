module Examples.Github.Enum.EnterpriseUserAccountMembershipRole where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseUserAccountMembershipRole
data EnterpriseUserAccountMembershipRole
  = Member
  | Owner

fromToMap :: Array (Tuple String EnterpriseUserAccountMembershipRole)
fromToMap = [Tuple "MEMBER" Member, Tuple "OWNER" Owner]

instance enterpriseUserAccountMembershipRoleGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseUserAccountMembershipRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseUserAccountMembershipRole" fromToMap

instance enterpriseUserAccountMembershipRoleToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseUserAccountMembershipRole where
  toGraphqlArgumentValue =
    case _ of
      Member -> ArgumentValueString "MEMBER"
      Owner -> ArgumentValueString "OWNER"
