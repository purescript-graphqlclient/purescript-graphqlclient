module Examples.Github.Enum.EnterpriseUserDeployment where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseUserDeployment
data EnterpriseUserDeployment
  = Cloud
  | Server

derive instance eqEnterpriseUserDeployment :: Eq EnterpriseUserDeployment

derive instance ordEnterpriseUserDeployment :: Ord EnterpriseUserDeployment

fromToMap :: Array (Tuple String EnterpriseUserDeployment)
fromToMap = [Tuple "CLOUD" Cloud, Tuple "SERVER" Server]

instance enterpriseUserDeploymentGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseUserDeployment where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseUserDeployment" fromToMap

instance enterpriseUserDeploymentToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseUserDeployment where
  toGraphqlArgumentValue =
    case _ of
      Cloud -> ArgumentValueEnum "CLOUD"
      Server -> ArgumentValueEnum "SERVER"
