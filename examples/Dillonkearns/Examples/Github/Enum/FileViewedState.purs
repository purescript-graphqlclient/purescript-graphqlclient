module Dillonkearns.Examples.Github.Enum.FileViewedState where

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

-- | original name - FileViewedState
data FileViewedState = Dismissed | Viewed | Unviewed

derive instance genericFileViewedState :: Generic FileViewedState _

instance showFileViewedState :: Show FileViewedState where
  show = genericShow

derive instance eqFileViewedState :: Eq FileViewedState

derive instance ordFileViewedState :: Ord FileViewedState

fromToMap :: Array (Tuple String FileViewedState)
fromToMap = [ Tuple "DISMISSED" Dismissed
            , Tuple "VIEWED" Viewed
            , Tuple "UNVIEWED" Unviewed
            ]

instance fileViewedStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder FileViewedState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "FileViewedState" fromToMap

instance fileViewedStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue FileViewedState where
  toGraphQLArgumentValue =
    case _ of
      Dismissed -> ArgumentValueEnum "DISMISSED"
      Viewed -> ArgumentValueEnum "VIEWED"
      Unviewed -> ArgumentValueEnum "UNVIEWED"
