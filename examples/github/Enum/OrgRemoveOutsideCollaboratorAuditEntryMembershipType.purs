module Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryMembershipType where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgRemoveOutsideCollaboratorAuditEntryMembershipType
data OrgRemoveOutsideCollaboratorAuditEntryMembershipType
  = OutsideCollaborator | Unaffiliated | BillingManager

derive instance eqOrgRemoveOutsideCollaboratorAuditEntryMembershipType :: Eq OrgRemoveOutsideCollaboratorAuditEntryMembershipType

derive instance ordOrgRemoveOutsideCollaboratorAuditEntryMembershipType :: Ord OrgRemoveOutsideCollaboratorAuditEntryMembershipType

fromToMap :: Array
             (Tuple
              String
              OrgRemoveOutsideCollaboratorAuditEntryMembershipType)
fromToMap = [ Tuple "OUTSIDE_COLLABORATOR" OutsideCollaborator
            , Tuple "UNAFFILIATED" Unaffiliated
            , Tuple "BILLING_MANAGER" BillingManager
            ]

instance orgRemoveOutsideCollaboratorAuditEntryMembershipTypeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                                    OrgRemoveOutsideCollaboratorAuditEntryMembershipType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgRemoveOutsideCollaboratorAuditEntryMembershipType"
                                        fromToMap

instance orgRemoveOutsideCollaboratorAuditEntryMembershipTypeToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                                       OrgRemoveOutsideCollaboratorAuditEntryMembershipType where
  toGraphQLArgumentValue =
    case _ of
      OutsideCollaborator -> ArgumentValueEnum "OUTSIDE_COLLABORATOR"
      Unaffiliated -> ArgumentValueEnum "UNAFFILIATED"
      BillingManager -> ArgumentValueEnum "BILLING_MANAGER"
