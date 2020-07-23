module Examples.Github.Enum.TeamMemberRole where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - TeamMemberRole
data TeamMemberRole
  = Maintainer
  | Member

fromToMap :: Array (Tuple String TeamMemberRole)
fromToMap = [Tuple "MAINTAINER" Maintainer, Tuple "MEMBER" Member]

instance teamMemberRoleGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder TeamMemberRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamMemberRole" fromToMap

instance teamMemberRoleToGraphqlArgumentValue :: ToGraphqlArgumentValue TeamMemberRole where
  toGraphqlArgumentValue =
    case _ of
      Maintainer -> ArgumentValueEnum "MAINTAINER"
      Member -> ArgumentValueEnum "MEMBER"
