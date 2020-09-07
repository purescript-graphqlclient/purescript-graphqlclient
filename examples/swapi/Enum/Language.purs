module Examples.Swapi.Enum.Language where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - Language
data Language = En | Es | No

derive instance eqLanguage :: Eq Language

derive instance ordLanguage :: Ord Language

fromToMap :: Array (Tuple String Language)
fromToMap = [ Tuple "EN" En, Tuple "ES" Es, Tuple "NO" No ]

instance languageGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                        Language where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Language" fromToMap

instance languageToGraphqlArgumentValue :: ToGraphqlArgumentValue Language where
  toGraphqlArgumentValue =
    case _ of
      En -> ArgumentValueEnum "EN"
      Es -> ArgumentValueEnum "ES"
      No -> ArgumentValueEnum "NO"
