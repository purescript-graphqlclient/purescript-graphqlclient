module Examples.Github.Enum.TeamRole where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - TeamRole
data TeamRole
  = Admin
  | Member

fromToMap :: Array (Tuple String TeamRole)
fromToMap = [Tuple "ADMIN" Admin, Tuple "MEMBER" Member]

instance teamRoleGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder TeamRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamRole" fromToMap

instance teamRoleToGraphqlArgumentValue :: ToGraphqlArgumentValue TeamRole where
  toGraphqlArgumentValue =
    case _ of
      Admin -> ArgumentValueString "ADMIN"
      Member -> ArgumentValueString "MEMBER"
