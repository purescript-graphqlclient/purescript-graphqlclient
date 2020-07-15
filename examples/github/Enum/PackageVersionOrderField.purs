module Examples.Github.Enum.PackageVersionOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PackageVersionOrderField
data PackageVersionOrderField
  = CreatedAt

fromToMap :: Array (Tuple String PackageVersionOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt]

instance packageVersionOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PackageVersionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PackageVersionOrderField" fromToMap

instance packageVersionOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue PackageVersionOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueString "CREATED_AT"
