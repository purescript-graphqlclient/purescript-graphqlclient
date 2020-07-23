module Examples.Github.Enum.MergeableState where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - MergeableState
data MergeableState
  = Mergeable
  | Conflicting
  | Unknown

derive instance eqMergeableState :: Eq MergeableState

derive instance ordMergeableState :: Ord MergeableState

fromToMap :: Array (Tuple String MergeableState)
fromToMap = [Tuple "MERGEABLE" Mergeable, Tuple "CONFLICTING" Conflicting, Tuple "UNKNOWN" Unknown]

instance mergeableStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder MergeableState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "MergeableState" fromToMap

instance mergeableStateToGraphqlArgumentValue :: ToGraphqlArgumentValue MergeableState where
  toGraphqlArgumentValue =
    case _ of
      Mergeable -> ArgumentValueEnum "MERGEABLE"
      Conflicting -> ArgumentValueEnum "CONFLICTING"
      Unknown -> ArgumentValueEnum "UNKNOWN"
