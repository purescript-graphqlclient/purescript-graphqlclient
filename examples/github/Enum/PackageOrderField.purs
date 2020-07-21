module Examples.Github.Enum.PackageOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PackageOrderField
data PackageOrderField
  = CreatedAt

fromToMap :: Array (Tuple String PackageOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt]

instance packageOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PackageOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PackageOrderField" fromToMap

instance packageOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue PackageOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
