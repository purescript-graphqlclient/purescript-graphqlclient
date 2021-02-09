module Dillonkearns.Examples.Normalize.Enum.Language where

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

-- | original name - Language
data Language = En | Es | No

derive instance genericLanguage :: Generic Language _

instance showLanguage :: Show Language where
  show = genericShow

derive instance eqLanguage :: Eq Language

derive instance ordLanguage :: Ord Language

fromToMap :: Array (Tuple String Language)
fromToMap = [ Tuple "EN" En, Tuple "ES" Es, Tuple "NO" No ]

instance languageGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder Language where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Language" fromToMap

instance languageToGraphQLArgumentValue :: ToGraphQLArgumentValue Language where
  toGraphQLArgumentValue =
    case _ of
      En -> ArgumentValueEnum "EN"
      Es -> ArgumentValueEnum "ES"
      No -> ArgumentValueEnum "NO"
