module Examples.Github.Enum.UserBlockDuration where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - UserBlockDuration
data UserBlockDuration
  = OneDay
  | ThreeDays
  | OneWeek
  | OneMonth
  | Permanent

fromToMap :: Array (Tuple String UserBlockDuration)
fromToMap = [Tuple "ONE_DAY" OneDay, Tuple "THREE_DAYS" ThreeDays, Tuple "ONE_WEEK" OneWeek, Tuple "ONE_MONTH" OneMonth, Tuple "PERMANENT" Permanent]

instance userBlockDurationGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder UserBlockDuration where
  graphqlDefaultResponseScalarDecoder = enumDecoder "UserBlockDuration" fromToMap

instance userBlockDurationToGraphqlArgumentValue :: ToGraphqlArgumentValue UserBlockDuration where
  toGraphqlArgumentValue =
    case _ of
      OneDay -> ArgumentValueString "ONE_DAY"
      ThreeDays -> ArgumentValueString "THREE_DAYS"
      OneWeek -> ArgumentValueString "ONE_WEEK"
      OneMonth -> ArgumentValueString "ONE_MONTH"
      Permanent -> ArgumentValueString "PERMANENT"
