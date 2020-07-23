module Examples.Github.Enum.PullRequestMergeMethod where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      Merge -> ArgumentValueEnum "MERGE"
      Squash -> ArgumentValueEnum "SQUASH"
      Rebase -> ArgumentValueEnum "REBASE"
