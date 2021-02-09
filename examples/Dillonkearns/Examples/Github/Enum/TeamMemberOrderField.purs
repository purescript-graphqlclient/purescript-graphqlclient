module Dillonkearns.Examples.Github.Enum.TeamMemberOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - TeamMemberOrderField
data TeamMemberOrderField = Login | CreatedAt

derive instance genericTeamMemberOrderField :: Generic TeamMemberOrderField _

instance showTeamMemberOrderField :: Show TeamMemberOrderField where
  show = genericShow

derive instance eqTeamMemberOrderField :: Eq TeamMemberOrderField

derive instance ordTeamMemberOrderField :: Ord TeamMemberOrderField

fromToMap :: Array (Tuple String TeamMemberOrderField)
fromToMap = [ Tuple "LOGIN" Login, Tuple "CREATED_AT" CreatedAt ]

instance teamMemberOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder TeamMemberOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "TeamMemberOrderField"
                                        fromToMap

instance teamMemberOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue TeamMemberOrderField where
  toGraphQLArgumentValue =
    case _ of
      Login -> ArgumentValueEnum "LOGIN"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
