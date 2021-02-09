module Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryReason where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgRemoveOutsideCollaboratorAuditEntryReason
data OrgRemoveOutsideCollaboratorAuditEntryReason
  = TwoFactorRequirementNonCompliance
  | SamlExternalIdentityMissing

derive instance genericOrgRemoveOutsideCollaboratorAuditEntryReason
  ::
  Generic OrgRemoveOutsideCollaboratorAuditEntryReason _

instance showOrgRemoveOutsideCollaboratorAuditEntryReason
  :: Show OrgRemoveOutsideCollaboratorAuditEntryReason where
  show = genericShow

derive instance eqOrgRemoveOutsideCollaboratorAuditEntryReason
  ::
  Eq OrgRemoveOutsideCollaboratorAuditEntryReason

derive instance ordOrgRemoveOutsideCollaboratorAuditEntryReason
  ::
  Ord OrgRemoveOutsideCollaboratorAuditEntryReason

fromToMap :: Array (Tuple String OrgRemoveOutsideCollaboratorAuditEntryReason)
fromToMap = [ Tuple
              "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
              TwoFactorRequirementNonCompliance
            , Tuple "SAML_EXTERNAL_IDENTITY_MISSING" SamlExternalIdentityMissing
            ]

instance orgRemoveOutsideCollaboratorAuditEntryReasonGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder
     OrgRemoveOutsideCollaboratorAuditEntryReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgRemoveOutsideCollaboratorAuditEntryReason"
                                        fromToMap

instance orgRemoveOutsideCollaboratorAuditEntryReasonToGraphQLArgumentValue
  :: ToGraphQLArgumentValue OrgRemoveOutsideCollaboratorAuditEntryReason where
  toGraphQLArgumentValue =
    case _ of
      TwoFactorRequirementNonCompliance -> ArgumentValueEnum
                                           "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
      SamlExternalIdentityMissing -> ArgumentValueEnum
                                     "SAML_EXTERNAL_IDENTITY_MISSING"
