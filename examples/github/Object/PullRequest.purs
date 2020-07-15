module Examples.Github.Object.PullRequest where

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

activeLockReason :: SelectionSet Scope__PullRequest (Maybe LockReason)
activeLockReason = selectionForField "activeLockReason" [] graphqlDefaultResponseScalarDecoder

additions :: SelectionSet Scope__PullRequest Int
additions = selectionForField "additions" [] graphqlDefaultResponseScalarDecoder

type AssigneesInput = { after :: Optional String
                      , before :: Optional String
                      , first :: Optional Int
                      , last :: Optional Int
                      }

assignees :: forall r . AssigneesInput -> SelectionSet Scope__UserConnection r -> SelectionSet Scope__PullRequest r
assignees input = selectionForCompositeField "assignees" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

author :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__PullRequest (Maybe r)
author = selectionForCompositeField "author" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__PullRequest CommentAuthorAssociation
authorAssociation = selectionForField "authorAssociation" [] graphqlDefaultResponseScalarDecoder

baseRef :: forall r . SelectionSet Scope__Ref r -> SelectionSet Scope__PullRequest (Maybe r)
baseRef = selectionForCompositeField "baseRef" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

baseRefName :: SelectionSet Scope__PullRequest String
baseRefName = selectionForField "baseRefName" [] graphqlDefaultResponseScalarDecoder

baseRefOid :: SelectionSet Scope__PullRequest GitObjectId
baseRefOid = selectionForField "baseRefOid" [] graphqlDefaultResponseScalarDecoder

baseRepository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__PullRequest (Maybe r)
baseRepository = selectionForCompositeField "baseRepository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

body :: SelectionSet Scope__PullRequest String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__PullRequest Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__PullRequest String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

changedFiles :: SelectionSet Scope__PullRequest Int
changedFiles = selectionForField "changedFiles" [] graphqlDefaultResponseScalarDecoder

checksResourcePath :: SelectionSet Scope__PullRequest Uri
checksResourcePath = selectionForField "checksResourcePath" [] graphqlDefaultResponseScalarDecoder

checksUrl :: SelectionSet Scope__PullRequest Uri
checksUrl = selectionForField "checksUrl" [] graphqlDefaultResponseScalarDecoder

closed :: SelectionSet Scope__PullRequest Boolean
closed = selectionForField "closed" [] graphqlDefaultResponseScalarDecoder

closedAt :: SelectionSet Scope__PullRequest (Maybe DateTime)
closedAt = selectionForField "closedAt" [] graphqlDefaultResponseScalarDecoder

type CommentsInput = { after :: Optional String
                     , before :: Optional String
                     , first :: Optional Int
                     , last :: Optional Int
                     }

comments :: forall r . CommentsInput -> SelectionSet Scope__IssueCommentConnection r -> SelectionSet Scope__PullRequest r
comments input = selectionForCompositeField "comments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CommitsInput = { after :: Optional String
                    , before :: Optional String
                    , first :: Optional Int
                    , last :: Optional Int
                    }

commits :: forall r . CommitsInput -> SelectionSet Scope__PullRequestCommitConnection r -> SelectionSet Scope__PullRequest r
commits input = selectionForCompositeField "commits" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__PullRequest DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__PullRequest Boolean
createdViaEmail = selectionForField "createdViaEmail" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__PullRequest (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

deletions :: SelectionSet Scope__PullRequest Int
deletions = selectionForField "deletions" [] graphqlDefaultResponseScalarDecoder

editor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__PullRequest (Maybe r)
editor = selectionForCompositeField "editor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type FilesInput = { after :: Optional String
                  , before :: Optional String
                  , first :: Optional Int
                  , last :: Optional Int
                  }

files :: forall r . FilesInput -> SelectionSet Scope__PullRequestChangedFileConnection r -> SelectionSet Scope__PullRequest (Maybe r)
files input = selectionForCompositeField "files" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

headRef :: forall r . SelectionSet Scope__Ref r -> SelectionSet Scope__PullRequest (Maybe r)
headRef = selectionForCompositeField "headRef" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

headRefName :: SelectionSet Scope__PullRequest String
headRefName = selectionForField "headRefName" [] graphqlDefaultResponseScalarDecoder

headRefOid :: SelectionSet Scope__PullRequest GitObjectId
headRefOid = selectionForField "headRefOid" [] graphqlDefaultResponseScalarDecoder

headRepository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__PullRequest (Maybe r)
headRepository = selectionForCompositeField "headRepository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

