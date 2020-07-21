module Examples.Github.Object.Organization where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Github.InputObject
import Type.Row
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

type AnyPinnableItemsInputRowOptional r = ( "type" :: Optional PinnableItemType
                                          | r
                                          )

type AnyPinnableItemsInput = { | AnyPinnableItemsInputRowOptional + () }

anyPinnableItems :: AnyPinnableItemsInput -> SelectionSet Scope__Organization Boolean
anyPinnableItems input = selectionForField "anyPinnableItems" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

type AuditLogInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  , query :: Optional String
                                  , orderBy :: Optional AuditLogOrder
                                  | r
                                  )

type AuditLogInput = { | AuditLogInputRowOptional + () }

auditLog :: forall r . AuditLogInput -> SelectionSet Scope__OrganizationAuditEntryConnection r -> SelectionSet Scope__Organization r
auditLog input = selectionForCompositeField "auditLog" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AvatarUrlInputRowOptional r = ( size :: Optional Int
                                   | r
                                   )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__Organization Uri
avatarUrl input = selectionForField "avatarUrl" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Organization DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Organization (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Organization (Maybe String)
description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

descriptionHTML :: SelectionSet Scope__Organization (Maybe String)
descriptionHTML = selectionForField "descriptionHTML" [] graphqlDefaultResponseScalarDecoder

email :: SelectionSet Scope__Organization (Maybe String)
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Organization Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

ipAllowListEnabledSetting :: SelectionSet Scope__Organization IpAllowListEnabledSettingValue
ipAllowListEnabledSetting = selectionForField "ipAllowListEnabledSetting" [] graphqlDefaultResponseScalarDecoder

type IpAllowListEntriesInputRowOptional r = ( after :: Optional String
                                            , before :: Optional String
                                            , first :: Optional Int
                                            , last :: Optional Int
                                            , orderBy :: Optional IpAllowListEntryOrder
                                            | r
                                            )

type IpAllowListEntriesInput = { | IpAllowListEntriesInputRowOptional + () }

ipAllowListEntries :: forall r . IpAllowListEntriesInput -> SelectionSet Scope__IpAllowListEntryConnection r -> SelectionSet Scope__Organization r
ipAllowListEntries input = selectionForCompositeField "ipAllowListEntries" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

isVerified :: SelectionSet Scope__Organization Boolean
isVerified = selectionForField "isVerified" [] graphqlDefaultResponseScalarDecoder

itemShowcase :: forall r . SelectionSet Scope__ProfileItemShowcase r -> SelectionSet Scope__Organization r
itemShowcase = selectionForCompositeField "itemShowcase" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

location :: SelectionSet Scope__Organization (Maybe String)
location = selectionForField "location" [] graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__Organization String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

type MemberStatusesInputRowOptional r = ( after :: Optional String
                                        , before :: Optional String
                                        , first :: Optional Int
                                        , last :: Optional Int
                                        , orderBy :: Optional UserStatusOrder
                                        | r
                                        )

type MemberStatusesInput = { | MemberStatusesInputRowOptional + () }

memberStatuses :: forall r . MemberStatusesInput -> SelectionSet Scope__UserStatusConnection r -> SelectionSet Scope__Organization r
memberStatuses input = selectionForCompositeField "memberStatuses" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MembersWithRoleInputRowOptional r = ( after :: Optional String
                                         , before :: Optional String
                                         , first :: Optional Int
                                         , last :: Optional Int
                                         | r
                                         )

type MembersWithRoleInput = { | MembersWithRoleInputRowOptional + () }

membersWithRole :: forall r . MembersWithRoleInput -> SelectionSet Scope__OrganizationMemberConnection r -> SelectionSet Scope__Organization r
membersWithRole input = selectionForCompositeField "membersWithRole" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

name :: SelectionSet Scope__Organization (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

newTeamResourcePath :: SelectionSet Scope__Organization Uri
newTeamResourcePath = selectionForField "newTeamResourcePath" [] graphqlDefaultResponseScalarDecoder

newTeamUrl :: SelectionSet Scope__Organization Uri
newTeamUrl = selectionForField "newTeamUrl" [] graphqlDefaultResponseScalarDecoder

organizationBillingEmail :: SelectionSet Scope__Organization (Maybe String)
organizationBillingEmail = selectionForField "organizationBillingEmail" [] graphqlDefaultResponseScalarDecoder

type PackagesInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  , names :: Optional (Array (Maybe String))
                                  , repositoryId :: Optional Id
                                  , packageType :: Optional PackageType
                                  , orderBy :: Optional PackageOrder
                                  | r
                                  )

type PackagesInput = { | PackagesInputRowOptional + () }

packages :: forall r . PackagesInput -> SelectionSet Scope__PackageConnection r -> SelectionSet Scope__Organization r
packages input = selectionForCompositeField "packages" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingMembersInputRowOptional r = ( after :: Optional String
                                        , before :: Optional String
                                        , first :: Optional Int
                                        , last :: Optional Int
                                        | r
                                        )

type PendingMembersInput = { | PendingMembersInputRowOptional + () }

pendingMembers :: forall r . PendingMembersInput -> SelectionSet Scope__UserConnection r -> SelectionSet Scope__Organization r
pendingMembers input = selectionForCompositeField "pendingMembers" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinnableItemsInputRowOptional r = ( types :: Optional (Array PinnableItemType)
                                       , after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type PinnableItemsInput = { | PinnableItemsInputRowOptional + () }

pinnableItems :: forall r . PinnableItemsInput -> SelectionSet Scope__PinnableItemConnection r -> SelectionSet Scope__Organization r
pinnableItems input = selectionForCompositeField "pinnableItems" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinnedItemsInputRowOptional r = ( types :: Optional (Array PinnableItemType)
                                     , after :: Optional String
                                     , before :: Optional String
                                     , first :: Optional Int
                                     , last :: Optional Int
                                     | r
                                     )

type PinnedItemsInput = { | PinnedItemsInputRowOptional + () }

pinnedItems :: forall r . PinnedItemsInput -> SelectionSet Scope__PinnableItemConnection r -> SelectionSet Scope__Organization r
pinnedItems input = selectionForCompositeField "pinnedItems" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pinnedItemsRemaining :: SelectionSet Scope__Organization Int
pinnedItemsRemaining = selectionForField "pinnedItemsRemaining" [] graphqlDefaultResponseScalarDecoder

type ProjectInputRowRequired r = ( number :: Int
                                 | r
                                 )

type ProjectInput = { | ProjectInputRowRequired + () }

project :: forall r . ProjectInput -> SelectionSet Scope__Project r -> SelectionSet Scope__Organization (Maybe r)
project input = selectionForCompositeField "project" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectsInputRowOptional r = ( orderBy :: Optional ProjectOrder
                                  , search :: Optional String
                                  , states :: Optional (Array ProjectState)
                                  , after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type ProjectsInput = { | ProjectsInputRowOptional + () }

projects :: forall r . ProjectsInput -> SelectionSet Scope__ProjectConnection r -> SelectionSet Scope__Organization r
projects input = selectionForCompositeField "projects" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

projectsResourcePath :: SelectionSet Scope__Organization Uri
projectsResourcePath = selectionForField "projectsResourcePath" [] graphqlDefaultResponseScalarDecoder

projectsUrl :: SelectionSet Scope__Organization Uri
projectsUrl = selectionForField "projectsUrl" [] graphqlDefaultResponseScalarDecoder

type RepositoriesInputRowOptional r = ( privacy :: Optional RepositoryPrivacy
                                      , orderBy :: Optional RepositoryOrder
                                      , affiliations :: Optional (Array (Maybe RepositoryAffiliation))
                                      , ownerAffiliations :: Optional (Array (Maybe RepositoryAffiliation))
                                      , isLocked :: Optional Boolean
                                      , after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      , isFork :: Optional Boolean
                                      | r
                                      )

type RepositoriesInput = { | RepositoriesInputRowOptional + () }

repositories :: forall r . RepositoriesInput -> SelectionSet Scope__RepositoryConnection r -> SelectionSet Scope__Organization r
repositories input = selectionForCompositeField "repositories" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryInputRowRequired r = ( name :: String
                                    | r
                                    )

type RepositoryInput = { | RepositoryInputRowRequired + () }

repository :: forall r . RepositoryInput -> SelectionSet Scope__Repository r -> SelectionSet Scope__Organization (Maybe r)
repository input = selectionForCompositeField "repository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

requiresTwoFactorAuthentication :: SelectionSet Scope__Organization (Maybe Boolean)
requiresTwoFactorAuthentication = selectionForField "requiresTwoFactorAuthentication" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__Organization Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

samlIdentityProvider :: forall r . SelectionSet Scope__OrganizationIdentityProvider r -> SelectionSet Scope__Organization (Maybe r)
samlIdentityProvider = selectionForCompositeField "samlIdentityProvider" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorsListing :: forall r . SelectionSet Scope__SponsorsListing r -> SelectionSet Scope__Organization (Maybe r)
sponsorsListing = selectionForCompositeField "sponsorsListing" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsMaintainerInputRowOptional r = ( after :: Optional String
                                                  , before :: Optional String
                                                  , first :: Optional Int
                                                  , last :: Optional Int
                                                  , includePrivate :: Optional Boolean
                                                  , orderBy :: Optional SponsorshipOrder
                                                  | r
                                                  )

type SponsorshipsAsMaintainerInput = { | SponsorshipsAsMaintainerInputRowOptional + () }

sponsorshipsAsMaintainer :: forall r . SponsorshipsAsMaintainerInput -> SelectionSet Scope__SponsorshipConnection r -> SelectionSet Scope__Organization r
sponsorshipsAsMaintainer input = selectionForCompositeField "sponsorshipsAsMaintainer" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsSponsorInputRowOptional r = ( after :: Optional String
                                               , before :: Optional String
                                               , first :: Optional Int
                                               , last :: Optional Int
                                               , orderBy :: Optional SponsorshipOrder
                                               | r
                                               )

type SponsorshipsAsSponsorInput = { | SponsorshipsAsSponsorInputRowOptional + () }

sponsorshipsAsSponsor :: forall r . SponsorshipsAsSponsorInput -> SelectionSet Scope__SponsorshipConnection r -> SelectionSet Scope__Organization r
sponsorshipsAsSponsor input = selectionForCompositeField "sponsorshipsAsSponsor" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TeamInputRowRequired r = ( slug :: String
                              | r
                              )

type TeamInput = { | TeamInputRowRequired + () }

team :: forall r . TeamInput -> SelectionSet Scope__Team r -> SelectionSet Scope__Organization (Maybe r)
team input = selectionForCompositeField "team" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TeamsInputRowOptional r = ( privacy :: Optional TeamPrivacy
                               , role :: Optional TeamRole
                               , query :: Optional String
                               , userLogins :: Optional (Array String)
                               , orderBy :: Optional TeamOrder
                               , ldapMapped :: Optional Boolean
                               , rootTeamsOnly :: Optional Boolean
                               , after :: Optional String
                               , before :: Optional String
                               , first :: Optional Int
                               , last :: Optional Int
                               | r
                               )

type TeamsInput = { | TeamsInputRowOptional + () }

teams :: forall r . TeamsInput -> SelectionSet Scope__TeamConnection r -> SelectionSet Scope__Organization r
teams input = selectionForCompositeField "teams" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

teamsResourcePath :: SelectionSet Scope__Organization Uri
teamsResourcePath = selectionForField "teamsResourcePath" [] graphqlDefaultResponseScalarDecoder

teamsUrl :: SelectionSet Scope__Organization Uri
teamsUrl = selectionForField "teamsUrl" [] graphqlDefaultResponseScalarDecoder

twitterUsername :: SelectionSet Scope__Organization (Maybe String)
twitterUsername = selectionForField "twitterUsername" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Organization DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Organization Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanAdminister :: SelectionSet Scope__Organization Boolean
viewerCanAdminister = selectionForField "viewerCanAdminister" [] graphqlDefaultResponseScalarDecoder

viewerCanChangePinnedItems :: SelectionSet Scope__Organization Boolean
viewerCanChangePinnedItems = selectionForField "viewerCanChangePinnedItems" [] graphqlDefaultResponseScalarDecoder

viewerCanCreateProjects :: SelectionSet Scope__Organization Boolean
viewerCanCreateProjects = selectionForField "viewerCanCreateProjects" [] graphqlDefaultResponseScalarDecoder

viewerCanCreateRepositories :: SelectionSet Scope__Organization Boolean
viewerCanCreateRepositories = selectionForField "viewerCanCreateRepositories" [] graphqlDefaultResponseScalarDecoder

viewerCanCreateTeams :: SelectionSet Scope__Organization Boolean
viewerCanCreateTeams = selectionForField "viewerCanCreateTeams" [] graphqlDefaultResponseScalarDecoder

viewerIsAMember :: SelectionSet Scope__Organization Boolean
viewerIsAMember = selectionForField "viewerIsAMember" [] graphqlDefaultResponseScalarDecoder

websiteUrl :: SelectionSet Scope__Organization (Maybe Uri)
websiteUrl = selectionForField "websiteUrl" [] graphqlDefaultResponseScalarDecoder
