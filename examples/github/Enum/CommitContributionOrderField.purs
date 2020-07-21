module Examples.Github.Enum.CommitContributionOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - CommitContributionOrderField
data CommitContributionOrderField
  = OccurredAt
  | CommitCount

fromToMap :: Array (Tuple String CommitContributionOrderField)
fromToMap = [Tuple "OCCURRED_AT" OccurredAt, Tuple "COMMIT_COUNT" CommitCount]

instance commitContributionOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder CommitContributionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "CommitContributionOrderField" fromToMap

instance commitContributionOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue CommitContributionOrderField where
  toGraphqlArgumentValue =
    case _ of
      OccurredAt -> ArgumentValueEnum "OCCURRED_AT"
      CommitCount -> ArgumentValueEnum "COMMIT_COUNT"
