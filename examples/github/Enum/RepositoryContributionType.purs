module Examples.Github.Enum.RepositoryContributionType where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepositoryContributionType
data RepositoryContributionType
  = Commit
  | Issue
  | PullRequest
  | Repository
  | PullRequestReview

fromToMap :: Array (Tuple String RepositoryContributionType)
fromToMap = [Tuple "COMMIT" Commit, Tuple "ISSUE" Issue, Tuple "PULL_REQUEST" PullRequest, Tuple "REPOSITORY" Repository, Tuple "PULL_REQUEST_REVIEW" PullRequestReview]

instance repositoryContributionTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepositoryContributionType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepositoryContributionType" fromToMap

instance repositoryContributionTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue RepositoryContributionType where
  toGraphqlArgumentValue =
    case _ of
      Commit -> ArgumentValueString "COMMIT"
      Issue -> ArgumentValueString "ISSUE"
      PullRequest -> ArgumentValueString "PULL_REQUEST"
      Repository -> ArgumentValueString "REPOSITORY"
      PullRequestReview -> ArgumentValueString "PULL_REQUEST_REVIEW"
