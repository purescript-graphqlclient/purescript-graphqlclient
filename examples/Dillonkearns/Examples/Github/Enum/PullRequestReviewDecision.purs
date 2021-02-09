module Dillonkearns.Examples.Github.Enum.PullRequestReviewDecision where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PullRequestReviewDecision
data PullRequestReviewDecision = ChangesRequested | Approved | ReviewRequired

derive instance genericPullRequestReviewDecision
  ::
  Generic PullRequestReviewDecision _

instance showPullRequestReviewDecision :: Show PullRequestReviewDecision where
  show = genericShow

derive instance eqPullRequestReviewDecision :: Eq PullRequestReviewDecision

derive instance ordPullRequestReviewDecision :: Ord PullRequestReviewDecision

fromToMap :: Array (Tuple String PullRequestReviewDecision)
fromToMap = [ Tuple "CHANGES_REQUESTED" ChangesRequested
            , Tuple "APPROVED" Approved
            , Tuple "REVIEW_REQUIRED" ReviewRequired
            ]

instance pullRequestReviewDecisionGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder PullRequestReviewDecision where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestReviewDecision"
                                        fromToMap

instance pullRequestReviewDecisionToGraphQLArgumentValue
  :: ToGraphQLArgumentValue PullRequestReviewDecision where
  toGraphQLArgumentValue =
    case _ of
      ChangesRequested -> ArgumentValueEnum "CHANGES_REQUESTED"
      Approved -> ArgumentValueEnum "APPROVED"
      ReviewRequired -> ArgumentValueEnum "REVIEW_REQUIRED"
