module Examples.Github.Enum.PackageFileOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PackageFileOrderField
data PackageFileOrderField
  = CreatedAt

fromToMap :: Array (Tuple String PackageFileOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt]

instance packageFileOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PackageFileOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PackageFileOrderField" fromToMap

instance packageFileOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue PackageFileOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
