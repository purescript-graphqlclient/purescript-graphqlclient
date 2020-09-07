module Examples.Github.Enum.TeamDiscussionCommentOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - TeamDiscussionCommentOrderField
data TeamDiscussionCommentOrderField = Number

derive instance eqTeamDiscussionCommentOrderField :: Eq TeamDiscussionCommentOrderField

derive instance ordTeamDiscussionCommentOrderField :: Ord TeamDiscussionCommentOrderField

fromToMap :: Array (Tuple String TeamDiscussionCommentOrderField)
fromToMap = [ Tuple "NUMBER" Number ]

instance teamDiscussionCommentOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                               TeamDiscussionCommentOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "TeamDiscussionCommentOrderField"
                                        fromToMap

instance teamDiscussionCommentOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                  TeamDiscussionCommentOrderField where
  toGraphQLArgumentValue =
    case _ of
      Number -> ArgumentValueEnum "NUMBER"
