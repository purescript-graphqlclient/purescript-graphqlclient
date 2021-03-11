module Examples.Github.Enum.EnterpriseAdministratorRole where

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

-- | original name - EnterpriseAdministratorRole
data EnterpriseAdministratorRole = Owner | BillingManager

derive instance genericEnterpriseAdministratorRole
  ::
  Generic EnterpriseAdministratorRole _

instance showEnterpriseAdministratorRole
  :: Show EnterpriseAdministratorRole where
  show = genericShow

derive instance eqEnterpriseAdministratorRole :: Eq EnterpriseAdministratorRole

derive instance ordEnterpriseAdministratorRole
  ::
  Ord EnterpriseAdministratorRole

fromToMap :: Array (Tuple String EnterpriseAdministratorRole)
fromToMap = [ Tuple "OWNER" Owner, Tuple "BILLING_MANAGER" BillingManager ]

instance enterpriseAdministratorRoleGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder EnterpriseAdministratorRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseAdministratorRole"
                                        fromToMap

instance enterpriseAdministratorRoleToGraphQLArgumentValue
  :: ToGraphQLArgumentValue EnterpriseAdministratorRole where
  toGraphQLArgumentValue =
    case _ of
      Owner -> ArgumentValueEnum "OWNER"
      BillingManager -> ArgumentValueEnum "BILLING_MANAGER"
