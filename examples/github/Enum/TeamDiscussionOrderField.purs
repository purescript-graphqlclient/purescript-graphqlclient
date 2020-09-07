module Examples.Github.Enum.TeamDiscussionOrderField where

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

derive instance eqTeamDiscussionOrderField :: Eq TeamDiscussionOrderField

derive instance ordTeamDiscussionOrderField :: Ord TeamDiscussionOrderField

fromToMap :: Array (Tuple String TeamDiscussionOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance teamDiscussionOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                        TeamDiscussionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "TeamDiscussionOrderField"
                                        fromToMap

instance teamDiscussionOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                           TeamDiscussionOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
