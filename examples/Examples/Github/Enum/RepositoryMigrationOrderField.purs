module Examples.Github.Enum.RepositoryMigrationOrderField where

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

-- | original name - RepositoryMigrationOrderField
data RepositoryMigrationOrderField = CreatedAt

derive instance genericRepositoryMigrationOrderField
  ::
  Generic RepositoryMigrationOrderField _

instance showRepositoryMigrationOrderField
  :: Show RepositoryMigrationOrderField where
  show = genericShow

derive instance eqRepositoryMigrationOrderField
  ::
  Eq RepositoryMigrationOrderField

derive instance ordRepositoryMigrationOrderField
  ::
  Ord RepositoryMigrationOrderField

fromToMap :: Array (Tuple String RepositoryMigrationOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance repositoryMigrationOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RepositoryMigrationOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryMigrationOrderField"
                                        fromToMap

instance repositoryMigrationOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RepositoryMigrationOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
