module Examples.Github.Enum.TeamMembershipType where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
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

instance teamMembershipTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                  TeamMembershipType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "TeamMembershipType"
                                        fromToMap

instance teamMembershipTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                     TeamMembershipType where
  toGraphqlArgumentValue =
    case _ of
      Immediate -> ArgumentValueEnum "IMMEDIATE"
      ChildTeam -> ArgumentValueEnum "CHILD_TEAM"
      All -> ArgumentValueEnum "ALL"
