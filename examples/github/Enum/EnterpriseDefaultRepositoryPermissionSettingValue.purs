module Examples.Github.Enum.EnterpriseDefaultRepositoryPermissionSettingValue where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseDefaultRepositoryPermissionSettingValue
data EnterpriseDefaultRepositoryPermissionSettingValue
  = NoPolicy
  | Admin
  | Write
  | Read
  | None

fromToMap :: Array (Tuple String EnterpriseDefaultRepositoryPermissionSettingValue)
fromToMap = [Tuple "NO_POLICY" NoPolicy, Tuple "ADMIN" Admin, Tuple "WRITE" Write, Tuple "READ" Read, Tuple "NONE" None]

instance enterpriseDefaultRepositoryPermissionSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseDefaultRepositoryPermissionSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseDefaultRepositoryPermissionSettingValue" fromToMap

instance enterpriseDefaultRepositoryPermissionSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseDefaultRepositoryPermissionSettingValue where
  toGraphqlArgumentValue =
    case _ of
      NoPolicy -> ArgumentValueString "NO_POLICY"
      Admin -> ArgumentValueString "ADMIN"
      Write -> ArgumentValueString "WRITE"
      Read -> ArgumentValueString "READ"
      None -> ArgumentValueString "NONE"
