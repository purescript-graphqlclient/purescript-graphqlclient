module Examples.Github.Enum.TeamRole where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      Admin -> ArgumentValueEnum "ADMIN"
      Member -> ArgumentValueEnum "MEMBER"
