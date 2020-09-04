module Examples.Github.Enum.RepositoryContributionType where

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

-- | original name - RepositoryContributionType
data RepositoryContributionType
  = Commit
  | Issue
  | PullRequest
  | Repository
  | PullRequestReview

derive instance eqRepositoryContributionType :: Eq RepositoryContributionType

derive instance ordRepositoryContributionType :: Ord RepositoryContributionType

fromToMap :: Array (Tuple String RepositoryContributionType)
fromToMap = [Tuple "COMMIT" Commit, Tuple "ISSUE" Issue, Tuple "PULL_REQUEST" PullRequest, Tuple "REPOSITORY" Repository, Tuple "PULL_REQUEST_REVIEW" PullRequestReview]

instance repositoryContributionTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepositoryContributionType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepositoryContributionType" fromToMap

instance repositoryContributionTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue RepositoryContributionType where
  toGraphqlArgumentValue =
    case _ of
      Commit -> ArgumentValueEnum "COMMIT"
      Issue -> ArgumentValueEnum "ISSUE"
      PullRequest -> ArgumentValueEnum "PULL_REQUEST"
      Repository -> ArgumentValueEnum "REPOSITORY"
      PullRequestReview -> ArgumentValueEnum "PULL_REQUEST_REVIEW"
