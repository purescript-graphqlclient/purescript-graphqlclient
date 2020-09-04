module Examples.Github.Enum.LanguageOrderField where

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

-- | original name - LanguageOrderField
data LanguageOrderField
  = Size

derive instance eqLanguageOrderField :: Eq LanguageOrderField

derive instance ordLanguageOrderField :: Ord LanguageOrderField

fromToMap :: Array (Tuple String LanguageOrderField)
fromToMap = [Tuple "SIZE" Size]

instance languageOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder LanguageOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "LanguageOrderField" fromToMap

instance languageOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue LanguageOrderField where
  toGraphqlArgumentValue =
    case _ of
      Size -> ArgumentValueEnum "SIZE"
