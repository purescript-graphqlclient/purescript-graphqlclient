module Examples.Github.Enum.MilestoneOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - MilestoneOrderField
data MilestoneOrderField = DueDate | CreatedAt | UpdatedAt | Number

derive instance eqMilestoneOrderField :: Eq MilestoneOrderField

derive instance ordMilestoneOrderField :: Ord MilestoneOrderField

fromToMap :: Array (Tuple String MilestoneOrderField)
fromToMap = [ Tuple "DUE_DATE" DueDate
            , Tuple "CREATED_AT" CreatedAt
            , Tuple "UPDATED_AT" UpdatedAt
            , Tuple "NUMBER" Number
            ]

instance milestoneOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                   MilestoneOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "MilestoneOrderField"
                                        fromToMap

instance milestoneOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                      MilestoneOrderField where
  toGraphqlArgumentValue =
    case _ of
      DueDate -> ArgumentValueEnum "DUE_DATE"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      Number -> ArgumentValueEnum "NUMBER"
