module Examples.Github.Enum.PullRequestReviewEvent where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PullRequestReviewEvent
data PullRequestReviewEvent
  = Comment
  | Approve
  | RequestChanges
  | Dismiss

fromToMap :: Array (Tuple String PullRequestReviewEvent)
fromToMap = [Tuple "COMMENT" Comment, Tuple "APPROVE" Approve, Tuple "REQUEST_CHANGES" RequestChanges, Tuple "DISMISS" Dismiss]

instance pullRequestReviewEventGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PullRequestReviewEvent where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestReviewEvent" fromToMap

instance pullRequestReviewEventToGraphqlArgumentValue :: ToGraphqlArgumentValue PullRequestReviewEvent where
  toGraphqlArgumentValue =
    case _ of
      Comment -> ArgumentValueString "COMMENT"
      Approve -> ArgumentValueString "APPROVE"
      RequestChanges -> ArgumentValueString "REQUEST_CHANGES"
      Dismiss -> ArgumentValueString "DISMISS"
