module Examples.Swapi.Enum.Language where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - Language
data Language = En | Es | No

derive instance eqLanguage :: Eq Language

derive instance ordLanguage :: Ord Language

fromToMap :: Array (Tuple String Language)
fromToMap = [ Tuple "EN" En, Tuple "ES" Es, Tuple "NO" No ]

instance languageGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                        Language where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Language" fromToMap

instance languageToGraphQLArgumentValue :: ToGraphQLArgumentValue Language where
  toGraphQLArgumentValue =
    case _ of
      En -> ArgumentValueEnum "EN"
      Es -> ArgumentValueEnum "ES"
      No -> ArgumentValueEnum "NO"
