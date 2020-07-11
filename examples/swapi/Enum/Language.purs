module Swapi.Enum.Language where

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
