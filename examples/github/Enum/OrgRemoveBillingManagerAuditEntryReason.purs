module Examples.Github.Enum.OrgRemoveBillingManagerAuditEntryReason where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgRemoveBillingManagerAuditEntryReason
data OrgRemoveBillingManagerAuditEntryReason
  = TwoFactorRequirementNonCompliance
  | SamlExternalIdentityMissing
  | SamlSsoEnforcementRequiresExternalIdentity

derive instance eqOrgRemoveBillingManagerAuditEntryReason :: Eq OrgRemoveBillingManagerAuditEntryReason

derive instance ordOrgRemoveBillingManagerAuditEntryReason :: Ord OrgRemoveBillingManagerAuditEntryReason

fromToMap :: Array (Tuple String OrgRemoveBillingManagerAuditEntryReason)
fromToMap = [ Tuple
              "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
              TwoFactorRequirementNonCompliance
            , Tuple "SAML_EXTERNAL_IDENTITY_MISSING" SamlExternalIdentityMissing
            , Tuple
              "SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY"
              SamlSsoEnforcementRequiresExternalIdentity
            ]

instance orgRemoveBillingManagerAuditEntryReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                       OrgRemoveBillingManagerAuditEntryReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgRemoveBillingManagerAuditEntryReason"
                                        fromToMap

instance orgRemoveBillingManagerAuditEntryReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                          OrgRemoveBillingManagerAuditEntryReason where
  toGraphqlArgumentValue =
    case _ of
      TwoFactorRequirementNonCompliance -> ArgumentValueEnum
                                           "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
      SamlExternalIdentityMissing -> ArgumentValueEnum
                                     "SAML_EXTERNAL_IDENTITY_MISSING"
      SamlSsoEnforcementRequiresExternalIdentity -> ArgumentValueEnum
                                                    "SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY"
