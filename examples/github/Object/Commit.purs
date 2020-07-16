module Examples.Github.Object.Commit where

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

abbreviatedOid :: SelectionSet Scope__Commit String
abbreviatedOid = selectionForField "abbreviatedOid" [] graphqlDefaultResponseScalarDecoder

additions :: SelectionSet Scope__Commit Int
additions = selectionForField "additions" [] graphqlDefaultResponseScalarDecoder

type AssociatedPullRequestsInputRowOptional r = ( after :: Optional String
                                                , before :: Optional String
                                                , first :: Optional Int
                                                , last :: Optional Int
                                                , orderBy :: Optional PullRequestOrder
                                                | r
                                                )

type AssociatedPullRequestsInput = { | RefsInputRowOptional + () }

associatedPullRequests :: forall r . AssociatedPullRequestsInput -> SelectionSet Scope__PullRequestConnection r -> SelectionSet Scope__Commit (Maybe r)
associatedPullRequests input = selectionForCompositeField "associatedPullRequests" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

author :: forall r . SelectionSet Scope__GitActor r -> SelectionSet Scope__Commit (Maybe r)
author = selectionForCompositeField "author" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authoredByCommitter :: SelectionSet Scope__Commit Boolean
authoredByCommitter = selectionForField "authoredByCommitter" [] graphqlDefaultResponseScalarDecoder

authoredDate :: SelectionSet Scope__Commit DateTime
authoredDate = selectionForField "authoredDate" [] graphqlDefaultResponseScalarDecoder

type BlameInputRowOptional r = ( path :: Optional String
                               | r
                               )

type BlameInputRowRequired r = ( path :: ERROR_NULL_OR_LIST_BUT_WITHOUT_TYPE_INSIDE
                               | r
                               )

type BlameInput = { | RefsInputRowRequired + RefsInputRowRequired + () }

blame :: forall r . BlameInput -> SelectionSet Scope__Blame r -> SelectionSet Scope__Commit r
blame input = selectionForCompositeField "blame" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

changedFiles :: SelectionSet Scope__Commit Int
changedFiles = selectionForField "changedFiles" [] graphqlDefaultResponseScalarDecoder

type CommentsInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type CommentsInput = { | RefsInputRowOptional + () }

comments :: forall r . CommentsInput -> SelectionSet Scope__CommitCommentConnection r -> SelectionSet Scope__Commit r
comments input = selectionForCompositeField "comments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commitResourcePath :: SelectionSet Scope__Commit Uri
commitResourcePath = selectionForField "commitResourcePath" [] graphqlDefaultResponseScalarDecoder

commitUrl :: SelectionSet Scope__Commit Uri
commitUrl = selectionForField "commitUrl" [] graphqlDefaultResponseScalarDecoder

committedDate :: SelectionSet Scope__Commit DateTime
committedDate = selectionForField "committedDate" [] graphqlDefaultResponseScalarDecoder

committedViaWeb :: SelectionSet Scope__Commit Boolean
committedViaWeb = selectionForField "committedViaWeb" [] graphqlDefaultResponseScalarDecoder

committer :: forall r . SelectionSet Scope__GitActor r -> SelectionSet Scope__Commit (Maybe r)
committer = selectionForCompositeField "committer" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

deletions :: SelectionSet Scope__Commit Int
deletions = selectionForField "deletions" [] graphqlDefaultResponseScalarDecoder

type DeploymentsInputRowOptional r = ( environments :: Array (Maybe String)
                                     , orderBy :: Optional DeploymentOrder
                                     , after :: Optional String
                                     , before :: Optional String
                                     , first :: Optional Int
                                     , last :: Optional Int
                                     | r
                                     )

type DeploymentsInputRowRequired r = ( environments :: ERROR_NULL_OR_LIST_BUT_WITHOUT_TYPE_INSIDE
                                     | r
                                     )

type DeploymentsInput = { | RefsInputRowRequired + RefsInputRowRequired + () }

