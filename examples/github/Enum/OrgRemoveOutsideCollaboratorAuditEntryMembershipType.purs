module Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryMembershipType where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrgRemoveOutsideCollaboratorAuditEntryMembershipType
data OrgRemoveOutsideCollaboratorAuditEntryMembershipType
  = OutsideCollaborator
  | Unaffiliated
  | BillingManager

fromToMap :: Array (Tuple String OrgRemoveOutsideCollaboratorAuditEntryMembershipType)
fromToMap = [Tuple "OUTSIDE_COLLABORATOR" OutsideCollaborator, Tuple "UNAFFILIATED" Unaffiliated, Tuple "BILLING_MANAGER" BillingManager]

instance orgRemoveOutsideCollaboratorAuditEntryMembershipTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrgRemoveOutsideCollaboratorAuditEntryMembershipType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrgRemoveOutsideCollaboratorAuditEntryMembershipType" fromToMap

instance orgRemoveOutsideCollaboratorAuditEntryMembershipTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue OrgRemoveOutsideCollaboratorAuditEntryMembershipType where
  toGraphqlArgumentValue =
    case _ of
      OutsideCollaborator -> ArgumentValueEnum "OUTSIDE_COLLABORATOR"
      Unaffiliated -> ArgumentValueEnum "UNAFFILIATED"
      BillingManager -> ArgumentValueEnum "BILLING_MANAGER"
