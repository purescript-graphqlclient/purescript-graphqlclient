module Examples.Github.Enum.TeamRole where

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

-- | original name - TeamRole
data TeamRole = Admin | Member

derive instance genericTeamRole :: Generic TeamRole _

instance showTeamRole :: Show TeamRole where
  show = genericShow

derive instance eqTeamRole :: Eq TeamRole

derive instance ordTeamRole :: Ord TeamRole

fromToMap :: Array (Tuple String TeamRole)
fromToMap = [ Tuple "ADMIN" Admin, Tuple "MEMBER" Member ]

instance teamRoleGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder TeamRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamRole" fromToMap

instance teamRoleToGraphQLArgumentValue :: ToGraphQLArgumentValue TeamRole where
  toGraphQLArgumentValue =
    case _ of
      Admin -> ArgumentValueEnum "ADMIN"
      Member -> ArgumentValueEnum "MEMBER"
