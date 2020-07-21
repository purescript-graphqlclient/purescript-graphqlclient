module Examples.Github.Enum.PullRequestReviewCommentState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PullRequestReviewCommentState
data PullRequestReviewCommentState
  = Pending
  | Submitted

fromToMap :: Array (Tuple String PullRequestReviewCommentState)
fromToMap = [Tuple "PENDING" Pending, Tuple "SUBMITTED" Submitted]

instance pullRequestReviewCommentStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PullRequestReviewCommentState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestReviewCommentState" fromToMap

instance pullRequestReviewCommentStateToGraphqlArgumentValue :: ToGraphqlArgumentValue PullRequestReviewCommentState where
  toGraphqlArgumentValue =
    case _ of
      Pending -> ArgumentValueEnum "PENDING"
      Submitted -> ArgumentValueEnum "SUBMITTED"
