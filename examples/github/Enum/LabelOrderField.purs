module Examples.Github.Enum.LabelOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - LabelOrderField
data LabelOrderField
  = Name
  | CreatedAt

fromToMap :: Array (Tuple String LabelOrderField)
fromToMap = [Tuple "NAME" Name, Tuple "CREATED_AT" CreatedAt]

instance labelOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder LabelOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "LabelOrderField" fromToMap

instance labelOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue LabelOrderField where
  toGraphqlArgumentValue =
    case _ of
      Name -> ArgumentValueString "NAME"
      CreatedAt -> ArgumentValueString "CREATED_AT"
