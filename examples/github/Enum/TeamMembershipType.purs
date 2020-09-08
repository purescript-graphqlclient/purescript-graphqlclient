module Examples.Github.Enum.TeamMembershipType where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - TeamMembershipType
data TeamMembershipType = Immediate | ChildTeam | All

derive instance eqTeamMembershipType :: Eq TeamMembershipType

derive instance ordTeamMembershipType :: Ord TeamMembershipType

fromToMap :: Array (Tuple String TeamMembershipType)
fromToMap = [ Tuple "IMMEDIATE" Immediate
            , Tuple "CHILD_TEAM" ChildTeam
            , Tuple "ALL" All
            ]

instance teamMembershipTypeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                  TeamMembershipType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "TeamMembershipType"
                                        fromToMap

instance teamMembershipTypeToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                     TeamMembershipType where
  toGraphQLArgumentValue =
    case _ of
      Immediate -> ArgumentValueEnum "IMMEDIATE"
      ChildTeam -> ArgumentValueEnum "CHILD_TEAM"
      All -> ArgumentValueEnum "ALL"
