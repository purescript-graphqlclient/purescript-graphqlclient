module Examples.Github.Enum.DiffSide where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - DiffSide
data DiffSide
  = Left
  | Right

fromToMap :: Array (Tuple String DiffSide)
fromToMap = [Tuple "LEFT" Left, Tuple "RIGHT" Right]

instance diffSideGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder DiffSide where
  graphqlDefaultResponseScalarDecoder = enumDecoder "DiffSide" fromToMap

instance diffSideToGraphqlArgumentValue :: ToGraphqlArgumentValue DiffSide where
  toGraphqlArgumentValue =
    case _ of
      Left -> ArgumentValueEnum "LEFT"
      Right -> ArgumentValueEnum "RIGHT"
