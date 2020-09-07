module Examples.Github.Enum.TeamRole where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - TeamRole
data TeamRole = Admin | Member

derive instance eqTeamRole :: Eq TeamRole

derive instance ordTeamRole :: Ord TeamRole

fromToMap :: Array (Tuple String TeamRole)
fromToMap = [ Tuple "ADMIN" Admin, Tuple "MEMBER" Member ]

instance teamRoleGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                        TeamRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamRole" fromToMap

instance teamRoleToGraphQLArgumentValue :: ToGraphQLArgumentValue TeamRole where
  toGraphQLArgumentValue =
    case _ of
      Admin -> ArgumentValueEnum "ADMIN"
      Member -> ArgumentValueEnum "MEMBER"
