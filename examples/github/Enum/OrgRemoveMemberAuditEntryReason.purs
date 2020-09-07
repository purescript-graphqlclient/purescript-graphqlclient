module Examples.Github.Enum.OrgRemoveMemberAuditEntryReason where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgRemoveMemberAuditEntryReason
data OrgRemoveMemberAuditEntryReason
  = TwoFactorRequirementNonCompliance
  | SamlExternalIdentityMissing
  | SamlSsoEnforcementRequiresExternalIdentity
  | UserAccountDeleted
  | TwoFactorAccountRecovery

derive instance eqOrgRemoveMemberAuditEntryReason :: Eq OrgRemoveMemberAuditEntryReason

derive instance ordOrgRemoveMemberAuditEntryReason :: Ord OrgRemoveMemberAuditEntryReason

fromToMap :: Array (Tuple String OrgRemoveMemberAuditEntryReason)
fromToMap = [ Tuple
              "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
              TwoFactorRequirementNonCompliance
            , Tuple "SAML_EXTERNAL_IDENTITY_MISSING" SamlExternalIdentityMissing
            , Tuple
              "SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY"
              SamlSsoEnforcementRequiresExternalIdentity
            , Tuple "USER_ACCOUNT_DELETED" UserAccountDeleted
            , Tuple "TWO_FACTOR_ACCOUNT_RECOVERY" TwoFactorAccountRecovery
            ]

instance orgRemoveMemberAuditEntryReasonGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                               OrgRemoveMemberAuditEntryReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgRemoveMemberAuditEntryReason"
                                        fromToMap

instance orgRemoveMemberAuditEntryReasonToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                  OrgRemoveMemberAuditEntryReason where
  toGraphQLArgumentValue =
    case _ of
      TwoFactorRequirementNonCompliance -> ArgumentValueEnum
                                           "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
      SamlExternalIdentityMissing -> ArgumentValueEnum
                                     "SAML_EXTERNAL_IDENTITY_MISSING"
      SamlSsoEnforcementRequiresExternalIdentity -> ArgumentValueEnum
                                                    "SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY"
      UserAccountDeleted -> ArgumentValueEnum "USER_ACCOUNT_DELETED"
      TwoFactorAccountRecovery -> ArgumentValueEnum
                                  "TWO_FACTOR_ACCOUNT_RECOVERY"
