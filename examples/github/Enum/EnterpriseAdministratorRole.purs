module Examples.Github.Enum.EnterpriseAdministratorRole where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      Owner -> ArgumentValueEnum "OWNER"
      BillingManager -> ArgumentValueEnum "BILLING_MANAGER"
