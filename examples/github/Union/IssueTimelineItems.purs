module Examples.Github.Union.IssueTimelineItems where

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

type Fragments decodesTo = { onAddedToProjectEvent :: SelectionSet Scope__AddedToProjectEvent decodesTo
                           , onAssignedEvent :: SelectionSet Scope__AssignedEvent decodesTo
                           , onClosedEvent :: SelectionSet Scope__ClosedEvent decodesTo
                           , onCommentDeletedEvent :: SelectionSet Scope__CommentDeletedEvent decodesTo
                           , onConnectedEvent :: SelectionSet Scope__ConnectedEvent decodesTo
                           , onConvertedNoteToIssueEvent :: SelectionSet Scope__ConvertedNoteToIssueEvent decodesTo
                           , onCrossReferencedEvent :: SelectionSet Scope__CrossReferencedEvent decodesTo
                           , onDemilestonedEvent :: SelectionSet Scope__DemilestonedEvent decodesTo
                           , onDisconnectedEvent :: SelectionSet Scope__DisconnectedEvent decodesTo
                           , onIssueComment :: SelectionSet Scope__IssueComment decodesTo
                           , onLabeledEvent :: SelectionSet Scope__LabeledEvent decodesTo
                           , onLockedEvent :: SelectionSet Scope__LockedEvent decodesTo
                           , onMarkedAsDuplicateEvent :: SelectionSet Scope__MarkedAsDuplicateEvent decodesTo
                           , onMentionedEvent :: SelectionSet Scope__MentionedEvent decodesTo
                           , onMilestonedEvent :: SelectionSet Scope__MilestonedEvent decodesTo
                           , onMovedColumnsInProjectEvent :: SelectionSet Scope__MovedColumnsInProjectEvent decodesTo
                           , onPinnedEvent :: SelectionSet Scope__PinnedEvent decodesTo
                           , onReferencedEvent :: SelectionSet Scope__ReferencedEvent decodesTo
                           , onRemovedFromProjectEvent :: SelectionSet Scope__RemovedFromProjectEvent decodesTo
                           , onRenamedTitleEvent :: SelectionSet Scope__RenamedTitleEvent decodesTo
                           , onReopenedEvent :: SelectionSet Scope__ReopenedEvent decodesTo
                           , onSubscribedEvent :: SelectionSet Scope__SubscribedEvent decodesTo
                           , onTransferredEvent :: SelectionSet Scope__TransferredEvent decodesTo
                           , onUnassignedEvent :: SelectionSet Scope__UnassignedEvent decodesTo
                           , onUnlabeledEvent :: SelectionSet Scope__UnlabeledEvent decodesTo
                           , onUnlockedEvent :: SelectionSet Scope__UnlockedEvent decodesTo
                           , onUnmarkedAsDuplicateEvent :: SelectionSet Scope__UnmarkedAsDuplicateEvent decodesTo
                           , onUnpinnedEvent :: SelectionSet Scope__UnpinnedEvent decodesTo
                           , onUnsubscribedEvent :: SelectionSet Scope__UnsubscribedEvent decodesTo
                           , onUserBlockedEvent :: SelectionSet Scope__UserBlockedEvent decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__IssueTimelineItems decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "AddedToProjectEvent" selections.onAddedToProjectEvent, buildFragment "AssignedEvent" selections.onAssignedEvent, buildFragment "ClosedEvent" selections.onClosedEvent, buildFragment "CommentDeletedEvent" selections.onCommentDeletedEvent, buildFragment "ConnectedEvent" selections.onConnectedEvent, buildFragment "ConvertedNoteToIssueEvent" selections.onConvertedNoteToIssueEvent, buildFragment "CrossReferencedEvent" selections.onCrossReferencedEvent, buildFragment "DemilestonedEvent" selections.onDemilestonedEvent, buildFragment "DisconnectedEvent" selections.onDisconnectedEvent, buildFragment "IssueComment" selections.onIssueComment, buildFragment "LabeledEvent" selections.onLabeledEvent, buildFragment "LockedEvent" selections.onLockedEvent, buildFragment "MarkedAsDuplicateEvent" selections.onMarkedAsDuplicateEvent, buildFragment "MentionedEvent" selections.onMentionedEvent, buildFragment "MilestonedEvent" selections.onMilestonedEvent, buildFragment "MovedColumnsInProjectEvent" selections.onMovedColumnsInProjectEvent, buildFragment "PinnedEvent" selections.onPinnedEvent, buildFragment "ReferencedEvent" selections.onReferencedEvent, buildFragment "RemovedFromProjectEvent" selections.onRemovedFromProjectEvent, buildFragment "RenamedTitleEvent" selections.onRenamedTitleEvent, buildFragment "ReopenedEvent" selections.onReopenedEvent, buildFragment "SubscribedEvent" selections.onSubscribedEvent, buildFragment "TransferredEvent" selections.onTransferredEvent, buildFragment "UnassignedEvent" selections.onUnassignedEvent, buildFragment "UnlabeledEvent" selections.onUnlabeledEvent, buildFragment "UnlockedEvent" selections.onUnlockedEvent, buildFragment "UnmarkedAsDuplicateEvent" selections.onUnmarkedAsDuplicateEvent, buildFragment "UnpinnedEvent" selections.onUnpinnedEvent, buildFragment "UnsubscribedEvent" selections.onUnsubscribedEvent, buildFragment "UserBlockedEvent" selections.onUserBlockedEvent]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onAddedToProjectEvent: pure Nothing, onAssignedEvent: pure Nothing, onClosedEvent: pure Nothing, onCommentDeletedEvent: pure Nothing, onConnectedEvent: pure Nothing, onConvertedNoteToIssueEvent: pure Nothing, onCrossReferencedEvent: pure Nothing, onDemilestonedEvent: pure Nothing, onDisconnectedEvent: pure Nothing, onIssueComment: pure Nothing, onLabeledEvent: pure Nothing, onLockedEvent: pure Nothing, onMarkedAsDuplicateEvent: pure Nothing, onMentionedEvent: pure Nothing, onMilestonedEvent: pure Nothing, onMovedColumnsInProjectEvent: pure Nothing, onPinnedEvent: pure Nothing, onReferencedEvent: pure Nothing, onRemovedFromProjectEvent: pure Nothing, onRenamedTitleEvent: pure Nothing, onReopenedEvent: pure Nothing, onSubscribedEvent: pure Nothing, onTransferredEvent: pure Nothing, onUnassignedEvent: pure Nothing, onUnlabeledEvent: pure Nothing, onUnlockedEvent: pure Nothing, onUnmarkedAsDuplicateEvent: pure Nothing, onUnpinnedEvent: pure Nothing, onUnsubscribedEvent: pure Nothing, onUserBlockedEvent: pure Nothing }
