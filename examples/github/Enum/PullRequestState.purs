module Examples.Github.Enum.PullRequestState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PullRequestState
data PullRequestState = Open | Closed | Merged

derive instance eqPullRequestState :: Eq PullRequestState

derive instance ordPullRequestState :: Ord PullRequestState

fromToMap :: Array (Tuple String PullRequestState)
fromToMap = [ Tuple "OPEN" Open, Tuple "CLOSED" Closed, Tuple "MERGED" Merged ]

instance pullRequestStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                PullRequestState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestState" fromToMap

instance pullRequestStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                   PullRequestState where
  toGraphQLArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
      Merged -> ArgumentValueEnum "MERGED"
