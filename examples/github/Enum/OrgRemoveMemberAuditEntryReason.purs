module Examples.Github.Enum.OrgRemoveMemberAuditEntryReason where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrgRemoveMemberAuditEntryReason
data OrgRemoveMemberAuditEntryReason
  = TwoFactorRequirementNonCompliance
  | SamlExternalIdentityMissing
  | SamlSsoEnforcementRequiresExternalIdentity
  | UserAccountDeleted
  | TwoFactorAccountRecovery

fromToMap :: Array (Tuple String OrgRemoveMemberAuditEntryReason)
fromToMap = [Tuple "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE" TwoFactorRequirementNonCompliance, Tuple "SAML_EXTERNAL_IDENTITY_MISSING" SamlExternalIdentityMissing, Tuple "SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY" SamlSsoEnforcementRequiresExternalIdentity, Tuple "USER_ACCOUNT_DELETED" UserAccountDeleted, Tuple "TWO_FACTOR_ACCOUNT_RECOVERY" TwoFactorAccountRecovery]

instance orgRemoveMemberAuditEntryReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrgRemoveMemberAuditEntryReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrgRemoveMemberAuditEntryReason" fromToMap

instance orgRemoveMemberAuditEntryReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue OrgRemoveMemberAuditEntryReason where
  toGraphqlArgumentValue =
    case _ of
      TwoFactorRequirementNonCompliance -> ArgumentValueString "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
      SamlExternalIdentityMissing -> ArgumentValueString "SAML_EXTERNAL_IDENTITY_MISSING"
      SamlSsoEnforcementRequiresExternalIdentity -> ArgumentValueString "SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY"
      UserAccountDeleted -> ArgumentValueString "USER_ACCOUNT_DELETED"
      TwoFactorAccountRecovery -> ArgumentValueString "TWO_FACTOR_ACCOUNT_RECOVERY"