deployments :: forall r . DeploymentsInput -> SelectionSet Scope__DeploymentConnection r -> SelectionSet Scope__Commit (Maybe r)
deployments input = selectionForCompositeField "deployments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HistoryInputRowOptional r = ( after :: Optional String
                                 , before :: Optional String
                                 , first :: Optional Int
                                 , last :: Optional Int
                                 , path :: Optional String
                                 , author :: Optional CommitAuthor
                                 , since :: Optional GitTimestamp
                                 , until :: Optional GitTimestamp
                                 | r
                                 )

type HistoryInput = { | RefsInputRowOptional + () }

history :: forall r . HistoryInput -> SelectionSet Scope__CommitHistoryConnection r -> SelectionSet Scope__Commit r
history input = selectionForCompositeField "history" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Commit Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

message :: SelectionSet Scope__Commit String
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

messageBody :: SelectionSet Scope__Commit String
messageBody = selectionForField "messageBody" [] graphqlDefaultResponseScalarDecoder

messageBodyHTML :: SelectionSet Scope__Commit Html
messageBodyHTML = selectionForField "messageBodyHTML" [] graphqlDefaultResponseScalarDecoder

messageHeadline :: SelectionSet Scope__Commit String
messageHeadline = selectionForField "messageHeadline" [] graphqlDefaultResponseScalarDecoder

messageHeadlineHTML :: SelectionSet Scope__Commit Html
messageHeadlineHTML = selectionForField "messageHeadlineHTML" [] graphqlDefaultResponseScalarDecoder

oid :: SelectionSet Scope__Commit GitObjectId
oid = selectionForField "oid" [] graphqlDefaultResponseScalarDecoder

onBehalfOf :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__Commit (Maybe r)
onBehalfOf = selectionForCompositeField "onBehalfOf" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ParentsInputRowOptional r = ( after :: Optional String
                                 , before :: Optional String
                                 , first :: Optional Int
                                 , last :: Optional Int
                                 | r
                                 )

type ParentsInput = { | RefsInputRowOptional + () }

parents :: forall r . ParentsInput -> SelectionSet Scope__CommitConnection r -> SelectionSet Scope__Commit r
parents input = selectionForCompositeField "parents" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pushedDate :: SelectionSet Scope__Commit (Maybe DateTime)
pushedDate = selectionForField "pushedDate" [] graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__Commit r
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Commit Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

signature :: forall r . SelectionSet Scope__GitSignature r -> SelectionSet Scope__Commit (Maybe r)
signature = selectionForCompositeField "signature" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

status :: forall r . SelectionSet Scope__Status r -> SelectionSet Scope__Commit (Maybe r)
status = selectionForCompositeField "status" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

statusCheckRollup :: forall r . SelectionSet Scope__StatusCheckRollup r -> SelectionSet Scope__Commit (Maybe r)
statusCheckRollup = selectionForCompositeField "statusCheckRollup" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SubmodulesInputRowOptional r = ( after :: Optional String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    | r
                                    )

type SubmodulesInput = { | RefsInputRowOptional + () }

submodules :: forall r . SubmodulesInput -> SelectionSet Scope__SubmoduleConnection r -> SelectionSet Scope__Commit r
submodules input = selectionForCompositeField "submodules" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

tarballUrl :: SelectionSet Scope__Commit Uri
tarballUrl = selectionForField "tarballUrl" [] graphqlDefaultResponseScalarDecoder

tree :: forall r . SelectionSet Scope__Tree r -> SelectionSet Scope__Commit r
tree = selectionForCompositeField "tree" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

treeResourcePath :: SelectionSet Scope__Commit Uri
treeResourcePath = selectionForField "treeResourcePath" [] graphqlDefaultResponseScalarDecoder

treeUrl :: SelectionSet Scope__Commit Uri
treeUrl = selectionForField "treeUrl" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Commit Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__Commit Boolean
viewerCanSubscribe = selectionForField "viewerCanSubscribe" [] graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__Commit (Maybe SubscriptionState)
viewerSubscription = selectionForField "viewerSubscription" [] graphqlDefaultResponseScalarDecoder

zipballUrl :: SelectionSet Scope__Commit Uri
zipballUrl = selectionForField "zipballUrl" [] graphqlDefaultResponseScalarDecoder
