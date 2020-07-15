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
      CreatedAt -> ArgumentValueString "CREATED_AT"
      UpdatedAt -> ArgumentValueString "UPDATED_AT"
      Comments -> ArgumentValueString "COMMENTS"
