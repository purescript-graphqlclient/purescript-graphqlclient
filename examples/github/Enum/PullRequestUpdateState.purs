module Examples.Github.Enum.PullRequestUpdateState where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PullRequestUpdateState
data PullRequestUpdateState = Open | Closed

derive instance eqPullRequestUpdateState :: Eq PullRequestUpdateState

derive instance ordPullRequestUpdateState :: Ord PullRequestUpdateState

fromToMap :: Array (Tuple String PullRequestUpdateState)
fromToMap = [ Tuple "OPEN" Open, Tuple "CLOSED" Closed ]

instance pullRequestUpdateStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                      PullRequestUpdateState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestUpdateState"
                                        fromToMap

instance pullRequestUpdateStateToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                         PullRequestUpdateState where
  toGraphqlArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
