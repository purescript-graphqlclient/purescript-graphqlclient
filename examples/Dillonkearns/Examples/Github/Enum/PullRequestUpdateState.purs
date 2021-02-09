module Dillonkearns.Examples.Github.Enum.PullRequestUpdateState where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PullRequestUpdateState
data PullRequestUpdateState = Open | Closed

derive instance genericPullRequestUpdateState
  ::
  Generic PullRequestUpdateState _

instance showPullRequestUpdateState :: Show PullRequestUpdateState where
  show = genericShow

derive instance eqPullRequestUpdateState :: Eq PullRequestUpdateState

derive instance ordPullRequestUpdateState :: Ord PullRequestUpdateState

fromToMap :: Array (Tuple String PullRequestUpdateState)
fromToMap = [ Tuple "OPEN" Open, Tuple "CLOSED" Closed ]

instance pullRequestUpdateStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder PullRequestUpdateState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestUpdateState"
                                        fromToMap

instance pullRequestUpdateStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue PullRequestUpdateState where
  toGraphQLArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
