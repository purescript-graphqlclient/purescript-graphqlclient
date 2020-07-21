module Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryReason where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrgRemoveOutsideCollaboratorAuditEntryReason
data OrgRemoveOutsideCollaboratorAuditEntryReason
  = TwoFactorRequirementNonCompliance
  | SamlExternalIdentityMissing

fromToMap :: Array (Tuple String OrgRemoveOutsideCollaboratorAuditEntryReason)
fromToMap = [Tuple "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE" TwoFactorRequirementNonCompliance, Tuple "SAML_EXTERNAL_IDENTITY_MISSING" SamlExternalIdentityMissing]

instance orgRemoveOutsideCollaboratorAuditEntryReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrgRemoveOutsideCollaboratorAuditEntryReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrgRemoveOutsideCollaboratorAuditEntryReason" fromToMap

instance orgRemoveOutsideCollaboratorAuditEntryReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue OrgRemoveOutsideCollaboratorAuditEntryReason where
  toGraphqlArgumentValue =
    case _ of
      TwoFactorRequirementNonCompliance -> ArgumentValueEnum "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
      SamlExternalIdentityMissing -> ArgumentValueEnum "SAML_EXTERNAL_IDENTITY_MISSING"
