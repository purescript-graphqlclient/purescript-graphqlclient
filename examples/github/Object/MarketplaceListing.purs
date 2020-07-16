module Examples.Github.Object.MarketplaceListing where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Github.InputObject
import Type.Row
import Examples.Github.Enum.ActionExecutionCapabilitySetting
import Examples.Github.Enum.AuditLogOrderField
import Examples.Github.Enum.CollaboratorAffiliation
import Examples.Github.Enum.CommentAuthorAssociation
import Examples.Github.Enum.CommentCannotUpdateReason
import Examples.Github.Enum.CommitContributionOrderField
import Examples.Github.Enum.DefaultRepositoryPermissionField
import Examples.Github.Enum.DeploymentOrderField
import Examples.Github.Enum.DeploymentState
import Examples.Github.Enum.DeploymentStatusState
import Examples.Github.Enum.DiffSide
import Examples.Github.Enum.EnterpriseAdministratorInvitationOrderField
import Examples.Github.Enum.EnterpriseAdministratorRole
import Examples.Github.Enum.EnterpriseDefaultRepositoryPermissionSettingValue
import Examples.Github.Enum.EnterpriseEnabledDisabledSettingValue
import Examples.Github.Enum.EnterpriseEnabledSettingValue
import Examples.Github.Enum.EnterpriseMemberOrderField
import Examples.Github.Enum.EnterpriseMembersCanCreateRepositoriesSettingValue
import Examples.Github.Enum.EnterpriseMembersCanMakePurchasesSettingValue
import Examples.Github.Enum.EnterpriseServerInstallationOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountEmailOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountsUploadOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountsUploadSyncState
import Examples.Github.Enum.EnterpriseUserAccountMembershipRole
import Examples.Github.Enum.EnterpriseUserDeployment
import Examples.Github.Enum.FundingPlatform
import Examples.Github.Enum.GistOrderField
import Examples.Github.Enum.GistPrivacy
import Examples.Github.Enum.GitSignatureState
import Examples.Github.Enum.IdentityProviderConfigurationState
import Examples.Github.Enum.IpAllowListEnabledSettingValue
import Examples.Github.Enum.IpAllowListEntryOrderField
import Examples.Github.Enum.IssueOrderField
import Examples.Github.Enum.IssueState
import Examples.Github.Enum.IssueTimelineItemsItemType
import Examples.Github.Enum.LabelOrderField
import Examples.Github.Enum.LanguageOrderField
import Examples.Github.Enum.LockReason
import Examples.Github.Enum.MergeableState
import Examples.Github.Enum.MilestoneOrderField
import Examples.Github.Enum.MilestoneState
import Examples.Github.Enum.OauthApplicationCreateAuditEntryState
import Examples.Github.Enum.OperationType
import Examples.Github.Enum.OrderDirection
import Examples.Github.Enum.OrgAddMemberAuditEntryPermission
import Examples.Github.Enum.OrgCreateAuditEntryBillingPlan
import Examples.Github.Enum.OrgRemoveBillingManagerAuditEntryReason
import Examples.Github.Enum.OrgRemoveMemberAuditEntryMembershipType
import Examples.Github.Enum.OrgRemoveMemberAuditEntryReason
import Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryMembershipType
import Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryReason
import Examples.Github.Enum.OrgUpdateDefaultRepositoryPermissionAuditEntryPermission
import Examples.Github.Enum.OrgUpdateMemberAuditEntryPermission
import Examples.Github.Enum.OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility
import Examples.Github.Enum.OrganizationInvitationRole
import Examples.Github.Enum.OrganizationInvitationType
import Examples.Github.Enum.OrganizationMemberRole
import Examples.Github.Enum.OrganizationMembersCanCreateRepositoriesSettingValue
import Examples.Github.Enum.OrganizationOrderField
import Examples.Github.Enum.PackageFileOrderField
import Examples.Github.Enum.PackageOrderField
import Examples.Github.Enum.PackageType
import Examples.Github.Enum.PackageVersionOrderField
import Examples.Github.Enum.PinnableItemType
import Examples.Github.Enum.ProjectCardArchivedState
import Examples.Github.Enum.ProjectCardState
import Examples.Github.Enum.ProjectColumnPurpose
import Examples.Github.Enum.ProjectOrderField
import Examples.Github.Enum.ProjectState
import Examples.Github.Enum.ProjectTemplate
import Examples.Github.Enum.PullRequestMergeMethod
import Examples.Github.Enum.PullRequestOrderField
import Examples.Github.Enum.PullRequestReviewCommentState
import Examples.Github.Enum.PullRequestReviewDecision
import Examples.Github.Enum.PullRequestReviewEvent
import Examples.Github.Enum.PullRequestReviewState
import Examples.Github.Enum.PullRequestState
import Examples.Github.Enum.PullRequestTimelineItemsItemType
import Examples.Github.Enum.PullRequestUpdateState
import Examples.Github.Enum.ReactionContent
import Examples.Github.Enum.ReactionOrderField
import Examples.Github.Enum.RefOrderField
import Examples.Github.Enum.ReleaseOrderField
import Examples.Github.Enum.RepoAccessAuditEntryVisibility
import Examples.Github.Enum.RepoAddMemberAuditEntryVisibility
import Examples.Github.Enum.RepoArchivedAuditEntryVisibility
import Examples.Github.Enum.RepoChangeMergeSettingAuditEntryMergeType
import Examples.Github.Enum.RepoCreateAuditEntryVisibility
import Examples.Github.Enum.RepoDestroyAuditEntryVisibility
import Examples.Github.Enum.RepoRemoveMemberAuditEntryVisibility
import Examples.Github.Enum.ReportedContentClassifiers
import Examples.Github.Enum.RepositoryAffiliation
import Examples.Github.Enum.RepositoryContributionType
import Examples.Github.Enum.RepositoryInvitationOrderField
import Examples.Github.Enum.RepositoryLockReason
import Examples.Github.Enum.RepositoryOrderField
import Examples.Github.Enum.RepositoryPermission
import Examples.Github.Enum.RepositoryPrivacy
import Examples.Github.Enum.RepositoryVisibility
import Examples.Github.Enum.SamlDigestAlgorithm
import Examples.Github.Enum.SamlSignatureAlgorithm
import Examples.Github.Enum.SavedReplyOrderField
import Examples.Github.Enum.SearchType
import Examples.Github.Enum.SecurityAdvisoryEcosystem
import Examples.Github.Enum.SecurityAdvisoryIdentifierType
import Examples.Github.Enum.SecurityAdvisoryOrderField
import Examples.Github.Enum.SecurityAdvisorySeverity
import Examples.Github.Enum.SecurityVulnerabilityOrderField
import Examples.Github.Enum.SponsorsTierOrderField
import Examples.Github.Enum.SponsorshipOrderField
import Examples.Github.Enum.SponsorshipPrivacy
import Examples.Github.Enum.StarOrderField
import Examples.Github.Enum.StatusState
import Examples.Github.Enum.SubscriptionState
import Examples.Github.Enum.TeamDiscussionCommentOrderField
import Examples.Github.Enum.TeamDiscussionOrderField
import Examples.Github.Enum.TeamMemberOrderField
import Examples.Github.Enum.TeamMemberRole
import Examples.Github.Enum.TeamMembershipType
import Examples.Github.Enum.TeamOrderField
import Examples.Github.Enum.TeamPrivacy
import Examples.Github.Enum.TeamRepositoryOrderField
import Examples.Github.Enum.TeamRole
import Examples.Github.Enum.TopicSuggestionDeclineReason
import Examples.Github.Enum.UserBlockDuration
import Examples.Github.Enum.UserStatusOrderField
import Examples.Github.Scopes
import Examples.Github.Scalars

