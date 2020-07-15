module Examples.Github.Enum.PullRequestReviewDecision where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PullRequestReviewDecision
data PullRequestReviewDecision
  = ChangesRequested
  | Approved
  | ReviewRequired

fromToMap :: Array (Tuple String PullRequestReviewDecision)
fromToMap = [Tuple "CHANGES_REQUESTED" ChangesRequested, Tuple "APPROVED" Approved, Tuple "REVIEW_REQUIRED" ReviewRequired]

instance pullRequestReviewDecisionGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PullRequestReviewDecision where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestReviewDecision" fromToMap

instance pullRequestReviewDecisionToGraphqlArgumentValue :: ToGraphqlArgumentValue PullRequestReviewDecision where
  toGraphqlArgumentValue =
    case _ of
      ChangesRequested -> ArgumentValueString "CHANGES_REQUESTED"
      Approved -> ArgumentValueString "APPROVED"
      ReviewRequired -> ArgumentValueString "REVIEW_REQUIRED"