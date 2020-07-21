module Examples.Github.Enum.MilestoneState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - MilestoneState
data MilestoneState
  = Open
  | Closed

fromToMap :: Array (Tuple String MilestoneState)
fromToMap = [Tuple "OPEN" Open, Tuple "CLOSED" Closed]

instance milestoneStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder MilestoneState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "MilestoneState" fromToMap

instance milestoneStateToGraphqlArgumentValue :: ToGraphqlArgumentValue MilestoneState where
  toGraphqlArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
