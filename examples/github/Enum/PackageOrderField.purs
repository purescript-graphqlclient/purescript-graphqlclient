module Examples.Github.Enum.PackageOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PackageOrderField
data PackageOrderField = CreatedAt

derive instance genericPackageOrderField :: Generic PackageOrderField _

instance showPackageOrderField :: Show PackageOrderField where
  show = genericShow

derive instance eqPackageOrderField :: Eq PackageOrderField

derive instance ordPackageOrderField :: Ord PackageOrderField

fromToMap :: Array (Tuple String PackageOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance packageOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder PackageOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PackageOrderField"
                                        fromToMap

instance packageOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue PackageOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
