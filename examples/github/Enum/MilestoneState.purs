module Examples.Github.Enum.MilestoneState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - MilestoneState
data MilestoneState = Open | Closed

derive instance eqMilestoneState :: Eq MilestoneState

derive instance ordMilestoneState :: Ord MilestoneState

fromToMap :: Array (Tuple String MilestoneState)
fromToMap = [ Tuple "OPEN" Open, Tuple "CLOSED" Closed ]

instance milestoneStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                              MilestoneState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "MilestoneState" fromToMap

instance milestoneStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                 MilestoneState where
  toGraphQLArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
