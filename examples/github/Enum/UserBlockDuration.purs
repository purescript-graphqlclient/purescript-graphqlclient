module Examples.Github.Enum.UserBlockDuration where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - UserBlockDuration
data UserBlockDuration = OneDay | ThreeDays | OneWeek | OneMonth | Permanent

derive instance eqUserBlockDuration :: Eq UserBlockDuration

derive instance ordUserBlockDuration :: Ord UserBlockDuration

fromToMap :: Array (Tuple String UserBlockDuration)
fromToMap = [ Tuple "ONE_DAY" OneDay
            , Tuple "THREE_DAYS" ThreeDays
            , Tuple "ONE_WEEK" OneWeek
            , Tuple "ONE_MONTH" OneMonth
            , Tuple "PERMANENT" Permanent
            ]

instance userBlockDurationGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                 UserBlockDuration where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "UserBlockDuration"
                                        fromToMap

instance userBlockDurationToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                    UserBlockDuration where
  toGraphQLArgumentValue =
    case _ of
      OneDay -> ArgumentValueEnum "ONE_DAY"
      ThreeDays -> ArgumentValueEnum "THREE_DAYS"
      OneWeek -> ArgumentValueEnum "ONE_WEEK"
      OneMonth -> ArgumentValueEnum "ONE_MONTH"
      Permanent -> ArgumentValueEnum "PERMANENT"
