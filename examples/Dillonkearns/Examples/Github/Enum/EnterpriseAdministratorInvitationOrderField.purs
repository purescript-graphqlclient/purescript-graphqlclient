module Dillonkearns.Examples.Github.Enum.EnterpriseAdministratorInvitationOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseAdministratorInvitationOrderField
data EnterpriseAdministratorInvitationOrderField = CreatedAt

derive instance genericEnterpriseAdministratorInvitationOrderField
  ::
  Generic EnterpriseAdministratorInvitationOrderField _

instance showEnterpriseAdministratorInvitationOrderField
  :: Show EnterpriseAdministratorInvitationOrderField where
  show = genericShow

derive instance eqEnterpriseAdministratorInvitationOrderField
  ::
  Eq EnterpriseAdministratorInvitationOrderField

derive instance ordEnterpriseAdministratorInvitationOrderField
  ::
  Ord EnterpriseAdministratorInvitationOrderField

fromToMap :: Array (Tuple String EnterpriseAdministratorInvitationOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance enterpriseAdministratorInvitationOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder
     EnterpriseAdministratorInvitationOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseAdministratorInvitationOrderField"
                                        fromToMap

instance enterpriseAdministratorInvitationOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue EnterpriseAdministratorInvitationOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
