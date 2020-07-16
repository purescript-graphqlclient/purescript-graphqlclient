module Examples.Github.Object.Enterprise where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Github.InputObject
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

type AvatarUrlInputRowOptional r = ( size :: Optional Int
                                   | r
                                   )

type AvatarUrlInput = { | RefsInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__Enterprise Uri
avatarUrl input = selectionForField "avatarUrl" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

billingInfo :: forall r . SelectionSet Scope__EnterpriseBillingInfo r -> SelectionSet Scope__Enterprise (Maybe r)
billingInfo = selectionForCompositeField "billingInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__Enterprise DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Enterprise (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Enterprise (Maybe String)
description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

descriptionHTML :: SelectionSet Scope__Enterprise Html
descriptionHTML = selectionForField "descriptionHTML" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Enterprise Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

location :: SelectionSet Scope__Enterprise (Maybe String)
location = selectionForField "location" [] graphqlDefaultResponseScalarDecoder

type MembersInputRowOptional r = ( organizationLogins :: Array (Maybe String)
                                 , query :: Optional String
                                 , orderBy :: Optional EnterpriseMemberOrder
                                 , role :: Optional EnterpriseUserAccountMembershipRole
                                 , deployment :: Optional EnterpriseUserDeployment
                                 , after :: Optional String
                                 , before :: Optional String
                                 , first :: Optional Int
                                 , last :: Optional Int
                                 | r
                                 )

type MembersInputRowRequired r = ( organizationLogins :: ERROR_NULL_OR_LIST_BUT_WITHOUT_TYPE_INSIDE
                                 | r
                                 )

type MembersInput = { | RefsInputRowRequired + RefsInputRowRequired + () }

members :: forall r . MembersInput -> SelectionSet Scope__EnterpriseMemberConnection r -> SelectionSet Scope__Enterprise r
members input = selectionForCompositeField "members" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

name :: SelectionSet Scope__Enterprise String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type OrganizationsInputRowOptional r = ( query :: Optional String
                                       , orderBy :: Optional OrganizationOrder
                                       , after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type OrganizationsInput = { | RefsInputRowOptional + () }

organizations :: forall r . OrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__Enterprise r
organizations input = selectionForCompositeField "organizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ownerInfo :: forall r . SelectionSet Scope__EnterpriseOwnerInfo r -> SelectionSet Scope__Enterprise (Maybe r)
ownerInfo = selectionForCompositeField "ownerInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Enterprise Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

slug :: SelectionSet Scope__Enterprise String
slug = selectionForField "slug" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Enterprise Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type UserAccountsInputRowOptional r = ( after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type UserAccountsInput = { | RefsInputRowOptional + () }

userAccounts :: forall r . UserAccountsInput -> SelectionSet Scope__EnterpriseUserAccountConnection r -> SelectionSet Scope__Enterprise r
userAccounts input = selectionForCompositeField "userAccounts" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerIsAdmin :: SelectionSet Scope__Enterprise Boolean
viewerIsAdmin = selectionForField "viewerIsAdmin" [] graphqlDefaultResponseScalarDecoder

websiteUrl :: SelectionSet Scope__Enterprise (Maybe Uri)
websiteUrl = selectionForField "websiteUrl" [] graphqlDefaultResponseScalarDecoder
