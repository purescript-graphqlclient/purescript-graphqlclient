module Examples.Github.Enum.DeploymentStatusState where

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

-- | original name - DeploymentStatusState
data DeploymentStatusState
  = Pending
  | Success
  | Failure
  | Inactive
  | Error
  | Queued
  | InProgress
  | Waiting

derive instance genericDeploymentStatusState :: Generic DeploymentStatusState _

instance showDeploymentStatusState :: Show DeploymentStatusState where
  show = genericShow

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
            , Tuple "WAITING" Waiting
            ]

instance deploymentStatusStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder DeploymentStatusState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "DeploymentStatusState"
                                        fromToMap

instance deploymentStatusStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue DeploymentStatusState where
  toGraphQLArgumentValue =
    case _ of
      Pending -> ArgumentValueEnum "PENDING"
      Success -> ArgumentValueEnum "SUCCESS"
      Failure -> ArgumentValueEnum "FAILURE"
      Inactive -> ArgumentValueEnum "INACTIVE"
      Error -> ArgumentValueEnum "ERROR"
      Queued -> ArgumentValueEnum "QUEUED"
      InProgress -> ArgumentValueEnum "IN_PROGRESS"
      Waiting -> ArgumentValueEnum "WAITING"
