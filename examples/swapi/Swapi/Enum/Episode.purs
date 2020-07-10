module Swapi.Enum.Episode where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original type - Episode
data Episode
  = Empire
  | Jedi
  | Newhope

fromToMap :: Array (Tuple String Episode)
fromToMap = [Tuple "EMPIRE" Empire, Tuple "JEDI" Jedi, Tuple "NEWHOPE" Newhope]

instance episodeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder Episode where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Episode" fromToMap
