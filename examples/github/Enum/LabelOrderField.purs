module Examples.Github.Enum.LabelOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - LabelOrderField
data LabelOrderField = Name | CreatedAt

derive instance eqLabelOrderField :: Eq LabelOrderField

derive instance ordLabelOrderField :: Ord LabelOrderField

fromToMap :: Array (Tuple String LabelOrderField)
fromToMap = [ Tuple "NAME" Name, Tuple "CREATED_AT" CreatedAt ]

instance labelOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                               LabelOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "LabelOrderField" fromToMap

instance labelOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                  LabelOrderField where
  toGraphQLArgumentValue =
    case _ of
      Name -> ArgumentValueEnum "NAME"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
