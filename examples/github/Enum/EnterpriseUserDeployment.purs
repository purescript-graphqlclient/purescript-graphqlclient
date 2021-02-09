module Examples.Github.Enum.EnterpriseUserDeployment where

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

-- | original name - EnterpriseUserDeployment
data EnterpriseUserDeployment = Cloud | Server

derive instance genericEnterpriseUserDeployment
  ::
  Generic EnterpriseUserDeployment _

instance showEnterpriseUserDeployment :: Show EnterpriseUserDeployment where
  show = genericShow

derive instance eqEnterpriseUserDeployment :: Eq EnterpriseUserDeployment

derive instance ordEnterpriseUserDeployment :: Ord EnterpriseUserDeployment

fromToMap :: Array (Tuple String EnterpriseUserDeployment)
fromToMap = [ Tuple "CLOUD" Cloud, Tuple "SERVER" Server ]

instance enterpriseUserDeploymentGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder EnterpriseUserDeployment where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseUserDeployment"
                                        fromToMap

instance enterpriseUserDeploymentToGraphQLArgumentValue
  :: ToGraphQLArgumentValue EnterpriseUserDeployment where
  toGraphQLArgumentValue =
    case _ of
      Cloud -> ArgumentValueEnum "CLOUD"
      Server -> ArgumentValueEnum "SERVER"
