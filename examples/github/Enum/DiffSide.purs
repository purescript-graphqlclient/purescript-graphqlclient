module Examples.Github.Enum.DiffSide where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - DiffSide
data DiffSide = Left | Right

derive instance genericDiffSide :: Generic DiffSide _

instance showDiffSide :: Show DiffSide where
  show = genericShow

derive instance eqDiffSide :: Eq DiffSide

derive instance ordDiffSide :: Ord DiffSide

fromToMap :: Array (Tuple String DiffSide)
fromToMap = [ Tuple "LEFT" Left, Tuple "RIGHT" Right ]

instance diffSideGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                        DiffSide where
  graphqlDefaultResponseScalarDecoder = enumDecoder "DiffSide" fromToMap

instance diffSideToGraphQLArgumentValue :: ToGraphQLArgumentValue DiffSide where
  toGraphQLArgumentValue =
    case _ of
      Left -> ArgumentValueEnum "LEFT"
      Right -> ArgumentValueEnum "RIGHT"
