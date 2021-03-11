module Examples.Github.Enum.SavedReplyOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SavedReplyOrderField
data SavedReplyOrderField = UpdatedAt

derive instance genericSavedReplyOrderField :: Generic SavedReplyOrderField _

instance showSavedReplyOrderField :: Show SavedReplyOrderField where
  show = genericShow

derive instance eqSavedReplyOrderField :: Eq SavedReplyOrderField

derive instance ordSavedReplyOrderField :: Ord SavedReplyOrderField

fromToMap :: Array (Tuple String SavedReplyOrderField)
fromToMap = [ Tuple "UPDATED_AT" UpdatedAt ]

instance savedReplyOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SavedReplyOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SavedReplyOrderField"
                                        fromToMap

instance savedReplyOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SavedReplyOrderField where
  toGraphQLArgumentValue =
    case _ of
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
