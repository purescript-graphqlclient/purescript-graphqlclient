module Examples.Github.Enum.PullRequestReviewEvent where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PullRequestReviewEvent
data PullRequestReviewEvent
  = Comment
  | Approve
  | RequestChanges
  | Dismiss

derive instance eqPullRequestReviewEvent :: Eq PullRequestReviewEvent

derive instance ordPullRequestReviewEvent :: Ord PullRequestReviewEvent

fromToMap :: Array (Tuple String PullRequestReviewEvent)
fromToMap = [Tuple "COMMENT" Comment, Tuple "APPROVE" Approve, Tuple "REQUEST_CHANGES" RequestChanges, Tuple "DISMISS" Dismiss]

instance pullRequestReviewEventGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PullRequestReviewEvent where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestReviewEvent" fromToMap

instance pullRequestReviewEventToGraphqlArgumentValue :: ToGraphqlArgumentValue PullRequestReviewEvent where
  toGraphqlArgumentValue =
    case _ of
      Comment -> ArgumentValueEnum "COMMENT"
      Approve -> ArgumentValueEnum "APPROVE"
      RequestChanges -> ArgumentValueEnum "REQUEST_CHANGES"
      Dismiss -> ArgumentValueEnum "DISMISS"
