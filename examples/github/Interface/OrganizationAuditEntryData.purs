module Examples.Github.Interface.OrganizationAuditEntryData where

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

organization :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__OrganizationAuditEntryData (Maybe r)
organization = selectionForCompositeField "organization" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__OrganizationAuditEntryData (Maybe String)
organizationName = selectionForField "organizationName" [] graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet Scope__OrganizationAuditEntryData (Maybe Uri)
organizationResourcePath = selectionForField "organizationResourcePath" [] graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__OrganizationAuditEntryData (Maybe Uri)
organizationUrl = selectionForField "organizationUrl" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onMembersCanDeleteReposClearAuditEntry :: SelectionSet Scope__MembersCanDeleteReposClearAuditEntry decodesTo
                           , onMembersCanDeleteReposDisableAuditEntry :: SelectionSet Scope__MembersCanDeleteReposDisableAuditEntry decodesTo
                           , onMembersCanDeleteReposEnableAuditEntry :: SelectionSet Scope__MembersCanDeleteReposEnableAuditEntry decodesTo
                           , onOauthApplicationCreateAuditEntry :: SelectionSet Scope__OauthApplicationCreateAuditEntry decodesTo
                           , onOrgAddBillingManagerAuditEntry :: SelectionSet Scope__OrgAddBillingManagerAuditEntry decodesTo
                           , onOrgAddMemberAuditEntry :: SelectionSet Scope__OrgAddMemberAuditEntry decodesTo
                           , onOrgBlockUserAuditEntry :: SelectionSet Scope__OrgBlockUserAuditEntry decodesTo
                           , onOrgConfigDisableCollaboratorsOnlyAuditEntry :: SelectionSet Scope__OrgConfigDisableCollaboratorsOnlyAuditEntry decodesTo
                           , onOrgConfigEnableCollaboratorsOnlyAuditEntry :: SelectionSet Scope__OrgConfigEnableCollaboratorsOnlyAuditEntry decodesTo
                           , onOrgCreateAuditEntry :: SelectionSet Scope__OrgCreateAuditEntry decodesTo
                           , onOrgDisableOauthAppRestrictionsAuditEntry :: SelectionSet Scope__OrgDisableOauthAppRestrictionsAuditEntry decodesTo
                           , onOrgDisableSamlAuditEntry :: SelectionSet Scope__OrgDisableSamlAuditEntry decodesTo
                           , onOrgDisableTwoFactorRequirementAuditEntry :: SelectionSet Scope__OrgDisableTwoFactorRequirementAuditEntry decodesTo
                           , onOrgEnableOauthAppRestrictionsAuditEntry :: SelectionSet Scope__OrgEnableOauthAppRestrictionsAuditEntry decodesTo
                           , onOrgEnableSamlAuditEntry :: SelectionSet Scope__OrgEnableSamlAuditEntry decodesTo
                           , onOrgEnableTwoFactorRequirementAuditEntry :: SelectionSet Scope__OrgEnableTwoFactorRequirementAuditEntry decodesTo
                           , onOrgInviteMemberAuditEntry :: SelectionSet Scope__OrgInviteMemberAuditEntry decodesTo
                           , onOrgInviteToBusinessAuditEntry :: SelectionSet Scope__OrgInviteToBusinessAuditEntry decodesTo
                           , onOrgOauthAppAccessApprovedAuditEntry :: SelectionSet Scope__OrgOauthAppAccessApprovedAuditEntry decodesTo
                           , onOrgOauthAppAccessDeniedAuditEntry :: SelectionSet Scope__OrgOauthAppAccessDeniedAuditEntry decodesTo
                           , onOrgOauthAppAccessRequestedAuditEntry :: SelectionSet Scope__OrgOauthAppAccessRequestedAuditEntry decodesTo
                           , onOrgRemoveBillingManagerAuditEntry :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry decodesTo
                           , onOrgRemoveMemberAuditEntry :: SelectionSet Scope__OrgRemoveMemberAuditEntry decodesTo
                           , onOrgRemoveOutsideCollaboratorAuditEntry :: SelectionSet Scope__OrgRemoveOutsideCollaboratorAuditEntry decodesTo
                           , onOrgRestoreMemberAuditEntry :: SelectionSet Scope__OrgRestoreMemberAuditEntry decodesTo
                           , onOrgRestoreMemberMembershipOrganizationAuditEntryData :: SelectionSet Scope__OrgRestoreMemberMembershipOrganizationAuditEntryData decodesTo
                           , onOrgUnblockUserAuditEntry :: SelectionSet Scope__OrgUnblockUserAuditEntry decodesTo
                           , onOrgUpdateDefaultRepositoryPermissionAuditEntry :: SelectionSet Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry decodesTo
                           , onOrgUpdateMemberAuditEntry :: SelectionSet Scope__OrgUpdateMemberAuditEntry decodesTo
                           , onOrgUpdateMemberRepositoryCreationPermissionAuditEntry :: SelectionSet Scope__OrgUpdateMemberRepositoryCreationPermissionAuditEntry decodesTo
                           , onOrgUpdateMemberRepositoryInvitationPermissionAuditEntry :: SelectionSet Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry decodesTo
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
                           , onRepositoryVisibilityChangeDisableAuditEntry :: SelectionSet Scope__RepositoryVisibilityChangeDisableAuditEntry decodesTo
                           , onRepositoryVisibilityChangeEnableAuditEntry :: SelectionSet Scope__RepositoryVisibilityChangeEnableAuditEntry decodesTo
                           , onTeamAddMemberAuditEntry :: SelectionSet Scope__TeamAddMemberAuditEntry decodesTo
                           , onTeamAddRepositoryAuditEntry :: SelectionSet Scope__TeamAddRepositoryAuditEntry decodesTo
                           , onTeamChangeParentTeamAuditEntry :: SelectionSet Scope__TeamChangeParentTeamAuditEntry decodesTo
                           , onTeamRemoveMemberAuditEntry :: SelectionSet Scope__TeamRemoveMemberAuditEntry decodesTo
                           , onTeamRemoveRepositoryAuditEntry :: SelectionSet Scope__TeamRemoveRepositoryAuditEntry decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__OrganizationAuditEntryData decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "MembersCanDeleteReposClearAuditEntry" selections.onMembersCanDeleteReposClearAuditEntry, buildFragment "MembersCanDeleteReposDisableAuditEntry" selections.onMembersCanDeleteReposDisableAuditEntry, buildFragment "MembersCanDeleteReposEnableAuditEntry" selections.onMembersCanDeleteReposEnableAuditEntry, buildFragment "OauthApplicationCreateAuditEntry" selections.onOauthApplicationCreateAuditEntry, buildFragment "OrgAddBillingManagerAuditEntry" selections.onOrgAddBillingManagerAuditEntry, buildFragment "OrgAddMemberAuditEntry" selections.onOrgAddMemberAuditEntry, buildFragment "OrgBlockUserAuditEntry" selections.onOrgBlockUserAuditEntry, buildFragment "OrgConfigDisableCollaboratorsOnlyAuditEntry" selections.onOrgConfigDisableCollaboratorsOnlyAuditEntry, buildFragment "OrgConfigEnableCollaboratorsOnlyAuditEntry" selections.onOrgConfigEnableCollaboratorsOnlyAuditEntry, buildFragment "OrgCreateAuditEntry" selections.onOrgCreateAuditEntry, buildFragment "OrgDisableOauthAppRestrictionsAuditEntry" selections.onOrgDisableOauthAppRestrictionsAuditEntry, buildFragment "OrgDisableSamlAuditEntry" selections.onOrgDisableSamlAuditEntry, buildFragment "OrgDisableTwoFactorRequirementAuditEntry" selections.onOrgDisableTwoFactorRequirementAuditEntry, buildFragment "OrgEnableOauthAppRestrictionsAuditEntry" selections.onOrgEnableOauthAppRestrictionsAuditEntry, buildFragment "OrgEnableSamlAuditEntry" selections.onOrgEnableSamlAuditEntry, buildFragment "OrgEnableTwoFactorRequirementAuditEntry" selections.onOrgEnableTwoFactorRequirementAuditEntry, buildFragment "OrgInviteMemberAuditEntry" selections.onOrgInviteMemberAuditEntry, buildFragment "OrgInviteToBusinessAuditEntry" selections.onOrgInviteToBusinessAuditEntry, buildFragment "OrgOauthAppAccessApprovedAuditEntry" selections.onOrgOauthAppAccessApprovedAuditEntry, buildFragment "OrgOauthAppAccessDeniedAuditEntry" selections.onOrgOauthAppAccessDeniedAuditEntry, buildFragment "OrgOauthAppAccessRequestedAuditEntry" selections.onOrgOauthAppAccessRequestedAuditEntry, buildFragment "OrgRemoveBillingManagerAuditEntry" selections.onOrgRemoveBillingManagerAuditEntry, buildFragment "OrgRemoveMemberAuditEntry" selections.onOrgRemoveMemberAuditEntry, buildFragment "OrgRemoveOutsideCollaboratorAuditEntry" selections.onOrgRemoveOutsideCollaboratorAuditEntry, buildFragment "OrgRestoreMemberAuditEntry" selections.onOrgRestoreMemberAuditEntry, buildFragment "OrgRestoreMemberMembershipOrganizationAuditEntryData" selections.onOrgRestoreMemberMembershipOrganizationAuditEntryData, buildFragment "OrgUnblockUserAuditEntry" selections.onOrgUnblockUserAuditEntry, buildFragment "OrgUpdateDefaultRepositoryPermissionAuditEntry" selections.onOrgUpdateDefaultRepositoryPermissionAuditEntry, buildFragment "OrgUpdateMemberAuditEntry" selections.onOrgUpdateMemberAuditEntry, buildFragment "OrgUpdateMemberRepositoryCreationPermissionAuditEntry" selections.onOrgUpdateMemberRepositoryCreationPermissionAuditEntry, buildFragment "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry" selections.onOrgUpdateMemberRepositoryInvitationPermissionAuditEntry, buildFragment "PrivateRepositoryForkingDisableAuditEntry" selections.onPrivateRepositoryForkingDisableAuditEntry, buildFragment "PrivateRepositoryForkingEnableAuditEntry" selections.onPrivateRepositoryForkingEnableAuditEntry, buildFragment "RepoAccessAuditEntry" selections.onRepoAccessAuditEntry, buildFragment "RepoAddMemberAuditEntry" selections.onRepoAddMemberAuditEntry, buildFragment "RepoAddTopicAuditEntry" selections.onRepoAddTopicAuditEntry, buildFragment "RepoArchivedAuditEntry" selections.onRepoArchivedAuditEntry, buildFragment "RepoChangeMergeSettingAuditEntry" selections.onRepoChangeMergeSettingAuditEntry, buildFragment "RepoConfigDisableAnonymousGitAccessAuditEntry" selections.onRepoConfigDisableAnonymousGitAccessAuditEntry, buildFragment "RepoConfigDisableCollaboratorsOnlyAuditEntry" selections.onRepoConfigDisableCollaboratorsOnlyAuditEntry, buildFragment "RepoConfigDisableContributorsOnlyAuditEntry" selections.onRepoConfigDisableContributorsOnlyAuditEntry, buildFragment "RepoConfigDisableSockpuppetDisallowedAuditEntry" selections.onRepoConfigDisableSockpuppetDisallowedAuditEntry, buildFragment "RepoConfigEnableAnonymousGitAccessAuditEntry" selections.onRepoConfigEnableAnonymousGitAccessAuditEntry, buildFragment "RepoConfigEnableCollaboratorsOnlyAuditEntry" selections.onRepoConfigEnableCollaboratorsOnlyAuditEntry, buildFragment "RepoConfigEnableContributorsOnlyAuditEntry" selections.onRepoConfigEnableContributorsOnlyAuditEntry, buildFragment "RepoConfigEnableSockpuppetDisallowedAuditEntry" selections.onRepoConfigEnableSockpuppetDisallowedAuditEntry, buildFragment "RepoConfigLockAnonymousGitAccessAuditEntry" selections.onRepoConfigLockAnonymousGitAccessAuditEntry, buildFragment "RepoConfigUnlockAnonymousGitAccessAuditEntry" selections.onRepoConfigUnlockAnonymousGitAccessAuditEntry, buildFragment "RepoCreateAuditEntry" selections.onRepoCreateAuditEntry, buildFragment "RepoDestroyAuditEntry" selections.onRepoDestroyAuditEntry, buildFragment "RepoRemoveMemberAuditEntry" selections.onRepoRemoveMemberAuditEntry, buildFragment "RepoRemoveTopicAuditEntry" selections.onRepoRemoveTopicAuditEntry, buildFragment "RepositoryVisibilityChangeDisableAuditEntry" selections.onRepositoryVisibilityChangeDisableAuditEntry, buildFragment "RepositoryVisibilityChangeEnableAuditEntry" selections.onRepositoryVisibilityChangeEnableAuditEntry, buildFragment "TeamAddMemberAuditEntry" selections.onTeamAddMemberAuditEntry, buildFragment "TeamAddRepositoryAuditEntry" selections.onTeamAddRepositoryAuditEntry, buildFragment "TeamChangeParentTeamAuditEntry" selections.onTeamChangeParentTeamAuditEntry, buildFragment "TeamRemoveMemberAuditEntry" selections.onTeamRemoveMemberAuditEntry, buildFragment "TeamRemoveRepositoryAuditEntry" selections.onTeamRemoveRepositoryAuditEntry]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onMembersCanDeleteReposClearAuditEntry: pure Nothing, onMembersCanDeleteReposDisableAuditEntry: pure Nothing, onMembersCanDeleteReposEnableAuditEntry: pure Nothing, onOauthApplicationCreateAuditEntry: pure Nothing, onOrgAddBillingManagerAuditEntry: pure Nothing, onOrgAddMemberAuditEntry: pure Nothing, onOrgBlockUserAuditEntry: pure Nothing, onOrgConfigDisableCollaboratorsOnlyAuditEntry: pure Nothing, onOrgConfigEnableCollaboratorsOnlyAuditEntry: pure Nothing, onOrgCreateAuditEntry: pure Nothing, onOrgDisableOauthAppRestrictionsAuditEntry: pure Nothing, onOrgDisableSamlAuditEntry: pure Nothing, onOrgDisableTwoFactorRequirementAuditEntry: pure Nothing, onOrgEnableOauthAppRestrictionsAuditEntry: pure Nothing, onOrgEnableSamlAuditEntry: pure Nothing, onOrgEnableTwoFactorRequirementAuditEntry: pure Nothing, onOrgInviteMemberAuditEntry: pure Nothing, onOrgInviteToBusinessAuditEntry: pure Nothing, onOrgOauthAppAccessApprovedAuditEntry: pure Nothing, onOrgOauthAppAccessDeniedAuditEntry: pure Nothing, onOrgOauthAppAccessRequestedAuditEntry: pure Nothing, onOrgRemoveBillingManagerAuditEntry: pure Nothing, onOrgRemoveMemberAuditEntry: pure Nothing, onOrgRemoveOutsideCollaboratorAuditEntry: pure Nothing, onOrgRestoreMemberAuditEntry: pure Nothing, onOrgRestoreMemberMembershipOrganizationAuditEntryData: pure Nothing, onOrgUnblockUserAuditEntry: pure Nothing, onOrgUpdateDefaultRepositoryPermissionAuditEntry: pure Nothing, onOrgUpdateMemberAuditEntry: pure Nothing, onOrgUpdateMemberRepositoryCreationPermissionAuditEntry: pure Nothing, onOrgUpdateMemberRepositoryInvitationPermissionAuditEntry: pure Nothing, onPrivateRepositoryForkingDisableAuditEntry: pure Nothing, onPrivateRepositoryForkingEnableAuditEntry: pure Nothing, onRepoAccessAuditEntry: pure Nothing, onRepoAddMemberAuditEntry: pure Nothing, onRepoAddTopicAuditEntry: pure Nothing, onRepoArchivedAuditEntry: pure Nothing, onRepoChangeMergeSettingAuditEntry: pure Nothing, onRepoConfigDisableAnonymousGitAccessAuditEntry: pure Nothing, onRepoConfigDisableCollaboratorsOnlyAuditEntry: pure Nothing, onRepoConfigDisableContributorsOnlyAuditEntry: pure Nothing, onRepoConfigDisableSockpuppetDisallowedAuditEntry: pure Nothing, onRepoConfigEnableAnonymousGitAccessAuditEntry: pure Nothing, onRepoConfigEnableCollaboratorsOnlyAuditEntry: pure Nothing, onRepoConfigEnableContributorsOnlyAuditEntry: pure Nothing, onRepoConfigEnableSockpuppetDisallowedAuditEntry: pure Nothing, onRepoConfigLockAnonymousGitAccessAuditEntry: pure Nothing, onRepoConfigUnlockAnonymousGitAccessAuditEntry: pure Nothing, onRepoCreateAuditEntry: pure Nothing, onRepoDestroyAuditEntry: pure Nothing, onRepoRemoveMemberAuditEntry: pure Nothing, onRepoRemoveTopicAuditEntry: pure Nothing, onRepositoryVisibilityChangeDisableAuditEntry: pure Nothing, onRepositoryVisibilityChangeEnableAuditEntry: pure Nothing, onTeamAddMemberAuditEntry: pure Nothing, onTeamAddRepositoryAuditEntry: pure Nothing, onTeamChangeParentTeamAuditEntry: pure Nothing, onTeamRemoveMemberAuditEntry: pure Nothing, onTeamRemoveRepositoryAuditEntry: pure Nothing }
