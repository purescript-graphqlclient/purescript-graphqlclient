module Examples.Github.Enum.DeploymentReviewState where

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

-- | original name - DeploymentReviewState
data DeploymentReviewState = Approved | Rejected

derive instance genericDeploymentReviewState :: Generic DeploymentReviewState _

instance showDeploymentReviewState :: Show DeploymentReviewState where
  show = genericShow

derive instance eqDeploymentReviewState :: Eq DeploymentReviewState

derive instance ordDeploymentReviewState :: Ord DeploymentReviewState

fromToMap :: Array (Tuple String DeploymentReviewState)
fromToMap = [ Tuple "APPROVED" Approved, Tuple "REJECTED" Rejected ]

instance deploymentReviewStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder DeploymentReviewState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "DeploymentReviewState"
                                        fromToMap

instance deploymentReviewStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue DeploymentReviewState where
  toGraphQLArgumentValue =
    case _ of
      Approved -> ArgumentValueEnum "APPROVED"
      Rejected -> ArgumentValueEnum "REJECTED"
