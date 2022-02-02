module Examples.Github.Enum.DeploymentProtectionRuleType where

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

-- | original name - DeploymentProtectionRuleType
data DeploymentProtectionRuleType = RequiredReviewers | WaitTimer

derive instance genericDeploymentProtectionRuleType
  ::
  Generic DeploymentProtectionRuleType _

instance showDeploymentProtectionRuleType
  :: Show DeploymentProtectionRuleType where
  show = genericShow

derive instance eqDeploymentProtectionRuleType
  ::
  Eq DeploymentProtectionRuleType

derive instance ordDeploymentProtectionRuleType
  ::
  Ord DeploymentProtectionRuleType

fromToMap :: Array (Tuple String DeploymentProtectionRuleType)
fromToMap = [ Tuple "REQUIRED_REVIEWERS" RequiredReviewers
            , Tuple "WAIT_TIMER" WaitTimer
            ]

instance deploymentProtectionRuleTypeGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder DeploymentProtectionRuleType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "DeploymentProtectionRuleType"
                                        fromToMap

instance deploymentProtectionRuleTypeToGraphQLArgumentValue
  :: ToGraphQLArgumentValue DeploymentProtectionRuleType where
  toGraphQLArgumentValue =
    case _ of
      RequiredReviewers -> ArgumentValueEnum "REQUIRED_REVIEWERS"
      WaitTimer -> ArgumentValueEnum "WAIT_TIMER"
