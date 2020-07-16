module Examples.Github.Object.User where

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

type AnyPinnableItemsInputRowOptional r = ( type_ :: Optional PinnableItemType
                                          | r
                                          )

type AnyPinnableItemsInput = { | RefsInputRowOptional + () }

anyPinnableItems :: AnyPinnableItemsInput -> SelectionSet Scope__User Boolean
anyPinnableItems input = selectionForField "anyPinnableItems" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

type AvatarUrlInputRowOptional r = ( size :: Optional Int
                                   | r
                                   )

type AvatarUrlInput = { | RefsInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__User Uri
avatarUrl input = selectionForField "avatarUrl" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

bio :: SelectionSet Scope__User (Maybe String)
bio = selectionForField "bio" [] graphqlDefaultResponseScalarDecoder

bioHTML :: SelectionSet Scope__User Html
bioHTML = selectionForField "bioHTML" [] graphqlDefaultResponseScalarDecoder

type CommitCommentsInputRowOptional r = ( after :: Optional String
                                        , before :: Optional String
                                        , first :: Optional Int
                                        , last :: Optional Int
                                        | r
                                        )

type CommitCommentsInput = { | RefsInputRowOptional + () }

commitComments :: forall r . CommitCommentsInput -> SelectionSet Scope__CommitCommentConnection r -> SelectionSet Scope__User r
commitComments input = selectionForCompositeField "commitComments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

company :: SelectionSet Scope__User (Maybe String)
company = selectionForField "company" [] graphqlDefaultResponseScalarDecoder

companyHTML :: SelectionSet Scope__User Html
companyHTML = selectionForField "companyHTML" [] graphqlDefaultResponseScalarDecoder

type ContributionsCollectionInputRowOptional r = ( organizationID :: Optional Id
                                                 , from :: Optional DateTime
                                                 , to :: Optional DateTime
                                                 | r
                                                 )

type ContributionsCollectionInput = { | RefsInputRowOptional + () }

contributionsCollection :: forall r . ContributionsCollectionInput -> SelectionSet Scope__ContributionsCollection r -> SelectionSet Scope__User r
contributionsCollection input = selectionForCompositeField "contributionsCollection" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__User DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__User (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

email :: SelectionSet Scope__User String
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

type FollowersInputRowOptional r = ( after :: Optional String
                                   , before :: Optional String
                                   , first :: Optional Int
                                   , last :: Optional Int
                                   | r
                                   )

type FollowersInput = { | RefsInputRowOptional + () }

followers :: forall r . FollowersInput -> SelectionSet Scope__FollowerConnection r -> SelectionSet Scope__User r
followers input = selectionForCompositeField "followers" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type FollowingInputRowOptional r = ( after :: Optional String
                                   , before :: Optional String
                                   , first :: Optional Int
                                   , last :: Optional Int
                                   | r
                                   )

type FollowingInput = { | RefsInputRowOptional + () }

following :: forall r . FollowingInput -> SelectionSet Scope__FollowingConnection r -> SelectionSet Scope__User r
following input = selectionForCompositeField "following" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GistInputRowRequired r = ( name :: String
                              | r
                              )

type GistInput = { | RefsInputRowRequired + () }

gist :: forall r . GistInput -> SelectionSet Scope__Gist r -> SelectionSet Scope__User (Maybe r)
gist input = selectionForCompositeField "gist" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GistCommentsInputRowOptional r = ( after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type GistCommentsInput = { | RefsInputRowOptional + () }

gistComments :: forall r . GistCommentsInput -> SelectionSet Scope__GistCommentConnection r -> SelectionSet Scope__User r
gistComments input = selectionForCompositeField "gistComments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GistsInputRowOptional r = ( privacy :: Optional GistPrivacy
                               , orderBy :: Optional GistOrder
                               , after :: Optional String
                               , before :: Optional String
                               , first :: Optional Int
                               , last :: Optional Int
                               | r
                               )

type GistsInput = { | RefsInputRowOptional + () }

gists :: forall r . GistsInput -> SelectionSet Scope__GistConnection r -> SelectionSet Scope__User r
gists input = selectionForCompositeField "gists" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HovercardInputRowOptional r = ( primarySubjectId :: Optional Id
                                   | r
                                   )

type HovercardInput = { | RefsInputRowOptional + () }

hovercard :: forall r . HovercardInput -> SelectionSet Scope__Hovercard r -> SelectionSet Scope__User r
hovercard input = selectionForCompositeField "hovercard" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__User Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isBountyHunter :: SelectionSet Scope__User Boolean
isBountyHunter = selectionForField "isBountyHunter" [] graphqlDefaultResponseScalarDecoder

isCampusExpert :: SelectionSet Scope__User Boolean
isCampusExpert = selectionForField "isCampusExpert" [] graphqlDefaultResponseScalarDecoder

isDeveloperProgramMember :: SelectionSet Scope__User Boolean
isDeveloperProgramMember = selectionForField "isDeveloperProgramMember" [] graphqlDefaultResponseScalarDecoder

isEmployee :: SelectionSet Scope__User Boolean
isEmployee = selectionForField "isEmployee" [] graphqlDefaultResponseScalarDecoder

isHireable :: SelectionSet Scope__User Boolean
isHireable = selectionForField "isHireable" [] graphqlDefaultResponseScalarDecoder

isSiteAdmin :: SelectionSet Scope__User Boolean
isSiteAdmin = selectionForField "isSiteAdmin" [] graphqlDefaultResponseScalarDecoder

isViewer :: SelectionSet Scope__User Boolean
isViewer = selectionForField "isViewer" [] graphqlDefaultResponseScalarDecoder

type IssueCommentsInputRowOptional r = ( after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type IssueCommentsInput = { | RefsInputRowOptional + () }

issueComments :: forall r . IssueCommentsInput -> SelectionSet Scope__IssueCommentConnection r -> SelectionSet Scope__User r
issueComments input = selectionForCompositeField "issueComments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type IssuesInputRowOptional r = ( orderBy :: Optional IssueOrder
                                , labels :: Optional (Array String)
                                , states :: Optional (Array IssueState)
                                , filterBy :: Optional IssueFilters
                                , after :: Optional String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                | r
                                )

type IssuesInput = { | RefsInputRowOptional + () }

issues :: forall r . IssuesInput -> SelectionSet Scope__IssueConnection r -> SelectionSet Scope__User r
issues input = selectionForCompositeField "issues" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

itemShowcase :: forall r . SelectionSet Scope__ProfileItemShowcase r -> SelectionSet Scope__User r
itemShowcase = selectionForCompositeField "itemShowcase" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

location :: SelectionSet Scope__User (Maybe String)
location = selectionForField "location" [] graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__User String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__User (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type OrganizationInputRowRequired r = ( login :: String
                                      | r
                                      )

type OrganizationInput = { | RefsInputRowRequired + () }

organization :: forall r . OrganizationInput -> SelectionSet Scope__Organization r -> SelectionSet Scope__User (Maybe r)
organization input = selectionForCompositeField "organization" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type OrganizationVerifiedDomainEmailsInputRowRequired r = ( login :: String
                                                          | r
                                                          )

type OrganizationVerifiedDomainEmailsInput = { | RefsInputRowRequired + () }

organizationVerifiedDomainEmails :: OrganizationVerifiedDomainEmailsInput -> SelectionSet Scope__User (Array String)
organizationVerifiedDomainEmails input = selectionForField "organizationVerifiedDomainEmails" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

type OrganizationsInputRowOptional r = ( after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type OrganizationsInput = { | RefsInputRowOptional + () }

organizations :: forall r . OrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__User r
organizations input = selectionForCompositeField "organizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

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

type PackagesInput = { | RefsInputRowOptional + () }

packages :: forall r . PackagesInput -> SelectionSet Scope__PackageConnection r -> SelectionSet Scope__User r
packages input = selectionForCompositeField "packages" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinnableItemsInputRowOptional r = ( types :: Optional (Array PinnableItemType)
                                       , after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type PinnableItemsInput = { | RefsInputRowOptional + () }

pinnableItems :: forall r . PinnableItemsInput -> SelectionSet Scope__PinnableItemConnection r -> SelectionSet Scope__User r
pinnableItems input = selectionForCompositeField "pinnableItems" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinnedItemsInputRowOptional r = ( types :: Optional (Array PinnableItemType)
                                     , after :: Optional String
                                     , before :: Optional String
                                     , first :: Optional Int
                                     , last :: Optional Int
                                     | r
                                     )

type PinnedItemsInput = { | RefsInputRowOptional + () }

pinnedItems :: forall r . PinnedItemsInput -> SelectionSet Scope__PinnableItemConnection r -> SelectionSet Scope__User r
pinnedItems input = selectionForCompositeField "pinnedItems" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pinnedItemsRemaining :: SelectionSet Scope__User Int
pinnedItemsRemaining = selectionForField "pinnedItemsRemaining" [] graphqlDefaultResponseScalarDecoder

type ProjectInputRowRequired r = ( number :: Int
                                 | r
                                 )

type ProjectInput = { | RefsInputRowRequired + () }

project :: forall r . ProjectInput -> SelectionSet Scope__Project r -> SelectionSet Scope__User (Maybe r)
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

type ProjectsInput = { | RefsInputRowOptional + () }

projects :: forall r . ProjectsInput -> SelectionSet Scope__ProjectConnection r -> SelectionSet Scope__User r
projects input = selectionForCompositeField "projects" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

projectsResourcePath :: SelectionSet Scope__User Uri
projectsResourcePath = selectionForField "projectsResourcePath" [] graphqlDefaultResponseScalarDecoder

projectsUrl :: SelectionSet Scope__User Uri
projectsUrl = selectionForField "projectsUrl" [] graphqlDefaultResponseScalarDecoder

type PublicKeysInputRowOptional r = ( after :: Optional String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    | r
                                    )

type PublicKeysInput = { | RefsInputRowOptional + () }

publicKeys :: forall r . PublicKeysInput -> SelectionSet Scope__PublicKeyConnection r -> SelectionSet Scope__User r
publicKeys input = selectionForCompositeField "publicKeys" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestsInputRowOptional r = ( states :: Optional (Array PullRequestState)
                                      , labels :: Optional (Array String)
                                      , headRefName :: Optional String
                                      , baseRefName :: Optional String
                                      , orderBy :: Optional IssueOrder
                                      , after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type PullRequestsInput = { | RefsInputRowOptional + () }

pullRequests :: forall r . PullRequestsInput -> SelectionSet Scope__PullRequestConnection r -> SelectionSet Scope__User r
pullRequests input = selectionForCompositeField "pullRequests" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

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

type RepositoriesInput = { | RefsInputRowOptional + () }

repositories :: forall r . RepositoriesInput -> SelectionSet Scope__RepositoryConnection r -> SelectionSet Scope__User r
repositories input = selectionForCompositeField "repositories" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoriesContributedToInputRowOptional r = ( privacy :: Optional RepositoryPrivacy
                                                   , orderBy :: Optional RepositoryOrder
                                                   , isLocked :: Optional Boolean
                                                   , includeUserRepositories :: Optional Boolean
                                                   , contributionTypes :: Optional (Array (Maybe RepositoryContributionType))
                                                   , after :: Optional String
                                                   , before :: Optional String
                                                   , first :: Optional Int
                                                   , last :: Optional Int
                                                   | r
                                                   )

type RepositoriesContributedToInput = { | RefsInputRowOptional + () }

repositoriesContributedTo :: forall r . RepositoriesContributedToInput -> SelectionSet Scope__RepositoryConnection r -> SelectionSet Scope__User r
repositoriesContributedTo input = selectionForCompositeField "repositoriesContributedTo" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryInputRowRequired r = ( name :: String
                                    | r
                                    )

type RepositoryInput = { | RefsInputRowRequired + () }

repository :: forall r . RepositoryInput -> SelectionSet Scope__Repository r -> SelectionSet Scope__User (Maybe r)
repository input = selectionForCompositeField "repository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__User Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

type SavedRepliesInputRowOptional r = ( after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      , orderBy :: Optional SavedReplyOrder
                                      | r
                                      )

type SavedRepliesInput = { | RefsInputRowOptional + () }

savedReplies :: forall r . SavedRepliesInput -> SelectionSet Scope__SavedReplyConnection r -> SelectionSet Scope__User (Maybe r)
savedReplies input = selectionForCompositeField "savedReplies" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorsListing :: forall r . SelectionSet Scope__SponsorsListing r -> SelectionSet Scope__User (Maybe r)
sponsorsListing = selectionForCompositeField "sponsorsListing" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsMaintainerInputRowOptional r = ( after :: Optional String
                                                  , before :: Optional String
                                                  , first :: Optional Int
                                                  , last :: Optional Int
                                                  , includePrivate :: Optional Boolean
                                                  , orderBy :: Optional SponsorshipOrder
                                                  | r
                                                  )

type SponsorshipsAsMaintainerInput = { | RefsInputRowOptional + () }

sponsorshipsAsMaintainer :: forall r . SponsorshipsAsMaintainerInput -> SelectionSet Scope__SponsorshipConnection r -> SelectionSet Scope__User r
sponsorshipsAsMaintainer input = selectionForCompositeField "sponsorshipsAsMaintainer" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsSponsorInputRowOptional r = ( after :: Optional String
                                               , before :: Optional String
                                               , first :: Optional Int
                                               , last :: Optional Int
                                               , orderBy :: Optional SponsorshipOrder
                                               | r
                                               )

type SponsorshipsAsSponsorInput = { | RefsInputRowOptional + () }

sponsorshipsAsSponsor :: forall r . SponsorshipsAsSponsorInput -> SelectionSet Scope__SponsorshipConnection r -> SelectionSet Scope__User r
sponsorshipsAsSponsor input = selectionForCompositeField "sponsorshipsAsSponsor" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type StarredRepositoriesInputRowOptional r = ( after :: Optional String
                                             , before :: Optional String
                                             , first :: Optional Int
                                             , last :: Optional Int
                                             , ownedByViewer :: Optional Boolean
                                             , orderBy :: Optional StarOrder
                                             | r
                                             )

type StarredRepositoriesInput = { | RefsInputRowOptional + () }

starredRepositories :: forall r . StarredRepositoriesInput -> SelectionSet Scope__StarredRepositoryConnection r -> SelectionSet Scope__User r
starredRepositories input = selectionForCompositeField "starredRepositories" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

status :: forall r . SelectionSet Scope__UserStatus r -> SelectionSet Scope__User (Maybe r)
status = selectionForCompositeField "status" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TopRepositoriesInputRowOptional r = ( after :: Optional String
                                         , before :: Optional String
                                         , first :: Optional Int
                                         , last :: Optional Int
                                         , since :: Optional DateTime
                                         | r
                                         )

type TopRepositoriesInputRowRequired r = ( orderBy :: RepositoryOrder
                                         | r
                                         )

type TopRepositoriesInput = { | RefsInputRowRequired + RefsInputRowRequired + () }

topRepositories :: forall r . TopRepositoriesInput -> SelectionSet Scope__RepositoryConnection r -> SelectionSet Scope__User r
topRepositories input = selectionForCompositeField "topRepositories" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

twitterUsername :: SelectionSet Scope__User (Maybe String)
twitterUsername = selectionForField "twitterUsername" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__User DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__User Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanChangePinnedItems :: SelectionSet Scope__User Boolean
viewerCanChangePinnedItems = selectionForField "viewerCanChangePinnedItems" [] graphqlDefaultResponseScalarDecoder

viewerCanCreateProjects :: SelectionSet Scope__User Boolean
viewerCanCreateProjects = selectionForField "viewerCanCreateProjects" [] graphqlDefaultResponseScalarDecoder

viewerCanFollow :: SelectionSet Scope__User Boolean
viewerCanFollow = selectionForField "viewerCanFollow" [] graphqlDefaultResponseScalarDecoder

viewerIsFollowing :: SelectionSet Scope__User Boolean
viewerIsFollowing = selectionForField "viewerIsFollowing" [] graphqlDefaultResponseScalarDecoder

type WatchingInputRowOptional r = ( privacy :: Optional RepositoryPrivacy
                                  , orderBy :: Optional RepositoryOrder
                                  , affiliations :: Optional (Array (Maybe RepositoryAffiliation))
                                  , ownerAffiliations :: Optional (Array (Maybe RepositoryAffiliation))
                                  , isLocked :: Optional Boolean
                                  , after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type WatchingInput = { | RefsInputRowOptional + () }

watching :: forall r . WatchingInput -> SelectionSet Scope__RepositoryConnection r -> SelectionSet Scope__User r
watching input = selectionForCompositeField "watching" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

websiteUrl :: SelectionSet Scope__User (Maybe Uri)
websiteUrl = selectionForField "websiteUrl" [] graphqlDefaultResponseScalarDecoder
