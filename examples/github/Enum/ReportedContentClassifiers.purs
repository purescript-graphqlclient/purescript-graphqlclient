module Examples.Github.Enum.ReportedContentClassifiers where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - ReportedContentClassifiers
data ReportedContentClassifiers
  = Spam
  | Abuse
  | OffTopic
  | Outdated
  | Duplicate
  | Resolved

fromToMap :: Array (Tuple String ReportedContentClassifiers)
fromToMap = [Tuple "SPAM" Spam, Tuple "ABUSE" Abuse, Tuple "OFF_TOPIC" OffTopic, Tuple "OUTDATED" Outdated, Tuple "DUPLICATE" Duplicate, Tuple "RESOLVED" Resolved]

instance reportedContentClassifiersGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ReportedContentClassifiers where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ReportedContentClassifiers" fromToMap

instance reportedContentClassifiersToGraphqlArgumentValue :: ToGraphqlArgumentValue ReportedContentClassifiers where
  toGraphqlArgumentValue =
    case _ of
      Spam -> ArgumentValueEnum "SPAM"
      Abuse -> ArgumentValueEnum "ABUSE"
      OffTopic -> ArgumentValueEnum "OFF_TOPIC"
      Outdated -> ArgumentValueEnum "OUTDATED"
      Duplicate -> ArgumentValueEnum "DUPLICATE"
      Resolved -> ArgumentValueEnum "RESOLVED"
