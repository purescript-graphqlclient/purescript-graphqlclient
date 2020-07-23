module Examples.Github.Enum.PackageVersionOrderField where

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

-- | original name - PackageVersionOrderField
data PackageVersionOrderField
  = CreatedAt

derive instance eqPackageVersionOrderField :: Eq PackageVersionOrderField

derive instance ordPackageVersionOrderField :: Ord PackageVersionOrderField

fromToMap :: Array (Tuple String PackageVersionOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt]

instance packageVersionOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PackageVersionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PackageVersionOrderField" fromToMap

instance packageVersionOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue PackageVersionOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
