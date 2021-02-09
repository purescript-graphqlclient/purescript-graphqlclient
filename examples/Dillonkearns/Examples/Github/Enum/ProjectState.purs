module Dillonkearns.Examples.Github.Enum.ProjectState where

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

-- | original name - ProjectState
data ProjectState = Open | Closed

derive instance genericProjectState :: Generic ProjectState _

instance showProjectState :: Show ProjectState where
  show = genericShow

derive instance eqProjectState :: Eq ProjectState

derive instance ordProjectState :: Ord ProjectState

fromToMap :: Array (Tuple String ProjectState)
fromToMap = [ Tuple "OPEN" Open, Tuple "CLOSED" Closed ]

instance projectStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder ProjectState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectState" fromToMap

instance projectStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue ProjectState where
  toGraphQLArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
