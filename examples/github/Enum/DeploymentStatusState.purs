module Examples.Github.Enum.DeploymentStatusState where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - DeploymentStatusState
data DeploymentStatusState
  = Pending | Success | Failure | Inactive | Error | Queued | InProgress

derive instance eqDeploymentStatusState :: Eq DeploymentStatusState

derive instance ordDeploymentStatusState :: Ord DeploymentStatusState

fromToMap :: Array (Tuple String DeploymentStatusState)
fromToMap = [ Tuple "PENDING" Pending
            , Tuple "SUCCESS" Success
            , Tuple "FAILURE" Failure
            , Tuple "INACTIVE" Inactive
            , Tuple "ERROR" Error
            , Tuple "QUEUED" Queued
            , Tuple "IN_PROGRESS" InProgress
            ]

instance deploymentStatusStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                     DeploymentStatusState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "DeploymentStatusState"
                                        fromToMap

instance deploymentStatusStateToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                        DeploymentStatusState where
  toGraphqlArgumentValue =
    case _ of
      Pending -> ArgumentValueEnum "PENDING"
      Success -> ArgumentValueEnum "SUCCESS"
      Failure -> ArgumentValueEnum "FAILURE"
      Inactive -> ArgumentValueEnum "INACTIVE"
      Error -> ArgumentValueEnum "ERROR"
      Queued -> ArgumentValueEnum "QUEUED"
      InProgress -> ArgumentValueEnum "IN_PROGRESS"
