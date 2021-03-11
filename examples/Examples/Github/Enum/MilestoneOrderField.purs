module Examples.Github.Enum.MilestoneOrderField where

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

-- | original name - MilestoneOrderField
data MilestoneOrderField = DueDate | CreatedAt | UpdatedAt | Number

derive instance genericMilestoneOrderField :: Generic MilestoneOrderField _

instance showMilestoneOrderField :: Show MilestoneOrderField where
  show = genericShow

derive instance eqMilestoneOrderField :: Eq MilestoneOrderField

derive instance ordMilestoneOrderField :: Ord MilestoneOrderField

fromToMap :: Array (Tuple String MilestoneOrderField)
fromToMap = [ Tuple "DUE_DATE" DueDate
            , Tuple "CREATED_AT" CreatedAt
            , Tuple "UPDATED_AT" UpdatedAt
            , Tuple "NUMBER" Number
            ]

instance milestoneOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder MilestoneOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "MilestoneOrderField"
                                        fromToMap

instance milestoneOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue MilestoneOrderField where
  toGraphQLArgumentValue =
    case _ of
      DueDate -> ArgumentValueEnum "DUE_DATE"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      Number -> ArgumentValueEnum "NUMBER"
