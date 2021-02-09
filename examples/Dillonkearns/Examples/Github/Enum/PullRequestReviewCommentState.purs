module Dillonkearns.Examples.Github.Enum.PullRequestReviewCommentState where

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

-- | original name - PullRequestReviewCommentState
data PullRequestReviewCommentState = Pending | Submitted

derive instance genericPullRequestReviewCommentState
  ::
  Generic PullRequestReviewCommentState _

instance showPullRequestReviewCommentState
  :: Show PullRequestReviewCommentState where
  show = genericShow

derive instance eqPullRequestReviewCommentState
  ::
  Eq PullRequestReviewCommentState

derive instance ordPullRequestReviewCommentState
  ::
  Ord PullRequestReviewCommentState

fromToMap :: Array (Tuple String PullRequestReviewCommentState)
fromToMap = [ Tuple "PENDING" Pending, Tuple "SUBMITTED" Submitted ]

instance pullRequestReviewCommentStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder PullRequestReviewCommentState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestReviewCommentState"
                                        fromToMap

instance pullRequestReviewCommentStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue PullRequestReviewCommentState where
  toGraphQLArgumentValue =
    case _ of
      Pending -> ArgumentValueEnum "PENDING"
      Submitted -> ArgumentValueEnum "SUBMITTED"
