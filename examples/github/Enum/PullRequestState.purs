module Examples.Github.Enum.PullRequestState where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
      Merged -> ArgumentValueEnum "MERGED"
