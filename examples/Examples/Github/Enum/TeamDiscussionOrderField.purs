module Examples.Github.Enum.TeamDiscussionOrderField where

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

-- | original name - TeamDiscussionOrderField
data TeamDiscussionOrderField = CreatedAt

derive instance genericTeamDiscussionOrderField
  ::
  Generic TeamDiscussionOrderField _

instance showTeamDiscussionOrderField :: Show TeamDiscussionOrderField where
  show = genericShow

derive instance eqTeamDiscussionOrderField :: Eq TeamDiscussionOrderField

derive instance ordTeamDiscussionOrderField :: Ord TeamDiscussionOrderField

fromToMap :: Array (Tuple String TeamDiscussionOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance teamDiscussionOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder TeamDiscussionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "TeamDiscussionOrderField"
                                        fromToMap

instance teamDiscussionOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue TeamDiscussionOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
