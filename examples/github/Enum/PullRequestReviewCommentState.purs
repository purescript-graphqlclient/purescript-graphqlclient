module Examples.Github.Enum.PullRequestReviewCommentState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PullRequestReviewCommentState
data PullRequestReviewCommentState = Pending | Submitted

derive instance eqPullRequestReviewCommentState :: Eq PullRequestReviewCommentState

derive instance ordPullRequestReviewCommentState :: Ord PullRequestReviewCommentState

fromToMap :: Array (Tuple String PullRequestReviewCommentState)
fromToMap = [ Tuple "PENDING" Pending, Tuple "SUBMITTED" Submitted ]

instance pullRequestReviewCommentStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                             PullRequestReviewCommentState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestReviewCommentState"
                                        fromToMap

instance pullRequestReviewCommentStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                PullRequestReviewCommentState where
  toGraphQLArgumentValue =
    case _ of
      Pending -> ArgumentValueEnum "PENDING"
      Submitted -> ArgumentValueEnum "SUBMITTED"
