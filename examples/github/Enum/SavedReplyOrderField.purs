module Examples.Github.Enum.SavedReplyOrderField where

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

derive instance eqSavedReplyOrderField :: Eq SavedReplyOrderField

derive instance ordSavedReplyOrderField :: Ord SavedReplyOrderField

fromToMap :: Array (Tuple String SavedReplyOrderField)
fromToMap = [ Tuple "UPDATED_AT" UpdatedAt ]

instance savedReplyOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                    SavedReplyOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SavedReplyOrderField"
                                        fromToMap

instance savedReplyOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                       SavedReplyOrderField where
  toGraphQLArgumentValue =
    case _ of
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
