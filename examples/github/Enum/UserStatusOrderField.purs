module Examples.Github.Enum.UserStatusOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
