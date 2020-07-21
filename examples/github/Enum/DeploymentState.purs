module Examples.Github.Enum.DeploymentState where

import Prelude
import GraphqlClient
import Data.Tuple

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

fromToMap :: Array (Tuple String DeploymentState)
fromToMap = [Tuple "ABANDONED" Abandoned, Tuple "ACTIVE" Active, Tuple "DESTROYED" Destroyed, Tuple "ERROR" Error, Tuple "FAILURE" Failure, Tuple "INACTIVE" Inactive, Tuple "PENDING" Pending, Tuple "QUEUED" Queued, Tuple "IN_PROGRESS" InProgress]

instance deploymentStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder DeploymentState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "DeploymentState" fromToMap

instance deploymentStateToGraphqlArgumentValue :: ToGraphqlArgumentValue DeploymentState where
  toGraphqlArgumentValue =
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
