module Dillonkearns.Examples.Github.Enum.LabelOrderField where

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

-- | original name - LabelOrderField
data LabelOrderField = Name | CreatedAt

derive instance genericLabelOrderField :: Generic LabelOrderField _

instance showLabelOrderField :: Show LabelOrderField where
  show = genericShow

derive instance eqLabelOrderField :: Eq LabelOrderField

derive instance ordLabelOrderField :: Ord LabelOrderField

fromToMap :: Array (Tuple String LabelOrderField)
fromToMap = [ Tuple "NAME" Name, Tuple "CREATED_AT" CreatedAt ]

instance labelOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder LabelOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "LabelOrderField" fromToMap

instance labelOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue LabelOrderField where
  toGraphQLArgumentValue =
    case _ of
      Name -> ArgumentValueEnum "NAME"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
