module Examples.Github.Enum.PullRequestReviewState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PullRequestReviewState
data PullRequestReviewState
  = Pending
  | Commented
  | Approved
  | ChangesRequested
  | Dismissed

fromToMap :: Array (Tuple String PullRequestReviewState)
fromToMap = [Tuple "PENDING" Pending, Tuple "COMMENTED" Commented, Tuple "APPROVED" Approved, Tuple "CHANGES_REQUESTED" ChangesRequested, Tuple "DISMISSED" Dismissed]

instance pullRequestReviewStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PullRequestReviewState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestReviewState" fromToMap

instance pullRequestReviewStateToGraphqlArgumentValue :: ToGraphqlArgumentValue PullRequestReviewState where
  toGraphqlArgumentValue =
    case _ of
      Pending -> ArgumentValueString "PENDING"
      Commented -> ArgumentValueString "COMMENTED"
      Approved -> ArgumentValueString "APPROVED"
      ChangesRequested -> ArgumentValueString "CHANGES_REQUESTED"
      Dismissed -> ArgumentValueString "DISMISSED"
