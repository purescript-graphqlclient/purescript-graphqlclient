module Dillonkearns.Examples.Github.Enum.ReportedContentClassifiers where

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

-- | original name - ReportedContentClassifiers
data ReportedContentClassifiers
  = Spam
  | Abuse
  | OffTopic
  | Outdated
  | Duplicate
  | Resolved

derive instance genericReportedContentClassifiers
  ::
  Generic ReportedContentClassifiers _

instance showReportedContentClassifiers :: Show ReportedContentClassifiers where
  show = genericShow

derive instance eqReportedContentClassifiers :: Eq ReportedContentClassifiers

derive instance ordReportedContentClassifiers :: Ord ReportedContentClassifiers

fromToMap :: Array (Tuple String ReportedContentClassifiers)
fromToMap = [ Tuple "SPAM" Spam
            , Tuple "ABUSE" Abuse
            , Tuple "OFF_TOPIC" OffTopic
            , Tuple "OUTDATED" Outdated
            , Tuple "DUPLICATE" Duplicate
            , Tuple "RESOLVED" Resolved
            ]

instance reportedContentClassifiersGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder ReportedContentClassifiers where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ReportedContentClassifiers"
                                        fromToMap

instance reportedContentClassifiersToGraphQLArgumentValue
  :: ToGraphQLArgumentValue ReportedContentClassifiers where
  toGraphQLArgumentValue =
    case _ of
      Spam -> ArgumentValueEnum "SPAM"
      Abuse -> ArgumentValueEnum "ABUSE"
      OffTopic -> ArgumentValueEnum "OFF_TOPIC"
      Outdated -> ArgumentValueEnum "OUTDATED"
      Duplicate -> ArgumentValueEnum "DUPLICATE"
      Resolved -> ArgumentValueEnum "RESOLVED"
