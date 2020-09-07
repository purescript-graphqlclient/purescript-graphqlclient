module Examples.Github.Enum.PackageFileOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PackageFileOrderField
data PackageFileOrderField = CreatedAt

derive instance eqPackageFileOrderField :: Eq PackageFileOrderField

derive instance ordPackageFileOrderField :: Ord PackageFileOrderField

fromToMap :: Array (Tuple String PackageFileOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance packageFileOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                     PackageFileOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PackageFileOrderField"
                                        fromToMap

instance packageFileOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                        PackageFileOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