app :: forall r . SelectionSet Scope__App r -> SelectionSet Scope__MarketplaceListing (Maybe r)
app = selectionForCompositeField "app" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

companyUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
companyUrl = selectionForField "companyUrl" [] graphqlDefaultResponseScalarDecoder

configurationResourcePath :: SelectionSet Scope__MarketplaceListing Uri
configurationResourcePath = selectionForField "configurationResourcePath" [] graphqlDefaultResponseScalarDecoder

configurationUrl :: SelectionSet Scope__MarketplaceListing Uri
configurationUrl = selectionForField "configurationUrl" [] graphqlDefaultResponseScalarDecoder

documentationUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
documentationUrl = selectionForField "documentationUrl" [] graphqlDefaultResponseScalarDecoder

extendedDescription :: SelectionSet Scope__MarketplaceListing (Maybe String)
extendedDescription = selectionForField "extendedDescription" [] graphqlDefaultResponseScalarDecoder

extendedDescriptionHTML :: SelectionSet Scope__MarketplaceListing Html
extendedDescriptionHTML = selectionForField "extendedDescriptionHTML" [] graphqlDefaultResponseScalarDecoder

fullDescription :: SelectionSet Scope__MarketplaceListing String
fullDescription = selectionForField "fullDescription" [] graphqlDefaultResponseScalarDecoder

