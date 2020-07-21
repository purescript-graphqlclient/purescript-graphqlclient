module Examples.Github.Enum.IssueOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - IssueOrderField
data IssueOrderField
  = CreatedAt
  | UpdatedAt
  | Comments

fromToMap :: Array (Tuple String IssueOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt, Tuple "UPDATED_AT" UpdatedAt, Tuple "COMMENTS" Comments]

instance issueOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder IssueOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "IssueOrderField" fromToMap

instance issueOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue IssueOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      Comments -> ArgumentValueEnum "COMMENTS"
