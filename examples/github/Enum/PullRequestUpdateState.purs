module Examples.Github.Enum.PullRequestUpdateState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PullRequestUpdateState
data PullRequestUpdateState
  = Open
  | Closed

fromToMap :: Array (Tuple String PullRequestUpdateState)
fromToMap = [Tuple "OPEN" Open, Tuple "CLOSED" Closed]

instance pullRequestUpdateStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PullRequestUpdateState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestUpdateState" fromToMap

instance pullRequestUpdateStateToGraphqlArgumentValue :: ToGraphqlArgumentValue PullRequestUpdateState where
  toGraphqlArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
