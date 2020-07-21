module Examples.Swapi.Enum.Language where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - Language
data Language
  = En
  | Es
  | No

fromToMap :: Array (Tuple String Language)
fromToMap = [Tuple "EN" En, Tuple "ES" Es, Tuple "NO" No]

instance languageGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder Language where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Language" fromToMap

instance languageToGraphqlArgumentValue :: ToGraphqlArgumentValue Language where
  toGraphqlArgumentValue =
    case _ of
      En -> ArgumentValueEnum "EN"
      Es -> ArgumentValueEnum "ES"
      No -> ArgumentValueEnum "NO"
