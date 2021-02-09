module Dillonkearns.Examples.Github.Enum.DeploymentState where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - DeploymentState
data DeploymentState
  = Abandoned
  | Active
  | Destroyed
  | Error
  | Failure
  | Inactive
  | Pending
  | Queued
  | InProgress
  | Waiting

derive instance genericDeploymentState :: Generic DeploymentState _

instance showDeploymentState :: Show DeploymentState where
  show = genericShow

derive instance eqDeploymentState :: Eq DeploymentState

derive instance ordDeploymentState :: Ord DeploymentState

fromToMap :: Array (Tuple String DeploymentState)
fromToMap = [ Tuple "ABANDONED" Abandoned
            , Tuple "ACTIVE" Active
            , Tuple "DESTROYED" Destroyed
            , Tuple "ERROR" Error
            , Tuple "FAILURE" Failure
            , Tuple "INACTIVE" Inactive
            , Tuple "PENDING" Pending
            , Tuple "QUEUED" Queued
            , Tuple "IN_PROGRESS" InProgress
            , Tuple "WAITING" Waiting
            ]

instance deploymentStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder DeploymentState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "DeploymentState" fromToMap

instance deploymentStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue DeploymentState where
  toGraphQLArgumentValue =
    case _ of
      Abandoned -> ArgumentValueEnum "ABANDONED"
      Active -> ArgumentValueEnum "ACTIVE"
      Destroyed -> ArgumentValueEnum "DESTROYED"
      Error -> ArgumentValueEnum "ERROR"
      Failure -> ArgumentValueEnum "FAILURE"
      Inactive -> ArgumentValueEnum "INACTIVE"
      Pending -> ArgumentValueEnum "PENDING"
      Queued -> ArgumentValueEnum "QUEUED"
      InProgress -> ArgumentValueEnum "IN_PROGRESS"
      Waiting -> ArgumentValueEnum "WAITING"
