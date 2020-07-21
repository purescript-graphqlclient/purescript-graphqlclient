module Examples.Github.Enum.PullRequestOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PullRequestOrderField
data PullRequestOrderField
  = CreatedAt
  | UpdatedAt

fromToMap :: Array (Tuple String PullRequestOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt, Tuple "UPDATED_AT" UpdatedAt]

instance pullRequestOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PullRequestOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestOrderField" fromToMap

instance pullRequestOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue PullRequestOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
