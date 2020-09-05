module Examples.Github.Enum.SavedReplyOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SavedReplyOrderField
data SavedReplyOrderField = UpdatedAt

derive instance eqSavedReplyOrderField :: Eq SavedReplyOrderField

derive instance ordSavedReplyOrderField :: Ord SavedReplyOrderField

fromToMap :: Array (Tuple String SavedReplyOrderField)
fromToMap = [ Tuple "UPDATED_AT" UpdatedAt ]

instance savedReplyOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                    SavedReplyOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SavedReplyOrderField"
                                        fromToMap

instance savedReplyOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                       SavedReplyOrderField where
  toGraphqlArgumentValue =
    case _ of
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
