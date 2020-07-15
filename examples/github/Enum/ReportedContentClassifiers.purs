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
      Spam -> ArgumentValueString "SPAM"
      Abuse -> ArgumentValueString "ABUSE"
      OffTopic -> ArgumentValueString "OFF_TOPIC"
      Outdated -> ArgumentValueString "OUTDATED"
      Duplicate -> ArgumentValueString "DUPLICATE"
      Resolved -> ArgumentValueString "RESOLVED"
