module Examples.Github.Enum.CheckConclusionState where

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

-- | original name - CheckConclusionState
data CheckConclusionState
  = ActionRequired
  | TimedOut
  | Cancelled
  | Failure
  | Success
  | Neutral
  | Skipped
  | StartupFailure
  | Stale

derive instance genericCheckConclusionState :: Generic CheckConclusionState _

instance showCheckConclusionState :: Show CheckConclusionState where
  show = genericShow

derive instance eqCheckConclusionState :: Eq CheckConclusionState

derive instance ordCheckConclusionState :: Ord CheckConclusionState

fromToMap :: Array (Tuple String CheckConclusionState)
fromToMap = [ Tuple "ACTION_REQUIRED" ActionRequired
            , Tuple "TIMED_OUT" TimedOut
            , Tuple "CANCELLED" Cancelled
            , Tuple "FAILURE" Failure
            , Tuple "SUCCESS" Success
            , Tuple "NEUTRAL" Neutral
            , Tuple "SKIPPED" Skipped
            , Tuple "STARTUP_FAILURE" StartupFailure
            , Tuple "STALE" Stale
            ]

instance checkConclusionStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder CheckConclusionState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "CheckConclusionState"
                                        fromToMap

instance checkConclusionStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue CheckConclusionState where
  toGraphQLArgumentValue =
    case _ of
      ActionRequired -> ArgumentValueEnum "ACTION_REQUIRED"
      TimedOut -> ArgumentValueEnum "TIMED_OUT"
      Cancelled -> ArgumentValueEnum "CANCELLED"
      Failure -> ArgumentValueEnum "FAILURE"
      Success -> ArgumentValueEnum "SUCCESS"
      Neutral -> ArgumentValueEnum "NEUTRAL"
      Skipped -> ArgumentValueEnum "SKIPPED"
      StartupFailure -> ArgumentValueEnum "STARTUP_FAILURE"
      Stale -> ArgumentValueEnum "STALE"
