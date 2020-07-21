module Examples.Github.Enum.MergeableState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - MergeableState
data MergeableState
  = Mergeable
  | Conflicting
  | Unknown

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
