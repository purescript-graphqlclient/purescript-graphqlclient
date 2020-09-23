module Examples.Github.Enum.FileViewedState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - FileViewedState
data FileViewedState = Dismissed | Viewed | Unviewed

derive instance eqFileViewedState :: Eq FileViewedState

derive instance ordFileViewedState :: Ord FileViewedState

fromToMap :: Array (Tuple String FileViewedState)
fromToMap = [ Tuple "DISMISSED" Dismissed
            , Tuple "VIEWED" Viewed
            , Tuple "UNVIEWED" Unviewed
            ]

instance fileViewedStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                               FileViewedState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "FileViewedState" fromToMap

instance fileViewedStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                  FileViewedState where
  toGraphQLArgumentValue =
    case _ of
      Dismissed -> ArgumentValueEnum "DISMISSED"
      Viewed -> ArgumentValueEnum "VIEWED"
      Unviewed -> ArgumentValueEnum "UNVIEWED"
