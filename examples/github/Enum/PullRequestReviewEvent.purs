module Examples.Github.Enum.PullRequestReviewEvent where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PullRequestReviewEvent
data PullRequestReviewEvent = Comment | Approve | RequestChanges | Dismiss

derive instance eqPullRequestReviewEvent :: Eq PullRequestReviewEvent

derive instance ordPullRequestReviewEvent :: Ord PullRequestReviewEvent

fromToMap :: Array (Tuple String PullRequestReviewEvent)
fromToMap = [ Tuple "COMMENT" Comment
            , Tuple "APPROVE" Approve
            , Tuple "REQUEST_CHANGES" RequestChanges
            , Tuple "DISMISS" Dismiss
            ]

instance pullRequestReviewEventGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                      PullRequestReviewEvent where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestReviewEvent"
                                        fromToMap

instance pullRequestReviewEventToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                         PullRequestReviewEvent where
  toGraphQLArgumentValue =
    case _ of
      Comment -> ArgumentValueEnum "COMMENT"
      Approve -> ArgumentValueEnum "APPROVE"
      RequestChanges -> ArgumentValueEnum "REQUEST_CHANGES"
      Dismiss -> ArgumentValueEnum "DISMISS"
