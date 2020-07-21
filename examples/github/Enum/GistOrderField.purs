module Examples.Github.Enum.GistOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - GistOrderField
data GistOrderField
  = CreatedAt
  | UpdatedAt
  | PushedAt

fromToMap :: Array (Tuple String GistOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt, Tuple "UPDATED_AT" UpdatedAt, Tuple "PUSHED_AT" PushedAt]

instance gistOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder GistOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "GistOrderField" fromToMap

instance gistOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue GistOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      PushedAt -> ArgumentValueEnum "PUSHED_AT"
