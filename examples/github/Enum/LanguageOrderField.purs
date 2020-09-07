module Examples.Github.Enum.LanguageOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - LanguageOrderField
data LanguageOrderField = Size

derive instance eqLanguageOrderField :: Eq LanguageOrderField

derive instance ordLanguageOrderField :: Ord LanguageOrderField

fromToMap :: Array (Tuple String LanguageOrderField)
fromToMap = [ Tuple "SIZE" Size ]

instance languageOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                  LanguageOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "LanguageOrderField"
                                        fromToMap

instance languageOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                     LanguageOrderField where
  toGraphQLArgumentValue =
    case _ of
      Size -> ArgumentValueEnum "SIZE"
