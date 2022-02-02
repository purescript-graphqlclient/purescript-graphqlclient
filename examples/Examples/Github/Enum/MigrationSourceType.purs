module Examples.Github.Enum.MigrationSourceType where

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

-- | original name - MigrationSourceType
data MigrationSourceType
  = Gitlab
  | AzureDevops
  | BitbucketServer
  | Github
  | GithubArchive

derive instance genericMigrationSourceType :: Generic MigrationSourceType _

instance showMigrationSourceType :: Show MigrationSourceType where
  show = genericShow

derive instance eqMigrationSourceType :: Eq MigrationSourceType

derive instance ordMigrationSourceType :: Ord MigrationSourceType

fromToMap :: Array (Tuple String MigrationSourceType)
fromToMap = [ Tuple "GITLAB" Gitlab
            , Tuple "AZURE_DEVOPS" AzureDevops
            , Tuple "BITBUCKET_SERVER" BitbucketServer
            , Tuple "GITHUB" Github
            , Tuple "GITHUB_ARCHIVE" GithubArchive
            ]

instance migrationSourceTypeGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder MigrationSourceType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "MigrationSourceType"
                                        fromToMap

instance migrationSourceTypeToGraphQLArgumentValue
  :: ToGraphQLArgumentValue MigrationSourceType where
  toGraphQLArgumentValue =
    case _ of
      Gitlab -> ArgumentValueEnum "GITLAB"
      AzureDevops -> ArgumentValueEnum "AZURE_DEVOPS"
      BitbucketServer -> ArgumentValueEnum "BITBUCKET_SERVER"
      Github -> ArgumentValueEnum "GITHUB"
      GithubArchive -> ArgumentValueEnum "GITHUB_ARCHIVE"
