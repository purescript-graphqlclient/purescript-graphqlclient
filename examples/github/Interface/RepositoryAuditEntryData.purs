module Examples.Github.Interface.RepositoryAuditEntryData where

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

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__RepositoryAuditEntryData (Maybe r)
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryName :: SelectionSet Scope__RepositoryAuditEntryData (Maybe String)
repositoryName = selectionForField "repositoryName" [] graphqlDefaultResponseScalarDecoder

repositoryResourcePath :: SelectionSet Scope__RepositoryAuditEntryData (Maybe Uri)
repositoryResourcePath = selectionForField "repositoryResourcePath" [] graphqlDefaultResponseScalarDecoder

repositoryUrl :: SelectionSet Scope__RepositoryAuditEntryData (Maybe Uri)
repositoryUrl = selectionForField "repositoryUrl" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onOrgRestoreMemberMembershipRepositoryAuditEntryData :: SelectionSet Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData decodesTo
                           , onPrivateRepositoryForkingDisableAuditEntry :: SelectionSet Scope__PrivateRepositoryForkingDisableAuditEntry decodesTo
                           , onPrivateRepositoryForkingEnableAuditEntry :: SelectionSet Scope__PrivateRepositoryForkingEnableAuditEntry decodesTo
                           , onRepoAccessAuditEntry :: SelectionSet Scope__RepoAccessAuditEntry decodesTo
                           , onRepoAddMemberAuditEntry :: SelectionSet Scope__RepoAddMemberAuditEntry decodesTo
                           , onRepoAddTopicAuditEntry :: SelectionSet Scope__RepoAddTopicAuditEntry decodesTo
                           , onRepoArchivedAuditEntry :: SelectionSet Scope__RepoArchivedAuditEntry decodesTo
                           , onRepoChangeMergeSettingAuditEntry :: SelectionSet Scope__RepoChangeMergeSettingAuditEntry decodesTo
                           , onRepoConfigDisableAnonymousGitAccessAuditEntry :: SelectionSet Scope__RepoConfigDisableAnonymousGitAccessAuditEntry decodesTo
                           , onRepoConfigDisableCollaboratorsOnlyAuditEntry :: SelectionSet Scope__RepoConfigDisableCollaboratorsOnlyAuditEntry decodesTo
                           , onRepoConfigDisableContributorsOnlyAuditEntry :: SelectionSet Scope__RepoConfigDisableContributorsOnlyAuditEntry decodesTo
                           , onRepoConfigDisableSockpuppetDisallowedAuditEntry :: SelectionSet Scope__RepoConfigDisableSockpuppetDisallowedAuditEntry decodesTo
                           , onRepoConfigEnableAnonymousGitAccessAuditEntry :: SelectionSet Scope__RepoConfigEnableAnonymousGitAccessAuditEntry decodesTo
                           , onRepoConfigEnableCollaboratorsOnlyAuditEntry :: SelectionSet Scope__RepoConfigEnableCollaboratorsOnlyAuditEntry decodesTo
                           , onRepoConfigEnableContributorsOnlyAuditEntry :: SelectionSet Scope__RepoConfigEnableContributorsOnlyAuditEntry decodesTo
                           , onRepoConfigEnableSockpuppetDisallowedAuditEntry :: SelectionSet Scope__RepoConfigEnableSockpuppetDisallowedAuditEntry decodesTo
                           , onRepoConfigLockAnonymousGitAccessAuditEntry :: SelectionSet Scope__RepoConfigLockAnonymousGitAccessAuditEntry decodesTo
                           , onRepoConfigUnlockAnonymousGitAccessAuditEntry :: SelectionSet Scope__RepoConfigUnlockAnonymousGitAccessAuditEntry decodesTo
                           , onRepoCreateAuditEntry :: SelectionSet Scope__RepoCreateAuditEntry decodesTo
                           , onRepoDestroyAuditEntry :: SelectionSet Scope__RepoDestroyAuditEntry decodesTo
                           , onRepoRemoveMemberAuditEntry :: SelectionSet Scope__RepoRemoveMemberAuditEntry decodesTo
                           , onRepoRemoveTopicAuditEntry :: SelectionSet Scope__RepoRemoveTopicAuditEntry decodesTo
                           , onTeamAddRepositoryAuditEntry :: SelectionSet Scope__TeamAddRepositoryAuditEntry decodesTo
                           , onTeamRemoveRepositoryAuditEntry :: SelectionSet Scope__TeamRemoveRepositoryAuditEntry decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__RepositoryAuditEntryData decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "OrgRestoreMemberMembershipRepositoryAuditEntryData" selections.onOrgRestoreMemberMembershipRepositoryAuditEntryData, buildFragment "PrivateRepositoryForkingDisableAuditEntry" selections.onPrivateRepositoryForkingDisableAuditEntry, buildFragment "PrivateRepositoryForkingEnableAuditEntry" selections.onPrivateRepositoryForkingEnableAuditEntry, buildFragment "RepoAccessAuditEntry" selections.onRepoAccessAuditEntry, buildFragment "RepoAddMemberAuditEntry" selections.onRepoAddMemberAuditEntry, buildFragment "RepoAddTopicAuditEntry" selections.onRepoAddTopicAuditEntry, buildFragment "RepoArchivedAuditEntry" selections.onRepoArchivedAuditEntry, buildFragment "RepoChangeMergeSettingAuditEntry" selections.onRepoChangeMergeSettingAuditEntry, buildFragment "RepoConfigDisableAnonymousGitAccessAuditEntry" selections.onRepoConfigDisableAnonymousGitAccessAuditEntry, buildFragment "RepoConfigDisableCollaboratorsOnlyAuditEntry" selections.onRepoConfigDisableCollaboratorsOnlyAuditEntry, buildFragment "RepoConfigDisableContributorsOnlyAuditEntry" selections.onRepoConfigDisableContributorsOnlyAuditEntry, buildFragment "RepoConfigDisableSockpuppetDisallowedAuditEntry" selections.onRepoConfigDisableSockpuppetDisallowedAuditEntry, buildFragment "RepoConfigEnableAnonymousGitAccessAuditEntry" selections.onRepoConfigEnableAnonymousGitAccessAuditEntry, buildFragment "RepoConfigEnableCollaboratorsOnlyAuditEntry" selections.onRepoConfigEnableCollaboratorsOnlyAuditEntry, buildFragment "RepoConfigEnableContributorsOnlyAuditEntry" selections.onRepoConfigEnableContributorsOnlyAuditEntry, buildFragment "RepoConfigEnableSockpuppetDisallowedAuditEntry" selections.onRepoConfigEnableSockpuppetDisallowedAuditEntry, buildFragment "RepoConfigLockAnonymousGitAccessAuditEntry" selections.onRepoConfigLockAnonymousGitAccessAuditEntry, buildFragment "RepoConfigUnlockAnonymousGitAccessAuditEntry" selections.onRepoConfigUnlockAnonymousGitAccessAuditEntry, buildFragment "RepoCreateAuditEntry" selections.onRepoCreateAuditEntry, buildFragment "RepoDestroyAuditEntry" selections.onRepoDestroyAuditEntry, buildFragment "RepoRemoveMemberAuditEntry" selections.onRepoRemoveMemberAuditEntry, buildFragment "RepoRemoveTopicAuditEntry" selections.onRepoRemoveTopicAuditEntry, buildFragment "TeamAddRepositoryAuditEntry" selections.onTeamAddRepositoryAuditEntry, buildFragment "TeamRemoveRepositoryAuditEntry" selections.onTeamRemoveRepositoryAuditEntry]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onOrgRestoreMemberMembershipRepositoryAuditEntryData: pure Nothing, onPrivateRepositoryForkingDisableAuditEntry: pure Nothing, onPrivateRepositoryForkingEnableAuditEntry: pure Nothing, onRepoAccessAuditEntry: pure Nothing, onRepoAddMemberAuditEntry: pure Nothing, onRepoAddTopicAuditEntry: pure Nothing, onRepoArchivedAuditEntry: pure Nothing, onRepoChangeMergeSettingAuditEntry: pure Nothing, onRepoConfigDisableAnonymousGitAccessAuditEntry: pure Nothing, onRepoConfigDisableCollaboratorsOnlyAuditEntry: pure Nothing, onRepoConfigDisableContributorsOnlyAuditEntry: pure Nothing, onRepoConfigDisableSockpuppetDisallowedAuditEntry: pure Nothing, onRepoConfigEnableAnonymousGitAccessAuditEntry: pure Nothing, onRepoConfigEnableCollaboratorsOnlyAuditEntry: pure Nothing, onRepoConfigEnableContributorsOnlyAuditEntry: pure Nothing, onRepoConfigEnableSockpuppetDisallowedAuditEntry: pure Nothing, onRepoConfigLockAnonymousGitAccessAuditEntry: pure Nothing, onRepoConfigUnlockAnonymousGitAccessAuditEntry: pure Nothing, onRepoCreateAuditEntry: pure Nothing, onRepoDestroyAuditEntry: pure Nothing, onRepoRemoveMemberAuditEntry: pure Nothing, onRepoRemoveTopicAuditEntry: pure Nothing, onTeamAddRepositoryAuditEntry: pure Nothing, onTeamRemoveRepositoryAuditEntry: pure Nothing }
