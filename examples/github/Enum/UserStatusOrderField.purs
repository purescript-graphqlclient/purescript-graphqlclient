module Examples.Github.Enum.UserStatusOrderField where

import Prelude
  ( class Eq
  , class Ord
  )
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

derive instance eqUserStatusOrderField :: Eq UserStatusOrderField

derive instance ordUserStatusOrderField :: Ord UserStatusOrderField

fromToMap :: Array (Tuple String UserStatusOrderField)
fromToMap = [Tuple "UPDATED_AT" UpdatedAt]

instance userStatusOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder UserStatusOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "UserStatusOrderField" fromToMap

instance userStatusOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue UserStatusOrderField where
  toGraphqlArgumentValue =
    case _ of
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
