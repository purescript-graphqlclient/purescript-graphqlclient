module Examples.Github.Enum.PackageVersionOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PackageVersionOrderField
data PackageVersionOrderField = CreatedAt

derive instance eqPackageVersionOrderField :: Eq PackageVersionOrderField

derive instance ordPackageVersionOrderField :: Ord PackageVersionOrderField

fromToMap :: Array (Tuple String PackageVersionOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance packageVersionOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                        PackageVersionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PackageVersionOrderField"
                                        fromToMap

instance packageVersionOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                           PackageVersionOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
