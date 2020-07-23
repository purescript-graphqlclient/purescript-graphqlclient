module Examples.Github.Enum.TeamDiscussionCommentOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - TeamDiscussionCommentOrderField
data TeamDiscussionCommentOrderField
  = Number

fromToMap :: Array (Tuple String TeamDiscussionCommentOrderField)
fromToMap = [Tuple "NUMBER" Number]

instance teamDiscussionCommentOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder TeamDiscussionCommentOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamDiscussionCommentOrderField" fromToMap

instance teamDiscussionCommentOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue TeamDiscussionCommentOrderField where
  toGraphqlArgumentValue =
    case _ of
      Number -> ArgumentValueEnum "NUMBER"
