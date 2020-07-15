module Examples.Github.Interface.Node where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Github.InputObject
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

id :: SelectionSet Scope__Node Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onAddedToProjectEvent :: SelectionSet Scope__AddedToProjectEvent decodesTo
                           , onApp :: SelectionSet Scope__App decodesTo
                           , onAssignedEvent :: SelectionSet Scope__AssignedEvent decodesTo
                           , onAutomaticBaseChangeFailedEvent :: SelectionSet Scope__AutomaticBaseChangeFailedEvent decodesTo
                           , onAutomaticBaseChangeSucceededEvent :: SelectionSet Scope__AutomaticBaseChangeSucceededEvent decodesTo
                           , onBaseRefChangedEvent :: SelectionSet Scope__BaseRefChangedEvent decodesTo
                           , onBaseRefForcePushedEvent :: SelectionSet Scope__BaseRefForcePushedEvent decodesTo
                           , onBlob :: SelectionSet Scope__Blob decodesTo
                           , onBot :: SelectionSet Scope__Bot decodesTo
                           , onBranchProtectionRule :: SelectionSet Scope__BranchProtectionRule decodesTo
                           , onClosedEvent :: SelectionSet Scope__ClosedEvent decodesTo
                           , onCodeOfConduct :: SelectionSet Scope__CodeOfConduct decodesTo
                           , onCommentDeletedEvent :: SelectionSet Scope__CommentDeletedEvent decodesTo
                           , onCommit :: SelectionSet Scope__Commit decodesTo
                           , onCommitComment :: SelectionSet Scope__CommitComment decodesTo
                           , onCommitCommentThread :: SelectionSet Scope__CommitCommentThread decodesTo
                           , onConnectedEvent :: SelectionSet Scope__ConnectedEvent decodesTo
                           , onConvertToDraftEvent :: SelectionSet Scope__ConvertToDraftEvent decodesTo
                           , onConvertedNoteToIssueEvent :: SelectionSet Scope__ConvertedNoteToIssueEvent decodesTo
                           , onCrossReferencedEvent :: SelectionSet Scope__CrossReferencedEvent decodesTo
                           , onDemilestonedEvent :: SelectionSet Scope__DemilestonedEvent decodesTo
                           , onDeployKey :: SelectionSet Scope__DeployKey decodesTo
                           , onDeployedEvent :: SelectionSet Scope__DeployedEvent decodesTo
                           , onDeployment :: SelectionSet Scope__Deployment decodesTo
                           , onDeploymentEnvironmentChangedEvent :: SelectionSet Scope__DeploymentEnvironmentChangedEvent decodesTo
                           , onDeploymentStatus :: SelectionSet Scope__DeploymentStatus decodesTo
                           , onDisconnectedEvent :: SelectionSet Scope__DisconnectedEvent decodesTo
                           , onEnterprise :: SelectionSet Scope__Enterprise decodesTo
                           , onEnterpriseAdministratorInvitation :: SelectionSet Scope__EnterpriseAdministratorInvitation decodesTo
                           , onEnterpriseIdentityProvider :: SelectionSet Scope__EnterpriseIdentityProvider decodesTo
                           , onEnterpriseRepositoryInfo :: SelectionSet Scope__EnterpriseRepositoryInfo decodesTo
                           , onEnterpriseServerInstallation :: SelectionSet Scope__EnterpriseServerInstallation decodesTo
                           , onEnterpriseServerUserAccount :: SelectionSet Scope__EnterpriseServerUserAccount decodesTo
                           , onEnterpriseServerUserAccountEmail :: SelectionSet Scope__EnterpriseServerUserAccountEmail decodesTo
                           , onEnterpriseServerUserAccountsUpload :: SelectionSet Scope__EnterpriseServerUserAccountsUpload decodesTo
                           , onEnterpriseUserAccount :: SelectionSet Scope__EnterpriseUserAccount decodesTo
                           , onExternalIdentity :: SelectionSet Scope__ExternalIdentity decodesTo
                           , onGist :: SelectionSet Scope__Gist decodesTo
                           , onGistComment :: SelectionSet Scope__GistComment decodesTo
                           , onHeadRefDeletedEvent :: SelectionSet Scope__HeadRefDeletedEvent decodesTo
                           , onHeadRefForcePushedEvent :: SelectionSet Scope__HeadRefForcePushedEvent decodesTo
                           , onHeadRefRestoredEvent :: SelectionSet Scope__HeadRefRestoredEvent decodesTo
                           , onIpAllowListEntry :: SelectionSet Scope__IpAllowListEntry decodesTo
                           , onIssue :: SelectionSet Scope__Issue decodesTo
                           , onIssueComment :: SelectionSet Scope__IssueComment decodesTo
                           , onLabel :: SelectionSet Scope__Label decodesTo
                           , onLabeledEvent :: SelectionSet Scope__LabeledEvent decodesTo
                           , onLanguage :: SelectionSet Scope__Language decodesTo
                           , onLicense :: SelectionSet Scope__License decodesTo
                           , onLockedEvent :: SelectionSet Scope__LockedEvent decodesTo
                           , onMannequin :: SelectionSet Scope__Mannequin decodesTo
                           , onMarkedAsDuplicateEvent :: SelectionSet Scope__MarkedAsDuplicateEvent decodesTo
                           , onMarketplaceCategory :: SelectionSet Scope__MarketplaceCategory decodesTo
                           , onMarketplaceListing :: SelectionSet Scope__MarketplaceListing decodesTo
                           , onMembersCanDeleteReposClearAuditEntry :: SelectionSet Scope__MembersCanDeleteReposClearAuditEntry decodesTo
                           , onMembersCanDeleteReposDisableAuditEntry :: SelectionSet Scope__MembersCanDeleteReposDisableAuditEntry decodesTo
                           , onMembersCanDeleteReposEnableAuditEntry :: SelectionSet Scope__MembersCanDeleteReposEnableAuditEntry decodesTo
                           , onMentionedEvent :: SelectionSet Scope__MentionedEvent decodesTo
                           , onMergedEvent :: SelectionSet Scope__MergedEvent decodesTo
                           , onMilestone :: SelectionSet Scope__Milestone decodesTo
                           , onMilestonedEvent :: SelectionSet Scope__MilestonedEvent decodesTo
                           , onMovedColumnsInProjectEvent :: SelectionSet Scope__MovedColumnsInProjectEvent decodesTo
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
                           , onOrgUnblockUserAuditEntry :: SelectionSet Scope__OrgUnblockUserAuditEntry decodesTo
                           , onOrgUpdateDefaultRepositoryPermissionAuditEntry :: SelectionSet Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry decodesTo
                           , onOrgUpdateMemberAuditEntry :: SelectionSet Scope__OrgUpdateMemberAuditEntry decodesTo
                           , onOrgUpdateMemberRepositoryCreationPermissionAuditEntry :: SelectionSet Scope__OrgUpdateMemberRepositoryCreationPermissionAuditEntry decodesTo
                           , onOrgUpdateMemberRepositoryInvitationPermissionAuditEntry :: SelectionSet Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry decodesTo
                           , onOrganization :: SelectionSet Scope__Organization decodesTo
                           , onOrganizationIdentityProvider :: SelectionSet Scope__OrganizationIdentityProvider decodesTo
                           , onOrganizationInvitation :: SelectionSet Scope__OrganizationInvitation decodesTo
                           , onPackage :: SelectionSet Scope__Package decodesTo
                           , onPackageFile :: SelectionSet Scope__PackageFile decodesTo
                           , onPackageTag :: SelectionSet Scope__PackageTag decodesTo
                           , onPackageVersion :: SelectionSet Scope__PackageVersion decodesTo
                           , onPinnedEvent :: SelectionSet Scope__PinnedEvent decodesTo
                           , onPrivateRepositoryForkingDisableAuditEntry :: SelectionSet Scope__PrivateRepositoryForkingDisableAuditEntry decodesTo
                           , onPrivateRepositoryForkingEnableAuditEntry :: SelectionSet Scope__PrivateRepositoryForkingEnableAuditEntry decodesTo
                           , onProject :: SelectionSet Scope__Project decodesTo
                           , onProjectCard :: SelectionSet Scope__ProjectCard decodesTo
                           , onProjectColumn :: SelectionSet Scope__ProjectColumn decodesTo
                           , onPublicKey :: SelectionSet Scope__PublicKey decodesTo
                           , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
                           , onPullRequestCommit :: SelectionSet Scope__PullRequestCommit decodesTo
                           , onPullRequestCommitCommentThread :: SelectionSet Scope__PullRequestCommitCommentThread decodesTo
                           , onPullRequestReview :: SelectionSet Scope__PullRequestReview decodesTo
                           , onPullRequestReviewComment :: SelectionSet Scope__PullRequestReviewComment decodesTo
                           , onPullRequestReviewThread :: SelectionSet Scope__PullRequestReviewThread decodesTo
                           , onPushAllowance :: SelectionSet Scope__PushAllowance decodesTo
                           , onReaction :: SelectionSet Scope__Reaction decodesTo
                           , onReadyForReviewEvent :: SelectionSet Scope__ReadyForReviewEvent decodesTo
                           , onRef :: SelectionSet Scope__Ref decodesTo
                           , onReferencedEvent :: SelectionSet Scope__ReferencedEvent decodesTo
                           , onRelease :: SelectionSet Scope__Release decodesTo
                           , onReleaseAsset :: SelectionSet Scope__ReleaseAsset decodesTo
                           , onRemovedFromProjectEvent :: SelectionSet Scope__RemovedFromProjectEvent decodesTo
                           , onRenamedTitleEvent :: SelectionSet Scope__RenamedTitleEvent decodesTo
                           , onReopenedEvent :: SelectionSet Scope__ReopenedEvent decodesTo
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
                           , onRepository :: SelectionSet Scope__Repository decodesTo
                           , onRepositoryInvitation :: SelectionSet Scope__RepositoryInvitation decodesTo
                           , onRepositoryTopic :: SelectionSet Scope__RepositoryTopic decodesTo
                           , onRepositoryVisibilityChangeDisableAuditEntry :: SelectionSet Scope__RepositoryVisibilityChangeDisableAuditEntry decodesTo
                           , onRepositoryVisibilityChangeEnableAuditEntry :: SelectionSet Scope__RepositoryVisibilityChangeEnableAuditEntry decodesTo
                           , onRepositoryVulnerabilityAlert :: SelectionSet Scope__RepositoryVulnerabilityAlert decodesTo
                           , onReviewDismissalAllowance :: SelectionSet Scope__ReviewDismissalAllowance decodesTo
                           , onReviewDismissedEvent :: SelectionSet Scope__ReviewDismissedEvent decodesTo
                           , onReviewRequest :: SelectionSet Scope__ReviewRequest decodesTo
                           , onReviewRequestRemovedEvent :: SelectionSet Scope__ReviewRequestRemovedEvent decodesTo
                           , onReviewRequestedEvent :: SelectionSet Scope__ReviewRequestedEvent decodesTo
                           , onSavedReply :: SelectionSet Scope__SavedReply decodesTo
                           , onSecurityAdvisory :: SelectionSet Scope__SecurityAdvisory decodesTo
                           , onSponsorsListing :: SelectionSet Scope__SponsorsListing decodesTo
                           , onSponsorsTier :: SelectionSet Scope__SponsorsTier decodesTo
                           , onSponsorship :: SelectionSet Scope__Sponsorship decodesTo
                           , onStatus :: SelectionSet Scope__Status decodesTo
                           , onStatusCheckRollup :: SelectionSet Scope__StatusCheckRollup decodesTo
                           , onStatusContext :: SelectionSet Scope__StatusContext decodesTo
                           , onSubscribedEvent :: SelectionSet Scope__SubscribedEvent decodesTo
                           , onTag :: SelectionSet Scope__Tag decodesTo
                           , onTeam :: SelectionSet Scope__Team decodesTo
                           , onTeamAddMemberAuditEntry :: SelectionSet Scope__TeamAddMemberAuditEntry decodesTo
                           , onTeamAddRepositoryAuditEntry :: SelectionSet Scope__TeamAddRepositoryAuditEntry decodesTo
                           , onTeamChangeParentTeamAuditEntry :: SelectionSet Scope__TeamChangeParentTeamAuditEntry decodesTo
                           , onTeamDiscussion :: SelectionSet Scope__TeamDiscussion decodesTo
                           , onTeamDiscussionComment :: SelectionSet Scope__TeamDiscussionComment decodesTo
                           , onTeamRemoveMemberAuditEntry :: SelectionSet Scope__TeamRemoveMemberAuditEntry decodesTo
                           , onTeamRemoveRepositoryAuditEntry :: SelectionSet Scope__TeamRemoveRepositoryAuditEntry decodesTo
                           , onTopic :: SelectionSet Scope__Topic decodesTo
                           , onTransferredEvent :: SelectionSet Scope__TransferredEvent decodesTo
                           , onTree :: SelectionSet Scope__Tree decodesTo
                           , onUnassignedEvent :: SelectionSet Scope__UnassignedEvent decodesTo
                           , onUnlabeledEvent :: SelectionSet Scope__UnlabeledEvent decodesTo
                           , onUnlockedEvent :: SelectionSet Scope__UnlockedEvent decodesTo
                           , onUnmarkedAsDuplicateEvent :: SelectionSet Scope__UnmarkedAsDuplicateEvent decodesTo
                           , onUnpinnedEvent :: SelectionSet Scope__UnpinnedEvent decodesTo
                           , onUnsubscribedEvent :: SelectionSet Scope__UnsubscribedEvent decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           , onUserBlockedEvent :: SelectionSet Scope__UserBlockedEvent decodesTo
                           , onUserContentEdit :: SelectionSet Scope__UserContentEdit decodesTo
                           , onUserStatus :: SelectionSet Scope__UserStatus decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__Node decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "AddedToProjectEvent" selections.onAddedToProjectEvent, buildFragment "App" selections.onApp, buildFragment "AssignedEvent" selections.onAssignedEvent, buildFragment "AutomaticBaseChangeFailedEvent" selections.onAutomaticBaseChangeFailedEvent, buildFragment "AutomaticBaseChangeSucceededEvent" selections.onAutomaticBaseChangeSucceededEvent, buildFragment "BaseRefChangedEvent" selections.onBaseRefChangedEvent, buildFragment "BaseRefForcePushedEvent" selections.onBaseRefForcePushedEvent, buildFragment "Blob" selections.onBlob, buildFragment "Bot" selections.onBot, buildFragment "BranchProtectionRule" selections.onBranchProtectionRule, buildFragment "ClosedEvent" selections.onClosedEvent, buildFragment "CodeOfConduct" selections.onCodeOfConduct, buildFragment "CommentDeletedEvent" selections.onCommentDeletedEvent, buildFragment "Commit" selections.onCommit, buildFragment "CommitComment" selections.onCommitComment, buildFragment "CommitCommentThread" selections.onCommitCommentThread, buildFragment "ConnectedEvent" selections.onConnectedEvent, buildFragment "ConvertToDraftEvent" selections.onConvertToDraftEvent, buildFragment "ConvertedNoteToIssueEvent" selections.onConvertedNoteToIssueEvent, buildFragment "CrossReferencedEvent" selections.onCrossReferencedEvent, buildFragment "DemilestonedEvent" selections.onDemilestonedEvent, buildFragment "DeployKey" selections.onDeployKey, buildFragment "DeployedEvent" selections.onDeployedEvent, buildFragment "Deployment" selections.onDeployment, buildFragment "DeploymentEnvironmentChangedEvent" selections.onDeploymentEnvironmentChangedEvent, buildFragment "DeploymentStatus" selections.onDeploymentStatus, buildFragment "DisconnectedEvent" selections.onDisconnectedEvent, buildFragment "Enterprise" selections.onEnterprise, buildFragment "EnterpriseAdministratorInvitation" selections.onEnterpriseAdministratorInvitation, buildFragment "EnterpriseIdentityProvider" selections.onEnterpriseIdentityProvider, buildFragment "EnterpriseRepositoryInfo" selections.onEnterpriseRepositoryInfo, buildFragment "EnterpriseServerInstallation" selections.onEnterpriseServerInstallation, buildFragment "EnterpriseServerUserAccount" selections.onEnterpriseServerUserAccount, buildFragment "EnterpriseServerUserAccountEmail" selections.onEnterpriseServerUserAccountEmail, buildFragment "EnterpriseServerUserAccountsUpload" selections.onEnterpriseServerUserAccountsUpload, buildFragment "EnterpriseUserAccount" selections.onEnterpriseUserAccount, buildFragment "ExternalIdentity" selections.onExternalIdentity, buildFragment "Gist" selections.onGist, buildFragment "GistComment" selections.onGistComment, buildFragment "HeadRefDeletedEvent" selections.onHeadRefDeletedEvent, buildFragment "HeadRefForcePushedEvent" selections.onHeadRefForcePushedEvent, buildFragment "HeadRefRestoredEvent" selections.onHeadRefRestoredEvent, buildFragment "IpAllowListEntry" selections.onIpAllowListEntry, buildFragment "Issue" selections.onIssue, buildFragment "IssueComment" selections.onIssueComment, buildFragment "Label" selections.onLabel, buildFragment "LabeledEvent" selections.onLabeledEvent, buildFragment "Language" selections.onLanguage, buildFragment "License" selections.onLicense, buildFragment "LockedEvent" selections.onLockedEvent, buildFragment "Mannequin" selections.onMannequin, buildFragment "MarkedAsDuplicateEvent" selections.onMarkedAsDuplicateEvent, buildFragment "MarketplaceCategory" selections.onMarketplaceCategory, buildFragment "MarketplaceListing" selections.onMarketplaceListing, buildFragment "MembersCanDeleteReposClearAuditEntry" selections.onMembersCanDeleteReposClearAuditEntry, buildFragment "MembersCanDeleteReposDisableAuditEntry" selections.onMembersCanDeleteReposDisableAuditEntry, buildFragment "MembersCanDeleteReposEnableAuditEntry" selections.onMembersCanDeleteReposEnableAuditEntry, buildFragment "MentionedEvent" selections.onMentionedEvent, buildFragment "MergedEvent" selections.onMergedEvent, buildFragment "Milestone" selections.onMilestone, buildFragment "MilestonedEvent" selections.onMilestonedEvent, buildFragment "MovedColumnsInProjectEvent" selections.onMovedColumnsInProjectEvent, buildFragment "OauthApplicationCreateAuditEntry" selections.onOauthApplicationCreateAuditEntry, buildFragment "OrgAddBillingManagerAuditEntry" selections.onOrgAddBillingManagerAuditEntry, buildFragment "OrgAddMemberAuditEntry" selections.onOrgAddMemberAuditEntry, buildFragment "OrgBlockUserAuditEntry" selections.onOrgBlockUserAuditEntry, buildFragment "OrgConfigDisableCollaboratorsOnlyAuditEntry" selections.onOrgConfigDisableCollaboratorsOnlyAuditEntry, buildFragment "OrgConfigEnableCollaboratorsOnlyAuditEntry" selections.onOrgConfigEnableCollaboratorsOnlyAuditEntry, buildFragment "OrgCreateAuditEntry" selections.onOrgCreateAuditEntry, buildFragment "OrgDisableOauthAppRestrictionsAuditEntry" selections.onOrgDisableOauthAppRestrictionsAuditEntry, buildFragment "OrgDisableSamlAuditEntry" selections.onOrgDisableSamlAuditEntry, buildFragment "OrgDisableTwoFactorRequirementAuditEntry" selections.onOrgDisableTwoFactorRequirementAuditEntry, buildFragment "OrgEnableOauthAppRestrictionsAuditEntry" selections.onOrgEnableOauthAppRestrictionsAuditEntry, buildFragment "OrgEnableSamlAuditEntry" selections.onOrgEnableSamlAuditEntry, buildFragment "OrgEnableTwoFactorRequirementAuditEntry" selections.onOrgEnableTwoFactorRequirementAuditEntry, buildFragment "OrgInviteMemberAuditEntry" selections.onOrgInviteMemberAuditEntry, buildFragment "OrgInviteToBusinessAuditEntry" selections.onOrgInviteToBusinessAuditEntry, buildFragment "OrgOauthAppAccessApprovedAuditEntry" selections.onOrgOauthAppAccessApprovedAuditEntry, buildFragment "OrgOauthAppAccessDeniedAuditEntry" selections.onOrgOauthAppAccessDeniedAuditEntry, buildFragment "OrgOauthAppAccessRequestedAuditEntry" selections.onOrgOauthAppAccessRequestedAuditEntry, buildFragment "OrgRemoveBillingManagerAuditEntry" selections.onOrgRemoveBillingManagerAuditEntry, buildFragment "OrgRemoveMemberAuditEntry" selections.onOrgRemoveMemberAuditEntry, buildFragment "OrgRemoveOutsideCollaboratorAuditEntry" selections.onOrgRemoveOutsideCollaboratorAuditEntry, buildFragment "OrgRestoreMemberAuditEntry" selections.onOrgRestoreMemberAuditEntry, buildFragment "OrgUnblockUserAuditEntry" selections.onOrgUnblockUserAuditEntry, buildFragment "OrgUpdateDefaultRepositoryPermissionAuditEntry" selections.onOrgUpdateDefaultRepositoryPermissionAuditEntry, buildFragment "OrgUpdateMemberAuditEntry" selections.onOrgUpdateMemberAuditEntry, buildFragment "OrgUpdateMemberRepositoryCreationPermissionAuditEntry" selections.onOrgUpdateMemberRepositoryCreationPermissionAuditEntry, buildFragment "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry" selections.onOrgUpdateMemberRepositoryInvitationPermissionAuditEntry, buildFragment "Organization" selections.onOrganization, buildFragment "OrganizationIdentityProvider" selections.onOrganizationIdentityProvider, buildFragment "OrganizationInvitation" selections.onOrganizationInvitation, buildFragment "Package" selections.onPackage, buildFragment "PackageFile" selections.onPackageFile, buildFragment "PackageTag" selections.onPackageTag, buildFragment "PackageVersion" selections.onPackageVersion, buildFragment "PinnedEvent" selections.onPinnedEvent, buildFragment "PrivateRepositoryForkingDisableAuditEntry" selections.onPrivateRepositoryForkingDisableAuditEntry, buildFragment "PrivateRepositoryForkingEnableAuditEntry" selections.onPrivateRepositoryForkingEnableAuditEntry, buildFragment "Project" selections.onProject, buildFragment "ProjectCard" selections.onProjectCard, buildFragment "ProjectColumn" selections.onProjectColumn, buildFragment "PublicKey" selections.onPublicKey, buildFragment "PullRequest" selections.onPullRequest, buildFragment "PullRequestCommit" selections.onPullRequestCommit, buildFragment "PullRequestCommitCommentThread" selections.onPullRequestCommitCommentThread, buildFragment "PullRequestReview" selections.onPullRequestReview, buildFragment "PullRequestReviewComment" selections.onPullRequestReviewComment, buildFragment "PullRequestReviewThread" selections.onPullRequestReviewThread, buildFragment "PushAllowance" selections.onPushAllowance, buildFragment "Reaction" selections.onReaction, buildFragment "ReadyForReviewEvent" selections.onReadyForReviewEvent, buildFragment "Ref" selections.onRef, buildFragment "ReferencedEvent" selections.onReferencedEvent, buildFragment "Release" selections.onRelease, buildFragment "ReleaseAsset" selections.onReleaseAsset, buildFragment "RemovedFromProjectEvent" selections.onRemovedFromProjectEvent, buildFragment "RenamedTitleEvent" selections.onRenamedTitleEvent, buildFragment "ReopenedEvent" selections.onReopenedEvent, buildFragment "RepoAccessAuditEntry" selections.onRepoAccessAuditEntry, buildFragment "RepoAddMemberAuditEntry" selections.onRepoAddMemberAuditEntry, buildFragment "RepoAddTopicAuditEntry" selections.onRepoAddTopicAuditEntry, buildFragment "RepoArchivedAuditEntry" selections.onRepoArchivedAuditEntry, buildFragment "RepoChangeMergeSettingAuditEntry" selections.onRepoChangeMergeSettingAuditEntry, buildFragment "RepoConfigDisableAnonymousGitAccessAuditEntry" selections.onRepoConfigDisableAnonymousGitAccessAuditEntry, buildFragment "RepoConfigDisableCollaboratorsOnlyAuditEntry" selections.onRepoConfigDisableCollaboratorsOnlyAuditEntry, buildFragment "RepoConfigDisableContributorsOnlyAuditEntry" selections.onRepoConfigDisableContributorsOnlyAuditEntry, buildFragment "RepoConfigDisableSockpuppetDisallowedAuditEntry" selections.onRepoConfigDisableSockpuppetDisallowedAuditEntry, buildFragment "RepoConfigEnableAnonymousGitAccessAuditEntry" selections.onRepoConfigEnableAnonymousGitAccessAuditEntry, buildFragment "RepoConfigEnableCollaboratorsOnlyAuditEntry" selections.onRepoConfigEnableCollaboratorsOnlyAuditEntry, buildFragment "RepoConfigEnableContributorsOnlyAuditEntry" selections.onRepoConfigEnableContributorsOnlyAuditEntry, buildFragment "RepoConfigEnableSockpuppetDisallowedAuditEntry" selections.onRepoConfigEnableSockpuppetDisallowedAuditEntry, buildFragment "RepoConfigLockAnonymousGitAccessAuditEntry" selections.onRepoConfigLockAnonymousGitAccessAuditEntry, buildFragment "RepoConfigUnlockAnonymousGitAccessAuditEntry" selections.onRepoConfigUnlockAnonymousGitAccessAuditEntry, buildFragment "RepoCreateAuditEntry" selections.onRepoCreateAuditEntry, buildFragment "RepoDestroyAuditEntry" selections.onRepoDestroyAuditEntry, buildFragment "RepoRemoveMemberAuditEntry" selections.onRepoRemoveMemberAuditEntry, buildFragment "RepoRemoveTopicAuditEntry" selections.onRepoRemoveTopicAuditEntry, buildFragment "Repository" selections.onRepository, buildFragment "RepositoryInvitation" selections.onRepositoryInvitation, buildFragment "RepositoryTopic" selections.onRepositoryTopic, buildFragment "RepositoryVisibilityChangeDisableAuditEntry" selections.onRepositoryVisibilityChangeDisableAuditEntry, buildFragment "RepositoryVisibilityChangeEnableAuditEntry" selections.onRepositoryVisibilityChangeEnableAuditEntry, buildFragment "RepositoryVulnerabilityAlert" selections.onRepositoryVulnerabilityAlert, buildFragment "ReviewDismissalAllowance" selections.onReviewDismissalAllowance, buildFragment "ReviewDismissedEvent" selections.onReviewDismissedEvent, buildFragment "ReviewRequest" selections.onReviewRequest, buildFragment "ReviewRequestRemovedEvent" selections.onReviewRequestRemovedEvent, buildFragment "ReviewRequestedEvent" selections.onReviewRequestedEvent, buildFragment "SavedReply" selections.onSavedReply, buildFragment "SecurityAdvisory" selections.onSecurityAdvisory, buildFragment "SponsorsListing" selections.onSponsorsListing, buildFragment "SponsorsTier" selections.onSponsorsTier, buildFragment "Sponsorship" selections.onSponsorship, buildFragment "Status" selections.onStatus, buildFragment "StatusCheckRollup" selections.onStatusCheckRollup, buildFragment "StatusContext" selections.onStatusContext, buildFragment "SubscribedEvent" selections.onSubscribedEvent, buildFragment "Tag" selections.onTag, buildFragment "Team" selections.onTeam, buildFragment "TeamAddMemberAuditEntry" selections.onTeamAddMemberAuditEntry, buildFragment "TeamAddRepositoryAuditEntry" selections.onTeamAddRepositoryAuditEntry, buildFragment "TeamChangeParentTeamAuditEntry" selections.onTeamChangeParentTeamAuditEntry, buildFragment "TeamDiscussion" selections.onTeamDiscussion, buildFragment "TeamDiscussionComment" selections.onTeamDiscussionComment, buildFragment "TeamRemoveMemberAuditEntry" selections.onTeamRemoveMemberAuditEntry, buildFragment "TeamRemoveRepositoryAuditEntry" selections.onTeamRemoveRepositoryAuditEntry, buildFragment "Topic" selections.onTopic, buildFragment "TransferredEvent" selections.onTransferredEvent, buildFragment "Tree" selections.onTree, buildFragment "UnassignedEvent" selections.onUnassignedEvent, buildFragment "UnlabeledEvent" selections.onUnlabeledEvent, buildFragment "UnlockedEvent" selections.onUnlockedEvent, buildFragment "UnmarkedAsDuplicateEvent" selections.onUnmarkedAsDuplicateEvent, buildFragment "UnpinnedEvent" selections.onUnpinnedEvent, buildFragment "UnsubscribedEvent" selections.onUnsubscribedEvent, buildFragment "User" selections.onUser, buildFragment "UserBlockedEvent" selections.onUserBlockedEvent, buildFragment "UserContentEdit" selections.onUserContentEdit, buildFragment "UserStatus" selections.onUserStatus]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onAddedToProjectEvent: pure Nothing, onApp: pure Nothing, onAssignedEvent: pure Nothing, onAutomaticBaseChangeFailedEvent: pure Nothing, onAutomaticBaseChangeSucceededEvent: pure Nothing, onBaseRefChangedEvent: pure Nothing, onBaseRefForcePushedEvent: pure Nothing, onBlob: pure Nothing, onBot: pure Nothing, onBranchProtectionRule: pure Nothing, onClosedEvent: pure Nothing, onCodeOfConduct: pure Nothing, onCommentDeletedEvent: pure Nothing, onCommit: pure Nothing, onCommitComment: pure Nothing, onCommitCommentThread: pure Nothing, onConnectedEvent: pure Nothing, onConvertToDraftEvent: pure Nothing, onConvertedNoteToIssueEvent: pure Nothing, onCrossReferencedEvent: pure Nothing, onDemilestonedEvent: pure Nothing, onDeployKey: pure Nothing, onDeployedEvent: pure Nothing, onDeployment: pure Nothing, onDeploymentEnvironmentChangedEvent: pure Nothing, onDeploymentStatus: pure Nothing, onDisconnectedEvent: pure Nothing, onEnterprise: pure Nothing, onEnterpriseAdministratorInvitation: pure Nothing, onEnterpriseIdentityProvider: pure Nothing, onEnterpriseRepositoryInfo: pure Nothing, onEnterpriseServerInstallation: pure Nothing, onEnterpriseServerUserAccount: pure Nothing, onEnterpriseServerUserAccountEmail: pure Nothing, onEnterpriseServerUserAccountsUpload: pure Nothing, onEnterpriseUserAccount: pure Nothing, onExternalIdentity: pure Nothing, onGist: pure Nothing, onGistComment: pure Nothing, onHeadRefDeletedEvent: pure Nothing, onHeadRefForcePushedEvent: pure Nothing, onHeadRefRestoredEvent: pure Nothing, onIpAllowListEntry: pure Nothing, onIssue: pure Nothing, onIssueComment: pure Nothing, onLabel: pure Nothing, onLabeledEvent: pure Nothing, onLanguage: pure Nothing, onLicense: pure Nothing, onLockedEvent: pure Nothing, onMannequin: pure Nothing, onMarkedAsDuplicateEvent: pure Nothing, onMarketplaceCategory: pure Nothing, onMarketplaceListing: pure Nothing, onMembersCanDeleteReposClearAuditEntry: pure Nothing, onMembersCanDeleteReposDisableAuditEntry: pure Nothing, onMembersCanDeleteReposEnableAuditEntry: pure Nothing, onMentionedEvent: pure Nothing, onMergedEvent: pure Nothing, onMilestone: pure Nothing, onMilestonedEvent: pure Nothing, onMovedColumnsInProjectEvent: pure Nothing, onOauthApplicationCreateAuditEntry: pure Nothing, onOrgAddBillingManagerAuditEntry: pure Nothing, onOrgAddMemberAuditEntry: pure Nothing, onOrgBlockUserAuditEntry: pure Nothing, onOrgConfigDisableCollaboratorsOnlyAuditEntry: pure Nothing, onOrgConfigEnableCollaboratorsOnlyAuditEntry: pure Nothing, onOrgCreateAuditEntry: pure Nothing, onOrgDisableOauthAppRestrictionsAuditEntry: pure Nothing, onOrgDisableSamlAuditEntry: pure Nothing, onOrgDisableTwoFactorRequirementAuditEntry: pure Nothing, onOrgEnableOauthAppRestrictionsAuditEntry: pure Nothing, onOrgEnableSamlAuditEntry: pure Nothing, onOrgEnableTwoFactorRequirementAuditEntry: pure Nothing, onOrgInviteMemberAuditEntry: pure Nothing, onOrgInviteToBusinessAuditEntry: pure Nothing, onOrgOauthAppAccessApprovedAuditEntry: pure Nothing, onOrgOauthAppAccessDeniedAuditEntry: pure Nothing, onOrgOauthAppAccessRequestedAuditEntry: pure Nothing, onOrgRemoveBillingManagerAuditEntry: pure Nothing, onOrgRemoveMemberAuditEntry: pure Nothing, onOrgRemoveOutsideCollaboratorAuditEntry: pure Nothing, onOrgRestoreMemberAuditEntry: pure Nothing, onOrgUnblockUserAuditEntry: pure Nothing, onOrgUpdateDefaultRepositoryPermissionAuditEntry: pure Nothing, onOrgUpdateMemberAuditEntry: pure Nothing, onOrgUpdateMemberRepositoryCreationPermissionAuditEntry: pure Nothing, onOrgUpdateMemberRepositoryInvitationPermissionAuditEntry: pure Nothing, onOrganization: pure Nothing, onOrganizationIdentityProvider: pure Nothing, onOrganizationInvitation: pure Nothing, onPackage: pure Nothing, onPackageFile: pure Nothing, onPackageTag: pure Nothing, onPackageVersion: pure Nothing, onPinnedEvent: pure Nothing, onPrivateRepositoryForkingDisableAuditEntry: pure Nothing, onPrivateRepositoryForkingEnableAuditEntry: pure Nothing, onProject: pure Nothing, onProjectCard: pure Nothing, onProjectColumn: pure Nothing, onPublicKey: pure Nothing, onPullRequest: pure Nothing, onPullRequestCommit: pure Nothing, onPullRequestCommitCommentThread: pure Nothing, onPullRequestReview: pure Nothing, onPullRequestReviewComment: pure Nothing, onPullRequestReviewThread: pure Nothing, onPushAllowance: pure Nothing, onReaction: pure Nothing, onReadyForReviewEvent: pure Nothing, onRef: pure Nothing, onReferencedEvent: pure Nothing, onRelease: pure Nothing, onReleaseAsset: pure Nothing, onRemovedFromProjectEvent: pure Nothing, onRenamedTitleEvent: pure Nothing, onReopenedEvent: pure Nothing, onRepoAccessAuditEntry: pure Nothing, onRepoAddMemberAuditEntry: pure Nothing, onRepoAddTopicAuditEntry: pure Nothing, onRepoArchivedAuditEntry: pure Nothing, onRepoChangeMergeSettingAuditEntry: pure Nothing, onRepoConfigDisableAnonymousGitAccessAuditEntry: pure Nothing, onRepoConfigDisableCollaboratorsOnlyAuditEntry: pure Nothing, onRepoConfigDisableContributorsOnlyAuditEntry: pure Nothing, onRepoConfigDisableSockpuppetDisallowedAuditEntry: pure Nothing, onRepoConfigEnableAnonymousGitAccessAuditEntry: pure Nothing, onRepoConfigEnableCollaboratorsOnlyAuditEntry: pure Nothing, onRepoConfigEnableContributorsOnlyAuditEntry: pure Nothing, onRepoConfigEnableSockpuppetDisallowedAuditEntry: pure Nothing, onRepoConfigLockAnonymousGitAccessAuditEntry: pure Nothing, onRepoConfigUnlockAnonymousGitAccessAuditEntry: pure Nothing, onRepoCreateAuditEntry: pure Nothing, onRepoDestroyAuditEntry: pure Nothing, onRepoRemoveMemberAuditEntry: pure Nothing, onRepoRemoveTopicAuditEntry: pure Nothing, onRepository: pure Nothing, onRepositoryInvitation: pure Nothing, onRepositoryTopic: pure Nothing, onRepositoryVisibilityChangeDisableAuditEntry: pure Nothing, onRepositoryVisibilityChangeEnableAuditEntry: pure Nothing, onRepositoryVulnerabilityAlert: pure Nothing, onReviewDismissalAllowance: pure Nothing, onReviewDismissedEvent: pure Nothing, onReviewRequest: pure Nothing, onReviewRequestRemovedEvent: pure Nothing, onReviewRequestedEvent: pure Nothing, onSavedReply: pure Nothing, onSecurityAdvisory: pure Nothing, onSponsorsListing: pure Nothing, onSponsorsTier: pure Nothing, onSponsorship: pure Nothing, onStatus: pure Nothing, onStatusCheckRollup: pure Nothing, onStatusContext: pure Nothing, onSubscribedEvent: pure Nothing, onTag: pure Nothing, onTeam: pure Nothing, onTeamAddMemberAuditEntry: pure Nothing, onTeamAddRepositoryAuditEntry: pure Nothing, onTeamChangeParentTeamAuditEntry: pure Nothing, onTeamDiscussion: pure Nothing, onTeamDiscussionComment: pure Nothing, onTeamRemoveMemberAuditEntry: pure Nothing, onTeamRemoveRepositoryAuditEntry: pure Nothing, onTopic: pure Nothing, onTransferredEvent: pure Nothing, onTree: pure Nothing, onUnassignedEvent: pure Nothing, onUnlabeledEvent: pure Nothing, onUnlockedEvent: pure Nothing, onUnmarkedAsDuplicateEvent: pure Nothing, onUnpinnedEvent: pure Nothing, onUnsubscribedEvent: pure Nothing, onUser: pure Nothing, onUserBlockedEvent: pure Nothing, onUserContentEdit: pure Nothing, onUserStatus: pure Nothing }
