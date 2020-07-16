module Examples.Github.Interface.RepositoryInfo where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Github.InputObject
import Type.Row
import Examples.Github.Scopes
import Examples.Github.Scalars
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

createdAt :: SelectionSet Scope__RepositoryInfo DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__RepositoryInfo (Maybe String)
description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

descriptionHTML :: SelectionSet Scope__RepositoryInfo Html
descriptionHTML = selectionForField "descriptionHTML" [] graphqlDefaultResponseScalarDecoder

forkCount :: SelectionSet Scope__RepositoryInfo Int
forkCount = selectionForField "forkCount" [] graphqlDefaultResponseScalarDecoder

hasIssuesEnabled :: SelectionSet Scope__RepositoryInfo Boolean
hasIssuesEnabled = selectionForField "hasIssuesEnabled" [] graphqlDefaultResponseScalarDecoder

hasProjectsEnabled :: SelectionSet Scope__RepositoryInfo Boolean
hasProjectsEnabled = selectionForField "hasProjectsEnabled" [] graphqlDefaultResponseScalarDecoder

hasWikiEnabled :: SelectionSet Scope__RepositoryInfo Boolean
hasWikiEnabled = selectionForField "hasWikiEnabled" [] graphqlDefaultResponseScalarDecoder

homepageUrl :: SelectionSet Scope__RepositoryInfo (Maybe Uri)
homepageUrl = selectionForField "homepageUrl" [] graphqlDefaultResponseScalarDecoder

isArchived :: SelectionSet Scope__RepositoryInfo Boolean
isArchived = selectionForField "isArchived" [] graphqlDefaultResponseScalarDecoder

isFork :: SelectionSet Scope__RepositoryInfo Boolean
isFork = selectionForField "isFork" [] graphqlDefaultResponseScalarDecoder

isLocked :: SelectionSet Scope__RepositoryInfo Boolean
isLocked = selectionForField "isLocked" [] graphqlDefaultResponseScalarDecoder

isMirror :: SelectionSet Scope__RepositoryInfo Boolean
isMirror = selectionForField "isMirror" [] graphqlDefaultResponseScalarDecoder

isPrivate :: SelectionSet Scope__RepositoryInfo Boolean
isPrivate = selectionForField "isPrivate" [] graphqlDefaultResponseScalarDecoder

isTemplate :: SelectionSet Scope__RepositoryInfo Boolean
isTemplate = selectionForField "isTemplate" [] graphqlDefaultResponseScalarDecoder

licenseInfo :: forall r . SelectionSet Scope__License r -> SelectionSet Scope__RepositoryInfo (Maybe r)
licenseInfo = selectionForCompositeField "licenseInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

lockReason :: SelectionSet Scope__RepositoryInfo (Maybe RepositoryLockReason)
lockReason = selectionForField "lockReason" [] graphqlDefaultResponseScalarDecoder

mirrorUrl :: SelectionSet Scope__RepositoryInfo (Maybe Uri)
mirrorUrl = selectionForField "mirrorUrl" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__RepositoryInfo String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

nameWithOwner :: SelectionSet Scope__RepositoryInfo String
nameWithOwner = selectionForField "nameWithOwner" [] graphqlDefaultResponseScalarDecoder

openGraphImageUrl :: SelectionSet Scope__RepositoryInfo Uri
openGraphImageUrl = selectionForField "openGraphImageUrl" [] graphqlDefaultResponseScalarDecoder

owner :: forall r . SelectionSet Scope__RepositoryOwner r -> SelectionSet Scope__RepositoryInfo r
owner = selectionForCompositeField "owner" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pushedAt :: SelectionSet Scope__RepositoryInfo (Maybe DateTime)
pushedAt = selectionForField "pushedAt" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__RepositoryInfo Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

type ShortDescriptionHtmlInputRowOptional r = ( limit :: Optional Int
                                              | r
                                              )

type ShortDescriptionHtmlInput = { | ShortDescriptionHtmlInputRowOptional + () }

shortDescriptionHTML :: ShortDescriptionHtmlInput -> SelectionSet Scope__RepositoryInfo Html
shortDescriptionHTML input = selectionForField "shortDescriptionHTML" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__RepositoryInfo DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__RepositoryInfo Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

usesCustomOpenGraphImage :: SelectionSet Scope__RepositoryInfo Boolean
usesCustomOpenGraphImage = selectionForField "usesCustomOpenGraphImage" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onRepository :: SelectionSet Scope__Repository decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__RepositoryInfo decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "Repository" selections.onRepository]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onRepository: pure Nothing }
