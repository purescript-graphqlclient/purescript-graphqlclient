module Examples.Github.Enum.ReleaseOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - ReleaseOrderField
data ReleaseOrderField
  = CreatedAt
  | Name

fromToMap :: Array (Tuple String ReleaseOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt, Tuple "NAME" Name]

instance releaseOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ReleaseOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ReleaseOrderField" fromToMap

instance releaseOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue ReleaseOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueString "CREATED_AT"
      Name -> ArgumentValueString "NAME"
