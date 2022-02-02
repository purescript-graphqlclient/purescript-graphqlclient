module Examples.Github.Enum.RepositoryMigrationOrderDirection where

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

-- | original name - RepositoryMigrationOrderDirection
data RepositoryMigrationOrderDirection = Asc | Desc

derive instance genericRepositoryMigrationOrderDirection
  ::
  Generic RepositoryMigrationOrderDirection _

instance showRepositoryMigrationOrderDirection
  :: Show RepositoryMigrationOrderDirection where
  show = genericShow

derive instance eqRepositoryMigrationOrderDirection
  ::
  Eq RepositoryMigrationOrderDirection

derive instance ordRepositoryMigrationOrderDirection
  ::
  Ord RepositoryMigrationOrderDirection

fromToMap :: Array (Tuple String RepositoryMigrationOrderDirection)
fromToMap = [ Tuple "ASC" Asc, Tuple "DESC" Desc ]

instance repositoryMigrationOrderDirectionGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RepositoryMigrationOrderDirection where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryMigrationOrderDirection"
                                        fromToMap

instance repositoryMigrationOrderDirectionToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RepositoryMigrationOrderDirection where
  toGraphQLArgumentValue =
    case _ of
      Asc -> ArgumentValueEnum "ASC"
      Desc -> ArgumentValueEnum "DESC"
