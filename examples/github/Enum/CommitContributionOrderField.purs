module Examples.Github.Enum.CommitContributionOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - CommitContributionOrderField
data CommitContributionOrderField = OccurredAt | CommitCount

derive instance eqCommitContributionOrderField :: Eq CommitContributionOrderField

derive instance ordCommitContributionOrderField :: Ord CommitContributionOrderField

fromToMap :: Array (Tuple String CommitContributionOrderField)
fromToMap = [ Tuple "OCCURRED_AT" OccurredAt, Tuple "COMMIT_COUNT" CommitCount ]

instance commitContributionOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                            CommitContributionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "CommitContributionOrderField"
                                        fromToMap

instance commitContributionOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                               CommitContributionOrderField where
  toGraphQLArgumentValue =
    case _ of
      OccurredAt -> ArgumentValueEnum "OCCURRED_AT"
      CommitCount -> ArgumentValueEnum "COMMIT_COUNT"
