module Examples.Github.Enum.PackageOrderField where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PackageOrderField
data PackageOrderField
  = CreatedAt

derive instance eqPackageOrderField :: Eq PackageOrderField

derive instance ordPackageOrderField :: Ord PackageOrderField

fromToMap :: Array (Tuple String PackageOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt]

instance packageOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PackageOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PackageOrderField" fromToMap

instance packageOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue PackageOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
