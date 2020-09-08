module Examples.Swapi.Enum.Episode where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
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

instance episodeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                       Episode where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Episode" fromToMap

instance episodeToGraphQLArgumentValue :: ToGraphQLArgumentValue Episode where
  toGraphQLArgumentValue =
    case _ of
      Empire -> ArgumentValueEnum "EMPIRE"
      Jedi -> ArgumentValueEnum "JEDI"
      Newhope -> ArgumentValueEnum "NEWHOPE"
