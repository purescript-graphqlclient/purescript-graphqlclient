module Examples.Github.Object.Team where

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

type AncestorsInput = { after :: Optional String
                      , before :: Optional String
                      , first :: Optional Int
                      , last :: Optional Int
                      }

ancestors :: forall r . AncestorsInput -> SelectionSet Scope__TeamConnection r -> SelectionSet Scope__Team r
ancestors input = selectionForCompositeField "ancestors" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AvatarUrlInput = { size :: Optional Int
                      }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__Team (Maybe Uri)
avatarUrl input = selectionForField "avatarUrl" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

type ChildTeamsInput = { orderBy :: Optional TeamOrder
                       , userLogins :: Array String
                       , immediateOnly :: Optional Boolean
                       , after :: Optional String
                       , before :: Optional String
                       , first :: Optional Int
                       , last :: Optional Int
                       }

childTeams :: forall r . ChildTeamsInput -> SelectionSet Scope__TeamConnection r -> SelectionSet Scope__Team r
childTeams input = selectionForCompositeField "childTeams" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

combinedSlug :: SelectionSet Scope__Team String
combinedSlug = selectionForField "combinedSlug" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Team DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Team (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Team (Maybe String)
description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

type DiscussionInput = { number :: Int
                       }

discussion :: forall r . DiscussionInput -> SelectionSet Scope__TeamDiscussion r -> SelectionSet Scope__Team (Maybe r)
discussion input = selectionForCompositeField "discussion" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DiscussionsInput = { after :: Optional String
                        , before :: Optional String
                        , first :: Optional Int
                        , last :: Optional Int
                        , isPinned :: Optional Boolean
                        , orderBy :: Optional TeamDiscussionOrder
                        }

discussions :: forall r . DiscussionsInput -> SelectionSet Scope__TeamDiscussionConnection r -> SelectionSet Scope__Team r
discussions input = selectionForCompositeField "discussions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

discussionsResourcePath :: SelectionSet Scope__Team Uri
discussionsResourcePath = selectionForField "discussionsResourcePath" [] graphqlDefaultResponseScalarDecoder

discussionsUrl :: SelectionSet Scope__Team Uri
discussionsUrl = selectionForField "discussionsUrl" [] graphqlDefaultResponseScalarDecoder

editTeamResourcePath :: SelectionSet Scope__Team Uri
editTeamResourcePath = selectionForField "editTeamResourcePath" [] graphqlDefaultResponseScalarDecoder

editTeamUrl :: SelectionSet Scope__Team Uri
editTeamUrl = selectionForField "editTeamUrl" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Team Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type InvitationsInput = { after :: Optional String
                        , before :: Optional String
                        , first :: Optional Int
                        , last :: Optional Int
                        }

invitations :: forall r . InvitationsInput -> SelectionSet Scope__OrganizationInvitationConnection r -> SelectionSet Scope__Team (Maybe r)
invitations input = selectionForCompositeField "invitations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MemberStatusesInput = { after :: Optional String
                           , before :: Optional String
                           , first :: Optional Int
                           , last :: Optional Int
                           , orderBy :: Optional UserStatusOrder
                           }

memberStatuses :: forall r . MemberStatusesInput -> SelectionSet Scope__UserStatusConnection r -> SelectionSet Scope__Team r
memberStatuses input = selectionForCompositeField "memberStatuses" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MembersInput = { after :: Optional String
                    , before :: Optional String
                    , first :: Optional Int
                    , last :: Optional Int
                    , query :: Optional String
                    , membership :: Optional TeamMembershipType
                    , role :: Optional TeamMemberRole
                    , orderBy :: Optional TeamMemberOrder
                    }

members :: forall r . MembersInput -> SelectionSet Scope__TeamMemberConnection r -> SelectionSet Scope__Team r
members input = selectionForCompositeField "members" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersResourcePath :: SelectionSet Scope__Team Uri
membersResourcePath = selectionForField "membersResourcePath" [] graphqlDefaultResponseScalarDecoder

membersUrl :: SelectionSet Scope__Team Uri
membersUrl = selectionForField "membersUrl" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Team String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

newTeamResourcePath :: SelectionSet Scope__Team Uri
newTeamResourcePath = selectionForField "newTeamResourcePath" [] graphqlDefaultResponseScalarDecoder

newTeamUrl :: SelectionSet Scope__Team Uri
newTeamUrl = selectionForField "newTeamUrl" [] graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__Team r
organization = selectionForCompositeField "organization" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

parentTeam :: forall r . SelectionSet Scope__Team r -> SelectionSet Scope__Team (Maybe r)
parentTeam = selectionForCompositeField "parentTeam" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

privacy :: SelectionSet Scope__Team TeamPrivacy
privacy = selectionForField "privacy" [] graphqlDefaultResponseScalarDecoder

type RepositoriesInput = { after :: Optional String
                         , before :: Optional String
                         , first :: Optional Int
                         , last :: Optional Int
                         , query :: Optional String
                         , orderBy :: Optional TeamRepositoryOrder
                         }

repositories :: forall r . RepositoriesInput -> SelectionSet Scope__TeamRepositoryConnection r -> SelectionSet Scope__Team r
repositories input = selectionForCompositeField "repositories" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoriesResourcePath :: SelectionSet Scope__Team Uri
repositoriesResourcePath = selectionForField "repositoriesResourcePath" [] graphqlDefaultResponseScalarDecoder

repositoriesUrl :: SelectionSet Scope__Team Uri
repositoriesUrl = selectionForField "repositoriesUrl" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__Team Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

slug :: SelectionSet Scope__Team String
slug = selectionForField "slug" [] graphqlDefaultResponseScalarDecoder

teamsResourcePath :: SelectionSet Scope__Team Uri
teamsResourcePath = selectionForField "teamsResourcePath" [] graphqlDefaultResponseScalarDecoder

teamsUrl :: SelectionSet Scope__Team Uri
teamsUrl = selectionForField "teamsUrl" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Team DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Team Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanAdminister :: SelectionSet Scope__Team Boolean
viewerCanAdminister = selectionForField "viewerCanAdminister" [] graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__Team Boolean
viewerCanSubscribe = selectionForField "viewerCanSubscribe" [] graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__Team (Maybe SubscriptionState)
viewerSubscription = selectionForField "viewerSubscription" [] graphqlDefaultResponseScalarDecoder
