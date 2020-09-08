module Examples.Github.Enum.PullRequestMergeMethod where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PullRequestMergeMethod
data PullRequestMergeMethod = Merge | Squash | Rebase

derive instance eqPullRequestMergeMethod :: Eq PullRequestMergeMethod

derive instance ordPullRequestMergeMethod :: Ord PullRequestMergeMethod

fromToMap :: Array (Tuple String PullRequestMergeMethod)
fromToMap = [ Tuple "MERGE" Merge
            , Tuple "SQUASH" Squash
            , Tuple "REBASE" Rebase
            ]

instance pullRequestMergeMethodGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                      PullRequestMergeMethod where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestMergeMethod"
                                        fromToMap

instance pullRequestMergeMethodToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                         PullRequestMergeMethod where
  toGraphQLArgumentValue =
    case _ of
      Merge -> ArgumentValueEnum "MERGE"
      Squash -> ArgumentValueEnum "SQUASH"
      Rebase -> ArgumentValueEnum "REBASE"
