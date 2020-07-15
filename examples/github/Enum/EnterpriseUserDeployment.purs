module Examples.Github.Enum.EnterpriseUserDeployment where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseUserDeployment
data EnterpriseUserDeployment
  = Cloud
  | Server

fromToMap :: Array (Tuple String EnterpriseUserDeployment)
fromToMap = [Tuple "CLOUD" Cloud, Tuple "SERVER" Server]

instance enterpriseUserDeploymentGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseUserDeployment where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseUserDeployment" fromToMap

instance enterpriseUserDeploymentToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseUserDeployment where
  toGraphqlArgumentValue =
    case _ of
      Cloud -> ArgumentValueString "CLOUD"
      Server -> ArgumentValueString "SERVER"
