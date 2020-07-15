module Examples.Github.Enum.DeploymentStatusState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - DeploymentStatusState
data DeploymentStatusState
  = Pending
  | Success
  | Failure
  | Inactive
  | Error
  | Queued
  | InProgress

fromToMap :: Array (Tuple String DeploymentStatusState)
fromToMap = [Tuple "PENDING" Pending, Tuple "SUCCESS" Success, Tuple "FAILURE" Failure, Tuple "INACTIVE" Inactive, Tuple "ERROR" Error, Tuple "QUEUED" Queued, Tuple "IN_PROGRESS" InProgress]

instance deploymentStatusStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder DeploymentStatusState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "DeploymentStatusState" fromToMap

instance deploymentStatusStateToGraphqlArgumentValue :: ToGraphqlArgumentValue DeploymentStatusState where
  toGraphqlArgumentValue =
    case _ of
      Pending -> ArgumentValueString "PENDING"
      Success -> ArgumentValueString "SUCCESS"
      Failure -> ArgumentValueString "FAILURE"
      Inactive -> ArgumentValueString "INACTIVE"
      Error -> ArgumentValueString "ERROR"
      Queued -> ArgumentValueString "QUEUED"
      InProgress -> ArgumentValueString "IN_PROGRESS"
