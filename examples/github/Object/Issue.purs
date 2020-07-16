module Examples.Github.Object.Issue where

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

activeLockReason :: SelectionSet Scope__Issue (Maybe LockReason)
activeLockReason = selectionForField "activeLockReason" [] graphqlDefaultResponseScalarDecoder

type AssigneesInputRowOptional r = ( after :: Optional String
                                   , before :: Optional String
                                   , first :: Optional Int
                                   , last :: Optional Int
                                   | r
                                   )

type AssigneesInput = { | RefsInputRowOptional + () }

assignees :: forall r . AssigneesInput -> SelectionSet Scope__UserConnection r -> SelectionSet Scope__Issue r
assignees input = selectionForCompositeField "assignees" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

author :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__Issue (Maybe r)
author = selectionForCompositeField "author" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__Issue CommentAuthorAssociation
authorAssociation = selectionForField "authorAssociation" [] graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__Issue String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__Issue Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__Issue String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

closed :: SelectionSet Scope__Issue Boolean
closed = selectionForField "closed" [] graphqlDefaultResponseScalarDecoder

closedAt :: SelectionSet Scope__Issue (Maybe DateTime)
closedAt = selectionForField "closedAt" [] graphqlDefaultResponseScalarDecoder

type CommentsInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type CommentsInput = { | RefsInputRowOptional + () }

comments :: forall r . CommentsInput -> SelectionSet Scope__IssueCommentConnection r -> SelectionSet Scope__Issue r
comments input = selectionForCompositeField "comments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__Issue DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__Issue Boolean
createdViaEmail = selectionForField "createdViaEmail" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Issue (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

editor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__Issue (Maybe r)
editor = selectionForCompositeField "editor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HovercardInputRowOptional r = ( includeNotificationContexts :: Optional Boolean
                                   | r
                                   )

type HovercardInput = { | RefsInputRowOptional + () }

hovercard :: forall r . HovercardInput -> SelectionSet Scope__Hovercard r -> SelectionSet Scope__Issue r
hovercard input = selectionForCompositeField "hovercard" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Issue Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__Issue Boolean
includesCreatedEdit = selectionForField "includesCreatedEdit" [] graphqlDefaultResponseScalarDecoder

type LabelsInputRowOptional r = ( orderBy :: Optional LabelOrder
                                , after :: Optional String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                | r
                                )

type LabelsInput = { | RefsInputRowOptional + () }

labels :: forall r . LabelsInput -> SelectionSet Scope__LabelConnection r -> SelectionSet Scope__Issue (Maybe r)
labels input = selectionForCompositeField "labels" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

lastEditedAt :: SelectionSet Scope__Issue (Maybe DateTime)
lastEditedAt = selectionForField "lastEditedAt" [] graphqlDefaultResponseScalarDecoder

locked :: SelectionSet Scope__Issue Boolean
locked = selectionForField "locked" [] graphqlDefaultResponseScalarDecoder

milestone :: forall r . SelectionSet Scope__Milestone r -> SelectionSet Scope__Issue (Maybe r)
milestone = selectionForCompositeField "milestone" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

number :: SelectionSet Scope__Issue Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

type ParticipantsInputRowOptional r = ( after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type ParticipantsInput = { | RefsInputRowOptional + () }

participants :: forall r . ParticipantsInput -> SelectionSet Scope__UserConnection r -> SelectionSet Scope__Issue r
participants input = selectionForCompositeField "participants" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectCardsInputRowOptional r = ( after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      , archivedStates :: Optional (Array (Maybe ProjectCardArchivedState))
                                      | r
                                      )

type ProjectCardsInput = { | RefsInputRowOptional + () }

projectCards :: forall r . ProjectCardsInput -> SelectionSet Scope__ProjectCardConnection r -> SelectionSet Scope__Issue r
projectCards input = selectionForCompositeField "projectCards" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

publishedAt :: SelectionSet Scope__Issue (Maybe DateTime)
publishedAt = selectionForField "publishedAt" [] graphqlDefaultResponseScalarDecoder

reactionGroups :: forall r . SelectionSet Scope__ReactionGroup r -> SelectionSet Scope__Issue (Maybe (Array r))
reactionGroups = selectionForCompositeField "reactionGroups" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReactionsInputRowOptional r = ( after :: Optional String
                                   , before :: Optional String
                                   , first :: Optional Int
                                   , last :: Optional Int
                                   , content :: Optional ReactionContent
                                   , orderBy :: Optional ReactionOrder
                                   | r
                                   )

type ReactionsInput = { | RefsInputRowOptional + () }

reactions :: forall r . ReactionsInput -> SelectionSet Scope__ReactionConnection r -> SelectionSet Scope__Issue r
reactions input = selectionForCompositeField "reactions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__Issue r
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Issue Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__Issue IssueState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

type TimelineInputRowOptional r = ( since :: Optional DateTime
                                  , after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type TimelineInput = { | RefsInputRowOptional + () }

timeline :: forall r . TimelineInput -> SelectionSet Scope__IssueTimelineConnection r -> SelectionSet Scope__Issue r
timeline input = selectionForCompositeField "timeline" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TimelineItemsInputRowOptional r = ( since :: Optional DateTime
                                       , skip :: Optional Int
                                       , itemTypes :: Optional (Array IssueTimelineItemsItemType)
                                       , after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type TimelineItemsInput = { | RefsInputRowOptional + () }

timelineItems :: forall r . TimelineItemsInput -> SelectionSet Scope__IssueTimelineItemsConnection r -> SelectionSet Scope__Issue r
timelineItems input = selectionForCompositeField "timelineItems" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

title :: SelectionSet Scope__Issue String
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Issue DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Issue Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type UserContentEditsInputRowOptional r = ( after :: Optional String
                                          , before :: Optional String
                                          , first :: Optional Int
                                          , last :: Optional Int
                                          | r
                                          )

type UserContentEditsInput = { | RefsInputRowOptional + () }

userContentEdits :: forall r . UserContentEditsInput -> SelectionSet Scope__UserContentEditConnection r -> SelectionSet Scope__Issue (Maybe r)
userContentEdits input = selectionForCompositeField "userContentEdits" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanReact :: SelectionSet Scope__Issue Boolean
viewerCanReact = selectionForField "viewerCanReact" [] graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__Issue Boolean
viewerCanSubscribe = selectionForField "viewerCanSubscribe" [] graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__Issue Boolean
viewerCanUpdate = selectionForField "viewerCanUpdate" [] graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons :: SelectionSet Scope__Issue (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField "viewerCannotUpdateReasons" [] graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__Issue Boolean
viewerDidAuthor = selectionForField "viewerDidAuthor" [] graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__Issue (Maybe SubscriptionState)
viewerSubscription = selectionForField "viewerSubscription" [] graphqlDefaultResponseScalarDecoder