headRepositoryOwner :: forall r . SelectionSet Scope__RepositoryOwner r -> SelectionSet Scope__PullRequest (Maybe r)
headRepositoryOwner = selectionForCompositeField "headRepositoryOwner" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HovercardInput = { includeNotificationContexts :: Optional Boolean
                      }

hovercard :: forall r . HovercardInput -> SelectionSet Scope__Hovercard r -> SelectionSet Scope__PullRequest r
hovercard input = selectionForCompositeField "hovercard" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__PullRequest Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__PullRequest Boolean
includesCreatedEdit = selectionForField "includesCreatedEdit" [] graphqlDefaultResponseScalarDecoder

isCrossRepository :: SelectionSet Scope__PullRequest Boolean
isCrossRepository = selectionForField "isCrossRepository" [] graphqlDefaultResponseScalarDecoder

isDraft :: SelectionSet Scope__PullRequest Boolean
isDraft = selectionForField "isDraft" [] graphqlDefaultResponseScalarDecoder

type LabelsInput = { orderBy :: Optional LabelOrder
                   , after :: Optional String
                   , before :: Optional String
                   , first :: Optional Int
                   , last :: Optional Int
                   }

labels :: forall r . LabelsInput -> SelectionSet Scope__LabelConnection r -> SelectionSet Scope__PullRequest (Maybe r)
labels input = selectionForCompositeField "labels" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

lastEditedAt :: SelectionSet Scope__PullRequest (Maybe DateTime)
lastEditedAt = selectionForField "lastEditedAt" [] graphqlDefaultResponseScalarDecoder

locked :: SelectionSet Scope__PullRequest Boolean
locked = selectionForField "locked" [] graphqlDefaultResponseScalarDecoder

maintainerCanModify :: SelectionSet Scope__PullRequest Boolean
maintainerCanModify = selectionForField "maintainerCanModify" [] graphqlDefaultResponseScalarDecoder

mergeCommit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__PullRequest (Maybe r)
mergeCommit = selectionForCompositeField "mergeCommit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mergeable :: SelectionSet Scope__PullRequest MergeableState
mergeable = selectionForField "mergeable" [] graphqlDefaultResponseScalarDecoder

merged :: SelectionSet Scope__PullRequest Boolean
merged = selectionForField "merged" [] graphqlDefaultResponseScalarDecoder

mergedAt :: SelectionSet Scope__PullRequest (Maybe DateTime)
mergedAt = selectionForField "mergedAt" [] graphqlDefaultResponseScalarDecoder

mergedBy :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__PullRequest (Maybe r)
mergedBy = selectionForCompositeField "mergedBy" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

milestone :: forall r . SelectionSet Scope__Milestone r -> SelectionSet Scope__PullRequest (Maybe r)
milestone = selectionForCompositeField "milestone" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

number :: SelectionSet Scope__PullRequest Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

type ParticipantsInput = { after :: Optional String
                         , before :: Optional String
                         , first :: Optional Int
                         , last :: Optional Int
                         }

participants :: forall r . ParticipantsInput -> SelectionSet Scope__UserConnection r -> SelectionSet Scope__PullRequest r
participants input = selectionForCompositeField "participants" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

permalink :: SelectionSet Scope__PullRequest Uri
permalink = selectionForField "permalink" [] graphqlDefaultResponseScalarDecoder

potentialMergeCommit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__PullRequest (Maybe r)
potentialMergeCommit = selectionForCompositeField "potentialMergeCommit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectCardsInput = { after :: Optional String
                         , before :: Optional String
                         , first :: Optional Int
                         , last :: Optional Int
                         , archivedStates :: Array (Maybe ProjectCardArchivedState)
                         }

projectCards :: forall r . ProjectCardsInput -> SelectionSet Scope__ProjectCardConnection r -> SelectionSet Scope__PullRequest r
projectCards input = selectionForCompositeField "projectCards" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

publishedAt :: SelectionSet Scope__PullRequest (Maybe DateTime)
publishedAt = selectionForField "publishedAt" [] graphqlDefaultResponseScalarDecoder

reactionGroups :: forall r . SelectionSet Scope__ReactionGroup r -> SelectionSet Scope__PullRequest (Array r)
reactionGroups = selectionForCompositeField "reactionGroups" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReactionsInput = { after :: Optional String
                      , before :: Optional String
                      , first :: Optional Int
                      , last :: Optional Int
                      , content :: Optional ReactionContent
                      , orderBy :: Optional ReactionOrder
                      }

