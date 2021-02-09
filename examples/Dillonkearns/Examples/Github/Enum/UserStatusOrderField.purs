module Dillonkearns.Examples.Github.Enum.UserStatusOrderField where

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

-- | original name - UserStatusOrderField
data UserStatusOrderField = UpdatedAt

derive instance genericUserStatusOrderField :: Generic UserStatusOrderField _

instance showUserStatusOrderField :: Show UserStatusOrderField where
  show = genericShow

derive instance eqUserStatusOrderField :: Eq UserStatusOrderField

derive instance ordUserStatusOrderField :: Ord UserStatusOrderField

fromToMap :: Array (Tuple String UserStatusOrderField)
fromToMap = [ Tuple "UPDATED_AT" UpdatedAt ]

instance userStatusOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder UserStatusOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "UserStatusOrderField"
                                        fromToMap

instance userStatusOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue UserStatusOrderField where
  toGraphQLArgumentValue =
    case _ of
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
