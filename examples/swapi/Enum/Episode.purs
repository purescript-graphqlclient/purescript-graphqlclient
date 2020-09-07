module Examples.Swapi.Enum.Episode where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - Episode
data Episode = Empire | Jedi | Newhope

derive instance eqEpisode :: Eq Episode

derive instance ordEpisode :: Ord Episode

fromToMap :: Array (Tuple String Episode)
fromToMap = [ Tuple "EMPIRE" Empire
            , Tuple "JEDI" Jedi
            , Tuple "NEWHOPE" Newhope
            ]

instance episodeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                       Episode where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Episode" fromToMap

instance episodeToGraphqlArgumentValue :: ToGraphqlArgumentValue Episode where
  toGraphqlArgumentValue =
    case _ of
      Empire -> ArgumentValueEnum "EMPIRE"
      Jedi -> ArgumentValueEnum "JEDI"
      Newhope -> ArgumentValueEnum "NEWHOPE"
