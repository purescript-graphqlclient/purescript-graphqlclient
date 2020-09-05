module Examples.Github.Enum.TopicSuggestionDeclineReason where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - TopicSuggestionDeclineReason
data TopicSuggestionDeclineReason
  = NotRelevant | TooSpecific | PersonalPreference | TooGeneral

derive instance eqTopicSuggestionDeclineReason :: Eq TopicSuggestionDeclineReason

derive instance ordTopicSuggestionDeclineReason :: Ord TopicSuggestionDeclineReason

fromToMap :: Array (Tuple String TopicSuggestionDeclineReason)
fromToMap = [ Tuple
              "NOT_RELEVANT"
              NotRelevant
            , Tuple "TOO_SPECIFIC" TooSpecific
            , Tuple "PERSONAL_PREFERENCE" PersonalPreference
            , Tuple "TOO_GENERAL" TooGeneral
            ]

instance topicSuggestionDeclineReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                            TopicSuggestionDeclineReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "TopicSuggestionDeclineReason"
                                        fromToMap

instance topicSuggestionDeclineReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                               TopicSuggestionDeclineReason where
  toGraphqlArgumentValue =
    case _ of
      NotRelevant -> ArgumentValueEnum "NOT_RELEVANT"
      TooSpecific -> ArgumentValueEnum "TOO_SPECIFIC"
      PersonalPreference -> ArgumentValueEnum "PERSONAL_PREFERENCE"
      TooGeneral -> ArgumentValueEnum "TOO_GENERAL"
