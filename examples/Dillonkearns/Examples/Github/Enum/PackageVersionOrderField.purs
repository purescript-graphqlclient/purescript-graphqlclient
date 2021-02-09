module Dillonkearns.Examples.Github.Enum.PackageVersionOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PackageVersionOrderField
data PackageVersionOrderField = CreatedAt

derive instance genericPackageVersionOrderField
  ::
  Generic PackageVersionOrderField _

instance showPackageVersionOrderField :: Show PackageVersionOrderField where
  show = genericShow

derive instance eqPackageVersionOrderField :: Eq PackageVersionOrderField

derive instance ordPackageVersionOrderField :: Ord PackageVersionOrderField

fromToMap :: Array (Tuple String PackageVersionOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance packageVersionOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder PackageVersionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PackageVersionOrderField"
                                        fromToMap

instance packageVersionOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue PackageVersionOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