fullDescriptionHTML :: SelectionSet Scope__MarketplaceListing Html
fullDescriptionHTML = selectionForField "fullDescriptionHTML" [] graphqlDefaultResponseScalarDecoder

hasPublishedFreeTrialPlans :: SelectionSet Scope__MarketplaceListing Boolean
hasPublishedFreeTrialPlans = selectionForField "hasPublishedFreeTrialPlans" [] graphqlDefaultResponseScalarDecoder

hasTermsOfService :: SelectionSet Scope__MarketplaceListing Boolean
hasTermsOfService = selectionForField "hasTermsOfService" [] graphqlDefaultResponseScalarDecoder

howItWorks :: SelectionSet Scope__MarketplaceListing (Maybe String)
howItWorks = selectionForField "howItWorks" [] graphqlDefaultResponseScalarDecoder

howItWorksHTML :: SelectionSet Scope__MarketplaceListing Html
howItWorksHTML = selectionForField "howItWorksHTML" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__MarketplaceListing Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

installationUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
installationUrl = selectionForField "installationUrl" [] graphqlDefaultResponseScalarDecoder

installedForViewer :: SelectionSet Scope__MarketplaceListing Boolean
installedForViewer = selectionForField "installedForViewer" [] graphqlDefaultResponseScalarDecoder

isArchived :: SelectionSet Scope__MarketplaceListing Boolean
isArchived = selectionForField "isArchived" [] graphqlDefaultResponseScalarDecoder

isDraft :: SelectionSet Scope__MarketplaceListing Boolean
isDraft = selectionForField "isDraft" [] graphqlDefaultResponseScalarDecoder

isPaid :: SelectionSet Scope__MarketplaceListing Boolean
isPaid = selectionForField "isPaid" [] graphqlDefaultResponseScalarDecoder

isPublic :: SelectionSet Scope__MarketplaceListing Boolean
isPublic = selectionForField "isPublic" [] graphqlDefaultResponseScalarDecoder

isRejected :: SelectionSet Scope__MarketplaceListing Boolean
isRejected = selectionForField "isRejected" [] graphqlDefaultResponseScalarDecoder

isUnverified :: SelectionSet Scope__MarketplaceListing Boolean
isUnverified = selectionForField "isUnverified" [] graphqlDefaultResponseScalarDecoder

isUnverifiedPending :: SelectionSet Scope__MarketplaceListing Boolean
isUnverifiedPending = selectionForField "isUnverifiedPending" [] graphqlDefaultResponseScalarDecoder

isVerificationPendingFromDraft :: SelectionSet Scope__MarketplaceListing Boolean
isVerificationPendingFromDraft = selectionForField "isVerificationPendingFromDraft" [] graphqlDefaultResponseScalarDecoder

isVerificationPendingFromUnverified :: SelectionSet Scope__MarketplaceListing Boolean
isVerificationPendingFromUnverified = selectionForField "isVerificationPendingFromUnverified" [] graphqlDefaultResponseScalarDecoder

isVerified :: SelectionSet Scope__MarketplaceListing Boolean
isVerified = selectionForField "isVerified" [] graphqlDefaultResponseScalarDecoder

logoBackgroundColor :: SelectionSet Scope__MarketplaceListing String
logoBackgroundColor = selectionForField "logoBackgroundColor" [] graphqlDefaultResponseScalarDecoder

type LogoUrlInputRowOptional r = ( size :: Optional Int
                                 | r
                                 )

