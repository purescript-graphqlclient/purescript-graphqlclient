module Examples.Github.Enum.DiffSide where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
