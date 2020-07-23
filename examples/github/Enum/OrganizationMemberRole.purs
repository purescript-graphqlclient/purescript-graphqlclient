module Examples.Github.Enum.OrganizationMemberRole where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrganizationMemberRole
data OrganizationMemberRole
  = Member
  | Admin

fromToMap :: Array (Tuple String OrganizationMemberRole)
fromToMap = [Tuple "MEMBER" Member, Tuple "ADMIN" Admin]

instance organizationMemberRoleGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrganizationMemberRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrganizationMemberRole" fromToMap

instance organizationMemberRoleToGraphqlArgumentValue :: ToGraphqlArgumentValue OrganizationMemberRole where
  toGraphqlArgumentValue =
    case _ of
      Member -> ArgumentValueEnum "MEMBER"
      Admin -> ArgumentValueEnum "ADMIN"
