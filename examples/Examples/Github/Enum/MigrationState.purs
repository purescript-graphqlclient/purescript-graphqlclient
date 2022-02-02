module Examples.Github.Enum.MigrationState where

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

-- | original name - MigrationState
data MigrationState = NotStarted | Queued | InProgress | Succeeded | Failed

derive instance genericMigrationState :: Generic MigrationState _

instance showMigrationState :: Show MigrationState where
  show = genericShow

derive instance eqMigrationState :: Eq MigrationState

derive instance ordMigrationState :: Ord MigrationState

fromToMap :: Array (Tuple String MigrationState)
fromToMap = [ Tuple "NOT_STARTED" NotStarted
            , Tuple "QUEUED" Queued
            , Tuple "IN_PROGRESS" InProgress
            , Tuple "SUCCEEDED" Succeeded
            , Tuple "FAILED" Failed
            ]

instance migrationStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder MigrationState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "MigrationState" fromToMap

instance migrationStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue MigrationState where
  toGraphQLArgumentValue =
    case _ of
      NotStarted -> ArgumentValueEnum "NOT_STARTED"
      Queued -> ArgumentValueEnum "QUEUED"
      InProgress -> ArgumentValueEnum "IN_PROGRESS"
      Succeeded -> ArgumentValueEnum "SUCCEEDED"
      Failed -> ArgumentValueEnum "FAILED"
