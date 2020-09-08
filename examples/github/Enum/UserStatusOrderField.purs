module Examples.Github.Enum.UserStatusOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - UserStatusOrderField
data UserStatusOrderField = UpdatedAt

derive instance eqUserStatusOrderField :: Eq UserStatusOrderField

derive instance ordUserStatusOrderField :: Ord UserStatusOrderField

fromToMap :: Array (Tuple String UserStatusOrderField)
fromToMap = [ Tuple "UPDATED_AT" UpdatedAt ]

instance userStatusOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                    UserStatusOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "UserStatusOrderField"
                                        fromToMap

instance userStatusOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                       UserStatusOrderField where
  toGraphQLArgumentValue =
    case _ of
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
