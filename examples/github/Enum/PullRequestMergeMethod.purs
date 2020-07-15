module Examples.Github.Enum.PullRequestMergeMethod where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PullRequestMergeMethod
data PullRequestMergeMethod
  = Merge
  | Squash
  | Rebase

fromToMap :: Array (Tuple String PullRequestMergeMethod)
fromToMap = [Tuple "MERGE" Merge, Tuple "SQUASH" Squash, Tuple "REBASE" Rebase]

instance pullRequestMergeMethodGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PullRequestMergeMethod where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestMergeMethod" fromToMap

instance pullRequestMergeMethodToGraphqlArgumentValue :: ToGraphqlArgumentValue PullRequestMergeMethod where
  toGraphqlArgumentValue =
    case _ of
      Merge -> ArgumentValueString "MERGE"
      Squash -> ArgumentValueString "SQUASH"
      Rebase -> ArgumentValueString "REBASE"
