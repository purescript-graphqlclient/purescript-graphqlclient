module Examples.Github.Enum.ReportedContentClassifiers where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ReportedContentClassifiers
data ReportedContentClassifiers
  = Spam | Abuse | OffTopic | Outdated | Duplicate | Resolved

derive instance eqReportedContentClassifiers :: Eq ReportedContentClassifiers

derive instance ordReportedContentClassifiers :: Ord ReportedContentClassifiers

fromToMap :: Array (Tuple String ReportedContentClassifiers)
fromToMap = [ Tuple
              "SPAM"
              Spam
            , Tuple "ABUSE" Abuse
            , Tuple "OFF_TOPIC" OffTopic
            , Tuple "OUTDATED" Outdated
            , Tuple "DUPLICATE" Duplicate
            , Tuple "RESOLVED" Resolved
            ]

instance reportedContentClassifiersGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                          ReportedContentClassifiers where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ReportedContentClassifiers"
                                        fromToMap

instance reportedContentClassifiersToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                             ReportedContentClassifiers where
  toGraphqlArgumentValue =
    case _ of
      Spam -> ArgumentValueEnum "SPAM"
      Abuse -> ArgumentValueEnum "ABUSE"
      OffTopic -> ArgumentValueEnum "OFF_TOPIC"
      Outdated -> ArgumentValueEnum "OUTDATED"
      Duplicate -> ArgumentValueEnum "DUPLICATE"
      Resolved -> ArgumentValueEnum "RESOLVED"
