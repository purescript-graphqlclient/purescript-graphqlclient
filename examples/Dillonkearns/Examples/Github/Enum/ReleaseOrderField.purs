module Dillonkearns.Examples.Github.Enum.ReleaseOrderField where

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

-- | original name - ReleaseOrderField
data ReleaseOrderField = CreatedAt | Name

derive instance genericReleaseOrderField :: Generic ReleaseOrderField _

instance showReleaseOrderField :: Show ReleaseOrderField where
  show = genericShow

derive instance eqReleaseOrderField :: Eq ReleaseOrderField

derive instance ordReleaseOrderField :: Ord ReleaseOrderField

fromToMap :: Array (Tuple String ReleaseOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt, Tuple "NAME" Name ]

instance releaseOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder ReleaseOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ReleaseOrderField"
                                        fromToMap

instance releaseOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue ReleaseOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      Name -> ArgumentValueEnum "NAME"
