module Dillonkearns.Examples.Github.Enum.PullRequestReviewState where

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

-- | original name - PullRequestReviewState
data PullRequestReviewState
  = Pending
  | Commented
  | Approved
  | ChangesRequested
  | Dismissed

derive instance genericPullRequestReviewState
  ::
  Generic PullRequestReviewState _

instance showPullRequestReviewState :: Show PullRequestReviewState where
  show = genericShow

derive instance eqPullRequestReviewState :: Eq PullRequestReviewState

derive instance ordPullRequestReviewState :: Ord PullRequestReviewState

fromToMap :: Array (Tuple String PullRequestReviewState)
fromToMap = [ Tuple "PENDING" Pending
            , Tuple "COMMENTED" Commented
            , Tuple "APPROVED" Approved
            , Tuple "CHANGES_REQUESTED" ChangesRequested
            , Tuple "DISMISSED" Dismissed
            ]

instance pullRequestReviewStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder PullRequestReviewState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestReviewState"
                                        fromToMap

instance pullRequestReviewStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue PullRequestReviewState where
  toGraphQLArgumentValue =
    case _ of
      Pending -> ArgumentValueEnum "PENDING"
      Commented -> ArgumentValueEnum "COMMENTED"
      Approved -> ArgumentValueEnum "APPROVED"
      ChangesRequested -> ArgumentValueEnum "CHANGES_REQUESTED"
      Dismissed -> ArgumentValueEnum "DISMISSED"
