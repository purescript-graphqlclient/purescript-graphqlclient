module Examples.Github.Enum.EnterpriseServerUserAccountOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseServerUserAccountOrderField
data EnterpriseServerUserAccountOrderField
  = Login
  | RemoteCreatedAt

fromToMap :: Array (Tuple String EnterpriseServerUserAccountOrderField)
fromToMap = [Tuple "LOGIN" Login, Tuple "REMOTE_CREATED_AT" RemoteCreatedAt]

instance enterpriseServerUserAccountOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseServerUserAccountOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseServerUserAccountOrderField" fromToMap

instance enterpriseServerUserAccountOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseServerUserAccountOrderField where
  toGraphqlArgumentValue =
    case _ of
      Login -> ArgumentValueEnum "LOGIN"
      RemoteCreatedAt -> ArgumentValueEnum "REMOTE_CREATED_AT"
