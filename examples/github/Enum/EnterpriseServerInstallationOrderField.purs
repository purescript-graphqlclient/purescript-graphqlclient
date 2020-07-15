module Examples.Github.Enum.EnterpriseServerInstallationOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseServerInstallationOrderField
data EnterpriseServerInstallationOrderField
  = HostName
  | CustomerName
  | CreatedAt

fromToMap :: Array (Tuple String EnterpriseServerInstallationOrderField)
fromToMap = [Tuple "HOST_NAME" HostName, Tuple "CUSTOMER_NAME" CustomerName, Tuple "CREATED_AT" CreatedAt]

instance enterpriseServerInstallationOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseServerInstallationOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseServerInstallationOrderField" fromToMap

instance enterpriseServerInstallationOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseServerInstallationOrderField where
  toGraphqlArgumentValue =
    case _ of
      HostName -> ArgumentValueString "HOST_NAME"
      CustomerName -> ArgumentValueString "CUSTOMER_NAME"
      CreatedAt -> ArgumentValueString "CREATED_AT"
