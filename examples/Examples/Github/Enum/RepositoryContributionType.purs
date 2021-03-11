module Examples.Github.Enum.RepositoryContributionType where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepositoryContributionType
data RepositoryContributionType
  = Commit
  | Issue
  | PullRequest
  | Repository
  | PullRequestReview

derive instance genericRepositoryContributionType
  ::
  Generic RepositoryContributionType _

instance showRepositoryContributionType :: Show RepositoryContributionType where
  show = genericShow

derive instance eqRepositoryContributionType :: Eq RepositoryContributionType

derive instance ordRepositoryContributionType :: Ord RepositoryContributionType

fromToMap :: Array (Tuple String RepositoryContributionType)
fromToMap = [ Tuple "COMMIT" Commit
            , Tuple "ISSUE" Issue
            , Tuple "PULL_REQUEST" PullRequest
            , Tuple "REPOSITORY" Repository
            , Tuple "PULL_REQUEST_REVIEW" PullRequestReview
            ]

instance repositoryContributionTypeGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RepositoryContributionType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryContributionType"
                                        fromToMap

instance repositoryContributionTypeToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RepositoryContributionType where
  toGraphQLArgumentValue =
    case _ of
      Commit -> ArgumentValueEnum "COMMIT"
      Issue -> ArgumentValueEnum "ISSUE"
      PullRequest -> ArgumentValueEnum "PULL_REQUEST"
      Repository -> ArgumentValueEnum "REPOSITORY"
      PullRequestReview -> ArgumentValueEnum "PULL_REQUEST_REVIEW"
