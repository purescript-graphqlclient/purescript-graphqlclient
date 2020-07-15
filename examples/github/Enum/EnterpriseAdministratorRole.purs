module Examples.Github.Enum.EnterpriseAdministratorRole where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseAdministratorRole
data EnterpriseAdministratorRole
  = Owner
  | BillingManager

fromToMap :: Array (Tuple String EnterpriseAdministratorRole)
fromToMap = [Tuple "OWNER" Owner, Tuple "BILLING_MANAGER" BillingManager]

instance enterpriseAdministratorRoleGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseAdministratorRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseAdministratorRole" fromToMap

instance enterpriseAdministratorRoleToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseAdministratorRole where
  toGraphqlArgumentValue =
    case _ of
      Owner -> ArgumentValueString "OWNER"
      BillingManager -> ArgumentValueString "BILLING_MANAGER"
