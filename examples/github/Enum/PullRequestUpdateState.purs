module Examples.Github.Enum.PullRequestUpdateState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PullRequestUpdateState
data PullRequestUpdateState = Open | Closed

derive instance eqPullRequestUpdateState :: Eq PullRequestUpdateState

derive instance ordPullRequestUpdateState :: Ord PullRequestUpdateState

fromToMap :: Array (Tuple String PullRequestUpdateState)
fromToMap = [ Tuple "OPEN" Open, Tuple "CLOSED" Closed ]

instance pullRequestUpdateStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                      PullRequestUpdateState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestUpdateState"
                                        fromToMap

instance pullRequestUpdateStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                         PullRequestUpdateState where
  toGraphQLArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
