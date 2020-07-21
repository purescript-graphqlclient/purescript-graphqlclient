module Examples.Github.Enum.LanguageOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - LanguageOrderField
data LanguageOrderField
  = Size

fromToMap :: Array (Tuple String LanguageOrderField)
fromToMap = [Tuple "SIZE" Size]

instance languageOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder LanguageOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "LanguageOrderField" fromToMap

instance languageOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue LanguageOrderField where
  toGraphqlArgumentValue =
    case _ of
      Size -> ArgumentValueEnum "SIZE"