type LogoUrlInput = { | LogoUrlInputRowOptional + () }

logoUrl :: LogoUrlInput -> SelectionSet Scope__MarketplaceListing (Maybe Uri)
logoUrl input = selectionForField "logoUrl" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__MarketplaceListing String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

normalizedShortDescription :: SelectionSet Scope__MarketplaceListing String
normalizedShortDescription = selectionForField "normalizedShortDescription" [] graphqlDefaultResponseScalarDecoder

pricingUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
pricingUrl = selectionForField "pricingUrl" [] graphqlDefaultResponseScalarDecoder

primaryCategory :: forall r . SelectionSet Scope__MarketplaceCategory r -> SelectionSet Scope__MarketplaceListing r
primaryCategory = selectionForCompositeField "primaryCategory" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

privacyPolicyUrl :: SelectionSet Scope__MarketplaceListing Uri
privacyPolicyUrl = selectionForField "privacyPolicyUrl" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__MarketplaceListing Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

screenshotUrls :: SelectionSet Scope__MarketplaceListing (Array (Maybe String))
screenshotUrls = selectionForField "screenshotUrls" [] graphqlDefaultResponseScalarDecoder

secondaryCategory :: forall r . SelectionSet Scope__MarketplaceCategory r -> SelectionSet Scope__MarketplaceListing (Maybe r)
secondaryCategory = selectionForCompositeField "secondaryCategory" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

shortDescription :: SelectionSet Scope__MarketplaceListing String
shortDescription = selectionForField "shortDescription" [] graphqlDefaultResponseScalarDecoder

slug :: SelectionSet Scope__MarketplaceListing String
slug = selectionForField "slug" [] graphqlDefaultResponseScalarDecoder

statusUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
statusUrl = selectionForField "statusUrl" [] graphqlDefaultResponseScalarDecoder

supportEmail :: SelectionSet Scope__MarketplaceListing (Maybe String)
supportEmail = selectionForField "supportEmail" [] graphqlDefaultResponseScalarDecoder

supportUrl :: SelectionSet Scope__MarketplaceListing Uri
supportUrl = selectionForField "supportUrl" [] graphqlDefaultResponseScalarDecoder

termsOfServiceUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
termsOfServiceUrl = selectionForField "termsOfServiceUrl" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__MarketplaceListing Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanAddPlans :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanAddPlans = selectionForField "viewerCanAddPlans" [] graphqlDefaultResponseScalarDecoder

viewerCanApprove :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanApprove = selectionForField "viewerCanApprove" [] graphqlDefaultResponseScalarDecoder

viewerCanDelist :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanDelist = selectionForField "viewerCanDelist" [] graphqlDefaultResponseScalarDecoder

viewerCanEdit :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanEdit = selectionForField "viewerCanEdit" [] graphqlDefaultResponseScalarDecoder

viewerCanEditCategories :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanEditCategories = selectionForField "viewerCanEditCategories" [] graphqlDefaultResponseScalarDecoder

viewerCanEditPlans :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanEditPlans = selectionForField "viewerCanEditPlans" [] graphqlDefaultResponseScalarDecoder

viewerCanRedraft :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanRedraft = selectionForField "viewerCanRedraft" [] graphqlDefaultResponseScalarDecoder

viewerCanReject :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanReject = selectionForField "viewerCanReject" [] graphqlDefaultResponseScalarDecoder

viewerCanRequestApproval :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanRequestApproval = selectionForField "viewerCanRequestApproval" [] graphqlDefaultResponseScalarDecoder

viewerHasPurchased :: SelectionSet Scope__MarketplaceListing Boolean
viewerHasPurchased = selectionForField "viewerHasPurchased" [] graphqlDefaultResponseScalarDecoder

viewerHasPurchasedForAllOrganizations :: SelectionSet Scope__MarketplaceListing Boolean
viewerHasPurchasedForAllOrganizations = selectionForField "viewerHasPurchasedForAllOrganizations" [] graphqlDefaultResponseScalarDecoder

viewerIsListingAdmin :: SelectionSet Scope__MarketplaceListing Boolean
viewerIsListingAdmin = selectionForField "viewerIsListingAdmin" [] graphqlDefaultResponseScalarDecoder
