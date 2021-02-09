module Dillonkearns.Examples.Github.Enum.PullRequestReviewEvent where

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

-- | original name - PullRequestReviewEvent
data PullRequestReviewEvent = Comment | Approve | RequestChanges | Dismiss

derive instance genericPullRequestReviewEvent
  ::
  Generic PullRequestReviewEvent _

instance showPullRequestReviewEvent :: Show PullRequestReviewEvent where
  show = genericShow

derive instance eqPullRequestReviewEvent :: Eq PullRequestReviewEvent

derive instance ordPullRequestReviewEvent :: Ord PullRequestReviewEvent

fromToMap :: Array (Tuple String PullRequestReviewEvent)
fromToMap = [ Tuple "COMMENT" Comment
            , Tuple "APPROVE" Approve
            , Tuple "REQUEST_CHANGES" RequestChanges
            , Tuple "DISMISS" Dismiss
            ]

instance pullRequestReviewEventGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder PullRequestReviewEvent where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestReviewEvent"
                                        fromToMap

instance pullRequestReviewEventToGraphQLArgumentValue
  :: ToGraphQLArgumentValue PullRequestReviewEvent where
  toGraphQLArgumentValue =
    case _ of
      Comment -> ArgumentValueEnum "COMMENT"
      Approve -> ArgumentValueEnum "APPROVE"
      RequestChanges -> ArgumentValueEnum "REQUEST_CHANGES"
      Dismiss -> ArgumentValueEnum "DISMISS"
