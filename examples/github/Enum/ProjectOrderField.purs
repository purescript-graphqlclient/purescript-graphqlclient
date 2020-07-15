module Examples.Github.Enum.ProjectOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - ProjectOrderField
data ProjectOrderField
  = CreatedAt
  | UpdatedAt
  | Name

fromToMap :: Array (Tuple String ProjectOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt, Tuple "UPDATED_AT" UpdatedAt, Tuple "NAME" Name]

instance projectOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ProjectOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectOrderField" fromToMap

instance projectOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue ProjectOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueString "CREATED_AT"
      UpdatedAt -> ArgumentValueString "UPDATED_AT"
      Name -> ArgumentValueString "NAME"
