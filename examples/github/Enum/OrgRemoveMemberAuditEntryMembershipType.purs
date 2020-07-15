module Examples.Github.Enum.OrgRemoveMemberAuditEntryMembershipType where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrgRemoveMemberAuditEntryMembershipType
data OrgRemoveMemberAuditEntryMembershipType
  = DirectMember
  | Admin
  | BillingManager
  | Unaffiliated
  | OutsideCollaborator

fromToMap :: Array (Tuple String OrgRemoveMemberAuditEntryMembershipType)
fromToMap = [Tuple "DIRECT_MEMBER" DirectMember, Tuple "ADMIN" Admin, Tuple "BILLING_MANAGER" BillingManager, Tuple "UNAFFILIATED" Unaffiliated, Tuple "OUTSIDE_COLLABORATOR" OutsideCollaborator]

instance orgRemoveMemberAuditEntryMembershipTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrgRemoveMemberAuditEntryMembershipType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrgRemoveMemberAuditEntryMembershipType" fromToMap

instance orgRemoveMemberAuditEntryMembershipTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue OrgRemoveMemberAuditEntryMembershipType where
  toGraphqlArgumentValue =
    case _ of
      DirectMember -> ArgumentValueString "DIRECT_MEMBER"
      Admin -> ArgumentValueString "ADMIN"
      BillingManager -> ArgumentValueString "BILLING_MANAGER"
      Unaffiliated -> ArgumentValueString "UNAFFILIATED"
      OutsideCollaborator -> ArgumentValueString "OUTSIDE_COLLABORATOR"
