module Examples.Github.Object.Milestone where

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

closed :: SelectionSet Scope__Milestone Boolean
closed = selectionForField "closed" [] graphqlDefaultResponseScalarDecoder

closedAt :: SelectionSet Scope__Milestone (Maybe DateTime)
closedAt = selectionForField "closedAt" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Milestone DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

creator :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__Milestone (Maybe r)
creator = selectionForCompositeField "creator" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

description :: SelectionSet Scope__Milestone (Maybe String)
description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

dueOn :: SelectionSet Scope__Milestone (Maybe DateTime)
dueOn = selectionForField "dueOn" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Milestone Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

issuePrioritiesDebug :: SelectionSet Scope__Milestone String
issuePrioritiesDebug = selectionForField "issuePrioritiesDebug" [] graphqlDefaultResponseScalarDecoder

type IssuesInputRowOptional r = ( orderBy :: Optional IssueOrder
                                , labels :: Array (Maybe String)
                                , states :: Array (Maybe IssueState)
                                , filterBy :: Optional IssueFilters
                                , after :: Optional String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                | r
                                )

type IssuesInputRowRequired r = ( labels :: ERROR_NULL_OR_LIST_BUT_WITHOUT_TYPE_INSIDE
                                , states :: ERROR_NULL_OR_LIST_BUT_WITHOUT_TYPE_INSIDE
                                | r
                                )

type IssuesInput = { | RefsInputRowRequired + RefsInputRowRequired + () }

issues :: forall r . IssuesInput -> SelectionSet Scope__IssueConnection r -> SelectionSet Scope__Milestone r
issues input = selectionForCompositeField "issues" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

number :: SelectionSet Scope__Milestone Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

type PullRequestsInputRowOptional r = ( states :: Array (Maybe PullRequestState)
                                      , labels :: Array (Maybe String)
                                      , headRefName :: Optional String
                                      , baseRefName :: Optional String
                                      , orderBy :: Optional IssueOrder
                                      , after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type PullRequestsInputRowRequired r = ( states :: ERROR_NULL_OR_LIST_BUT_WITHOUT_TYPE_INSIDE
                                      , labels :: ERROR_NULL_OR_LIST_BUT_WITHOUT_TYPE_INSIDE
                                      | r
                                      )

type PullRequestsInput = { | RefsInputRowRequired + RefsInputRowRequired + () }

pullRequests :: forall r . PullRequestsInput -> SelectionSet Scope__PullRequestConnection r -> SelectionSet Scope__Milestone r
pullRequests input = selectionForCompositeField "pullRequests" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__Milestone r
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Milestone Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__Milestone MilestoneState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

title :: SelectionSet Scope__Milestone String
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Milestone DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Milestone Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
