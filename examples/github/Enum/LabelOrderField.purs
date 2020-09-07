module Examples.Github.Enum.LabelOrderField where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - LabelOrderField
data LabelOrderField = Name | CreatedAt

derive instance eqLabelOrderField :: Eq LabelOrderField

derive instance ordLabelOrderField :: Ord LabelOrderField

fromToMap :: Array (Tuple String LabelOrderField)
fromToMap = [ Tuple "NAME" Name, Tuple "CREATED_AT" CreatedAt ]

instance labelOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                               LabelOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "LabelOrderField" fromToMap

instance labelOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                  LabelOrderField where
  toGraphqlArgumentValue =
    case _ of
      Name -> ArgumentValueEnum "NAME"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
