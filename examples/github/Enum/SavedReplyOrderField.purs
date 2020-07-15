module Examples.Github.Enum.SavedReplyOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SavedReplyOrderField
data SavedReplyOrderField
  = UpdatedAt

fromToMap :: Array (Tuple String SavedReplyOrderField)
fromToMap = [Tuple "UPDATED_AT" UpdatedAt]

instance savedReplyOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SavedReplyOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SavedReplyOrderField" fromToMap

instance savedReplyOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue SavedReplyOrderField where
  toGraphqlArgumentValue =
    case _ of
      UpdatedAt -> ArgumentValueString "UPDATED_AT"
