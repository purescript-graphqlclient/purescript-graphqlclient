module Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryReason where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgRemoveOutsideCollaboratorAuditEntryReason
data OrgRemoveOutsideCollaboratorAuditEntryReason
  = TwoFactorRequirementNonCompliance | SamlExternalIdentityMissing

derive instance eqOrgRemoveOutsideCollaboratorAuditEntryReason :: Eq OrgRemoveOutsideCollaboratorAuditEntryReason

derive instance ordOrgRemoveOutsideCollaboratorAuditEntryReason :: Ord OrgRemoveOutsideCollaboratorAuditEntryReason

fromToMap :: Array (Tuple String OrgRemoveOutsideCollaboratorAuditEntryReason)
fromToMap = [ Tuple
              "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
              TwoFactorRequirementNonCompliance
            , Tuple "SAML_EXTERNAL_IDENTITY_MISSING" SamlExternalIdentityMissing
            ]

instance orgRemoveOutsideCollaboratorAuditEntryReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                            OrgRemoveOutsideCollaboratorAuditEntryReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgRemoveOutsideCollaboratorAuditEntryReason"
                                        fromToMap

instance orgRemoveOutsideCollaboratorAuditEntryReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                               OrgRemoveOutsideCollaboratorAuditEntryReason where
  toGraphqlArgumentValue =
    case _ of
      TwoFactorRequirementNonCompliance -> ArgumentValueEnum
                                           "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
      SamlExternalIdentityMissing -> ArgumentValueEnum
                                     "SAML_EXTERNAL_IDENTITY_MISSING"
