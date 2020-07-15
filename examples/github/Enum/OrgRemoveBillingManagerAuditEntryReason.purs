module Examples.Github.Enum.OrgRemoveBillingManagerAuditEntryReason where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrgRemoveBillingManagerAuditEntryReason
data OrgRemoveBillingManagerAuditEntryReason
  = TwoFactorRequirementNonCompliance
  | SamlExternalIdentityMissing
  | SamlSsoEnforcementRequiresExternalIdentity

fromToMap :: Array (Tuple String OrgRemoveBillingManagerAuditEntryReason)
fromToMap = [Tuple "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE" TwoFactorRequirementNonCompliance, Tuple "SAML_EXTERNAL_IDENTITY_MISSING" SamlExternalIdentityMissing, Tuple "SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY" SamlSsoEnforcementRequiresExternalIdentity]

instance orgRemoveBillingManagerAuditEntryReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrgRemoveBillingManagerAuditEntryReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrgRemoveBillingManagerAuditEntryReason" fromToMap

instance orgRemoveBillingManagerAuditEntryReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue OrgRemoveBillingManagerAuditEntryReason where
  toGraphqlArgumentValue =
    case _ of
      TwoFactorRequirementNonCompliance -> ArgumentValueString "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
      SamlExternalIdentityMissing -> ArgumentValueString "SAML_EXTERNAL_IDENTITY_MISSING"
      SamlSsoEnforcementRequiresExternalIdentity -> ArgumentValueString "SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY"
