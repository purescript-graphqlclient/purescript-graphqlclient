module Examples.Github.Enum.TeamMemberRole where

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

-- | original name - TeamMemberRole
data TeamMemberRole = Maintainer | Member

derive instance genericTeamMemberRole :: Generic TeamMemberRole _

instance showTeamMemberRole :: Show TeamMemberRole where
  show = genericShow

derive instance eqTeamMemberRole :: Eq TeamMemberRole

derive instance ordTeamMemberRole :: Ord TeamMemberRole

fromToMap :: Array (Tuple String TeamMemberRole)
fromToMap = [ Tuple "MAINTAINER" Maintainer, Tuple "MEMBER" Member ]

instance teamMemberRoleGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                              TeamMemberRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamMemberRole" fromToMap

instance teamMemberRoleToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                 TeamMemberRole where
  toGraphQLArgumentValue =
    case _ of
      Maintainer -> ArgumentValueEnum "MAINTAINER"
      Member -> ArgumentValueEnum "MEMBER"
