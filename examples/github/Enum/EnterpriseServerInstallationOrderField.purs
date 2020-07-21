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
      HostName -> ArgumentValueEnum "HOST_NAME"
      CustomerName -> ArgumentValueEnum "CUSTOMER_NAME"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
