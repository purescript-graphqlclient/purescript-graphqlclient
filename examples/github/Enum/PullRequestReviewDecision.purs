module Examples.Github.Enum.PullRequestReviewDecision where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PullRequestReviewDecision
data PullRequestReviewDecision = ChangesRequested | Approved | ReviewRequired

derive instance eqPullRequestReviewDecision :: Eq PullRequestReviewDecision

derive instance ordPullRequestReviewDecision :: Ord PullRequestReviewDecision

fromToMap :: Array (Tuple String PullRequestReviewDecision)
fromToMap = [ Tuple "CHANGES_REQUESTED" ChangesRequested
            , Tuple "APPROVED" Approved
            , Tuple "REVIEW_REQUIRED" ReviewRequired
            ]

instance pullRequestReviewDecisionGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                         PullRequestReviewDecision where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestReviewDecision"
                                        fromToMap

instance pullRequestReviewDecisionToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                            PullRequestReviewDecision where
  toGraphqlArgumentValue =
    case _ of
      ChangesRequested -> ArgumentValueEnum "CHANGES_REQUESTED"
      Approved -> ArgumentValueEnum "APPROVED"
      ReviewRequired -> ArgumentValueEnum "REVIEW_REQUIRED"
