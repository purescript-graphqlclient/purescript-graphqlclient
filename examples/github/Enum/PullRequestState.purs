module Examples.Github.Enum.PullRequestState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PullRequestState
data PullRequestState
  = Open
  | Closed
  | Merged

fromToMap :: Array (Tuple String PullRequestState)
fromToMap = [Tuple "OPEN" Open, Tuple "CLOSED" Closed, Tuple "MERGED" Merged]

instance pullRequestStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PullRequestState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestState" fromToMap

instance pullRequestStateToGraphqlArgumentValue :: ToGraphqlArgumentValue PullRequestState where
  toGraphqlArgumentValue =
    case _ of
      Open -> ArgumentValueString "OPEN"
      Closed -> ArgumentValueString "CLOSED"
      Merged -> ArgumentValueString "MERGED"
