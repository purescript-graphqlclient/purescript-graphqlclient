module Examples.Github.Enum.OrgRemoveMemberAuditEntryMembershipType where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgRemoveMemberAuditEntryMembershipType
data OrgRemoveMemberAuditEntryMembershipType
  = DirectMember | Admin | BillingManager | Unaffiliated | OutsideCollaborator

derive instance eqOrgRemoveMemberAuditEntryMembershipType :: Eq OrgRemoveMemberAuditEntryMembershipType

derive instance ordOrgRemoveMemberAuditEntryMembershipType :: Ord OrgRemoveMemberAuditEntryMembershipType

fromToMap :: Array (Tuple String OrgRemoveMemberAuditEntryMembershipType)
fromToMap = [ Tuple
              "DIRECT_MEMBER"
              DirectMember
            , Tuple "ADMIN" Admin
            , Tuple "BILLING_MANAGER" BillingManager
            , Tuple "UNAFFILIATED" Unaffiliated
            , Tuple "OUTSIDE_COLLABORATOR" OutsideCollaborator
            ]

instance orgRemoveMemberAuditEntryMembershipTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                       OrgRemoveMemberAuditEntryMembershipType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgRemoveMemberAuditEntryMembershipType"
                                        fromToMap

instance orgRemoveMemberAuditEntryMembershipTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                          OrgRemoveMemberAuditEntryMembershipType where
  toGraphqlArgumentValue =
    case _ of
      DirectMember -> ArgumentValueEnum "DIRECT_MEMBER"
      Admin -> ArgumentValueEnum "ADMIN"
      BillingManager -> ArgumentValueEnum "BILLING_MANAGER"
      Unaffiliated -> ArgumentValueEnum "UNAFFILIATED"
      OutsideCollaborator -> ArgumentValueEnum "OUTSIDE_COLLABORATOR"
