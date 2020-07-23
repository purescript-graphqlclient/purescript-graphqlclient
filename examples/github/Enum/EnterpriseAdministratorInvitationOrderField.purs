module Examples.Github.Enum.EnterpriseAdministratorInvitationOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseAdministratorInvitationOrderField
data EnterpriseAdministratorInvitationOrderField
  = CreatedAt

fromToMap :: Array (Tuple String EnterpriseAdministratorInvitationOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt]

instance enterpriseAdministratorInvitationOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseAdministratorInvitationOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseAdministratorInvitationOrderField" fromToMap

instance enterpriseAdministratorInvitationOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseAdministratorInvitationOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
