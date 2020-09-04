module Examples.Github.Enum.TeamDiscussionOrderField where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - TeamDiscussionOrderField
data TeamDiscussionOrderField
  = CreatedAt

derive instance eqTeamDiscussionOrderField :: Eq TeamDiscussionOrderField

derive instance ordTeamDiscussionOrderField :: Ord TeamDiscussionOrderField

fromToMap :: Array (Tuple String TeamDiscussionOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt]

instance teamDiscussionOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder TeamDiscussionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamDiscussionOrderField" fromToMap

instance teamDiscussionOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue TeamDiscussionOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
