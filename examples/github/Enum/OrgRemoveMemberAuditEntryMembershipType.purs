module Examples.Github.Enum.OrgRemoveMemberAuditEntryMembershipType where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgRemoveMemberAuditEntryMembershipType
data OrgRemoveMemberAuditEntryMembershipType
  = DirectMember | Admin | BillingManager | Unaffiliated | OutsideCollaborator

derive instance eqOrgRemoveMemberAuditEntryMembershipType :: Eq OrgRemoveMemberAuditEntryMembershipType

derive instance ordOrgRemoveMemberAuditEntryMembershipType :: Ord OrgRemoveMemberAuditEntryMembershipType

fromToMap :: Array (Tuple String OrgRemoveMemberAuditEntryMembershipType)
fromToMap = [ Tuple "DIRECT_MEMBER" DirectMember
            , Tuple "ADMIN" Admin
            , Tuple "BILLING_MANAGER" BillingManager
            , Tuple "UNAFFILIATED" Unaffiliated
            , Tuple "OUTSIDE_COLLABORATOR" OutsideCollaborator
            ]

instance orgRemoveMemberAuditEntryMembershipTypeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                       OrgRemoveMemberAuditEntryMembershipType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgRemoveMemberAuditEntryMembershipType"
                                        fromToMap

instance orgRemoveMemberAuditEntryMembershipTypeToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                          OrgRemoveMemberAuditEntryMembershipType where
  toGraphQLArgumentValue =
    case _ of
      DirectMember -> ArgumentValueEnum "DIRECT_MEMBER"
      Admin -> ArgumentValueEnum "ADMIN"
      BillingManager -> ArgumentValueEnum "BILLING_MANAGER"
      Unaffiliated -> ArgumentValueEnum "UNAFFILIATED"
      OutsideCollaborator -> ArgumentValueEnum "OUTSIDE_COLLABORATOR"
