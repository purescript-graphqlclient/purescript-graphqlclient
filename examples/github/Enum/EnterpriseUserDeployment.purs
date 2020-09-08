module Examples.Github.Enum.EnterpriseUserDeployment where

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

derive instance eqEnterpriseUserDeployment :: Eq EnterpriseUserDeployment

derive instance ordEnterpriseUserDeployment :: Ord EnterpriseUserDeployment

fromToMap :: Array (Tuple String EnterpriseUserDeployment)
fromToMap = [ Tuple "CLOUD" Cloud, Tuple "SERVER" Server ]

instance enterpriseUserDeploymentGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                        EnterpriseUserDeployment where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseUserDeployment"
                                        fromToMap

instance enterpriseUserDeploymentToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                           EnterpriseUserDeployment where
  toGraphQLArgumentValue =
    case _ of
      Cloud -> ArgumentValueEnum "CLOUD"
      Server -> ArgumentValueEnum "SERVER"
