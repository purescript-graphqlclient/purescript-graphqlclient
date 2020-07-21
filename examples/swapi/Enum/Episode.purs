module Examples.Swapi.Enum.Episode where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - Episode
data Episode
  = Empire
  | Jedi
  | Newhope

fromToMap :: Array (Tuple String Episode)
fromToMap = [Tuple "EMPIRE" Empire, Tuple "JEDI" Jedi, Tuple "NEWHOPE" Newhope]

instance episodeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder Episode where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Episode" fromToMap

instance episodeToGraphqlArgumentValue :: ToGraphqlArgumentValue Episode where
  toGraphqlArgumentValue =
    case _ of
      Empire -> ArgumentValueEnum "EMPIRE"
      Jedi -> ArgumentValueEnum "JEDI"
      Newhope -> ArgumentValueEnum "NEWHOPE"
