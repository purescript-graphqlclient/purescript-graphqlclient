module Examples.Github.Enum.UserStatusOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - UserStatusOrderField
data UserStatusOrderField
  = UpdatedAt

fromToMap :: Array (Tuple String UserStatusOrderField)
fromToMap = [Tuple "UPDATED_AT" UpdatedAt]

instance userStatusOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder UserStatusOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "UserStatusOrderField" fromToMap

instance userStatusOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue UserStatusOrderField where
  toGraphqlArgumentValue =
    case _ of
      UpdatedAt -> ArgumentValueString "UPDATED_AT"