reactions :: forall r . ReactionsInput -> SelectionSet Scope__ReactionConnection r -> SelectionSet Scope__PullRequest r
reactions input = selectionForCompositeField "reactions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__PullRequest r
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__PullRequest Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

revertResourcePath :: SelectionSet Scope__PullRequest Uri
revertResourcePath = selectionForField "revertResourcePath" [] graphqlDefaultResponseScalarDecoder

revertUrl :: SelectionSet Scope__PullRequest Uri
revertUrl = selectionForField "revertUrl" [] graphqlDefaultResponseScalarDecoder

reviewDecision :: SelectionSet Scope__PullRequest (Maybe PullRequestReviewDecision)
reviewDecision = selectionForField "reviewDecision" [] graphqlDefaultResponseScalarDecoder

type ReviewRequestsInput = { after :: Optional String
                           , before :: Optional String
                           , first :: Optional Int
                           , last :: Optional Int
                           }

reviewRequests :: forall r . ReviewRequestsInput -> SelectionSet Scope__ReviewRequestConnection r -> SelectionSet Scope__PullRequest (Maybe r)
reviewRequests input = selectionForCompositeField "reviewRequests" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReviewThreadsInput = { after :: Optional String
                          , before :: Optional String
                          , first :: Optional Int
                          , last :: Optional Int
                          }

reviewThreads :: forall r . ReviewThreadsInput -> SelectionSet Scope__PullRequestReviewThreadConnection r -> SelectionSet Scope__PullRequest r
reviewThreads input = selectionForCompositeField "reviewThreads" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReviewsInput = { after :: Optional String
                    , before :: Optional String
                    , first :: Optional Int
                    , last :: Optional Int
                    , states :: Array PullRequestReviewState
                    , author :: Optional String
                    }

reviews :: forall r . ReviewsInput -> SelectionSet Scope__PullRequestReviewConnection r -> SelectionSet Scope__PullRequest (Maybe r)
reviews input = selectionForCompositeField "reviews" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

state :: SelectionSet Scope__PullRequest PullRequestState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

suggestedReviewers :: forall r . SelectionSet Scope__SuggestedReviewer r -> SelectionSet Scope__PullRequest (Array (Maybe r))
suggestedReviewers = selectionForCompositeField "suggestedReviewers" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TimelineInput = { since :: Optional DateTime
                     , after :: Optional String
                     , before :: Optional String
                     , first :: Optional Int
                     , last :: Optional Int
                     }

timeline :: forall r . TimelineInput -> SelectionSet Scope__PullRequestTimelineConnection r -> SelectionSet Scope__PullRequest r
timeline input = selectionForCompositeField "timeline" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TimelineItemsInput = { since :: Optional DateTime
                          , skip :: Optional Int
                          , itemTypes :: Array PullRequestTimelineItemsItemType
                          , after :: Optional String
                          , before :: Optional String
                          , first :: Optional Int
                          , last :: Optional Int
                          }

timelineItems :: forall r . TimelineItemsInput -> SelectionSet Scope__PullRequestTimelineItemsConnection r -> SelectionSet Scope__PullRequest r
timelineItems input = selectionForCompositeField "timelineItems" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

title :: SelectionSet Scope__PullRequest String
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__PullRequest DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__PullRequest Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type UserContentEditsInput = { after :: Optional String
                             , before :: Optional String
                             , first :: Optional Int
                             , last :: Optional Int
                             }

userContentEdits :: forall r . UserContentEditsInput -> SelectionSet Scope__UserContentEditConnection r -> SelectionSet Scope__PullRequest (Maybe r)
userContentEdits input = selectionForCompositeField "userContentEdits" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanApplySuggestion :: SelectionSet Scope__PullRequest Boolean
viewerCanApplySuggestion = selectionForField "viewerCanApplySuggestion" [] graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__PullRequest Boolean
viewerCanReact = selectionForField "viewerCanReact" [] graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__PullRequest Boolean
viewerCanSubscribe = selectionForField "viewerCanSubscribe" [] graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__PullRequest Boolean
viewerCanUpdate = selectionForField "viewerCanUpdate" [] graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons :: SelectionSet Scope__PullRequest (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField "viewerCannotUpdateReasons" [] graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__PullRequest Boolean
viewerDidAuthor = selectionForField "viewerDidAuthor" [] graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__PullRequest (Maybe SubscriptionState)
viewerSubscription = selectionForField "viewerSubscription" [] graphqlDefaultResponseScalarDecoder
