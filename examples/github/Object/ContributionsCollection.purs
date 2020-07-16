module Examples.Github.Object.ContributionsCollection where

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

type CommitContributionsByRepositoryInputRowOptional r = ( maxRepositories :: Optional Int
                                                         | r
                                                         )

type CommitContributionsByRepositoryInput = { | RefsInputRowOptional + () }

commitContributionsByRepository :: forall r . CommitContributionsByRepositoryInput -> SelectionSet Scope__CommitContributionsByRepository r -> SelectionSet Scope__ContributionsCollection (Array r)
commitContributionsByRepository input = selectionForCompositeField "commitContributionsByRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

contributionCalendar :: forall r . SelectionSet Scope__ContributionCalendar r -> SelectionSet Scope__ContributionsCollection r
contributionCalendar = selectionForCompositeField "contributionCalendar" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

contributionYears :: SelectionSet Scope__ContributionsCollection (Array Int)
contributionYears = selectionForField "contributionYears" [] graphqlDefaultResponseScalarDecoder

doesEndInCurrentMonth :: SelectionSet Scope__ContributionsCollection Boolean
doesEndInCurrentMonth = selectionForField "doesEndInCurrentMonth" [] graphqlDefaultResponseScalarDecoder

earliestRestrictedContributionDate :: SelectionSet Scope__ContributionsCollection (Maybe Date)
earliestRestrictedContributionDate = selectionForField "earliestRestrictedContributionDate" [] graphqlDefaultResponseScalarDecoder

endedAt :: SelectionSet Scope__ContributionsCollection DateTime
endedAt = selectionForField "endedAt" [] graphqlDefaultResponseScalarDecoder

firstIssueContribution :: forall r . SelectionSet Scope__CreatedIssueOrRestrictedContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
firstIssueContribution = selectionForCompositeField "firstIssueContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

firstPullRequestContribution :: forall r . SelectionSet Scope__CreatedPullRequestOrRestrictedContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
firstPullRequestContribution = selectionForCompositeField "firstPullRequestContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

firstRepositoryContribution :: forall r . SelectionSet Scope__CreatedRepositoryOrRestrictedContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
firstRepositoryContribution = selectionForCompositeField "firstRepositoryContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

hasActivityInThePast :: SelectionSet Scope__ContributionsCollection Boolean
hasActivityInThePast = selectionForField "hasActivityInThePast" [] graphqlDefaultResponseScalarDecoder

hasAnyContributions :: SelectionSet Scope__ContributionsCollection Boolean
hasAnyContributions = selectionForField "hasAnyContributions" [] graphqlDefaultResponseScalarDecoder

hasAnyRestrictedContributions :: SelectionSet Scope__ContributionsCollection Boolean
hasAnyRestrictedContributions = selectionForField "hasAnyRestrictedContributions" [] graphqlDefaultResponseScalarDecoder

isSingleDay :: SelectionSet Scope__ContributionsCollection Boolean
isSingleDay = selectionForField "isSingleDay" [] graphqlDefaultResponseScalarDecoder

type IssueContributionsInputRowOptional r = ( after :: Optional String
                                            , before :: Optional String
                                            , first :: Optional Int
                                            , last :: Optional Int
                                            , excludeFirst :: Optional Boolean
                                            , excludePopular :: Optional Boolean
                                            , orderBy :: Optional ContributionOrder
                                            | r
                                            )

type IssueContributionsInput = { | RefsInputRowOptional + () }

issueContributions :: forall r . IssueContributionsInput -> SelectionSet Scope__CreatedIssueContributionConnection r -> SelectionSet Scope__ContributionsCollection r
issueContributions input = selectionForCompositeField "issueContributions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type IssueContributionsByRepositoryInputRowOptional r = ( maxRepositories :: Optional Int
                                                        , excludeFirst :: Optional Boolean
                                                        , excludePopular :: Optional Boolean
                                                        | r
                                                        )

type IssueContributionsByRepositoryInput = { | RefsInputRowOptional + () }

issueContributionsByRepository :: forall r . IssueContributionsByRepositoryInput -> SelectionSet Scope__IssueContributionsByRepository r -> SelectionSet Scope__ContributionsCollection (Array r)
issueContributionsByRepository input = selectionForCompositeField "issueContributionsByRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

joinedGitHubContribution :: forall r . SelectionSet Scope__JoinedGitHubContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
joinedGitHubContribution = selectionForCompositeField "joinedGitHubContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

latestRestrictedContributionDate :: SelectionSet Scope__ContributionsCollection (Maybe Date)
latestRestrictedContributionDate = selectionForField "latestRestrictedContributionDate" [] graphqlDefaultResponseScalarDecoder

mostRecentCollectionWithActivity :: forall r . SelectionSet Scope__ContributionsCollection r -> SelectionSet Scope__ContributionsCollection (Maybe r)
mostRecentCollectionWithActivity = selectionForCompositeField "mostRecentCollectionWithActivity" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mostRecentCollectionWithoutActivity :: forall r . SelectionSet Scope__ContributionsCollection r -> SelectionSet Scope__ContributionsCollection (Maybe r)
mostRecentCollectionWithoutActivity = selectionForCompositeField "mostRecentCollectionWithoutActivity" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

popularIssueContribution :: forall r . SelectionSet Scope__CreatedIssueContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
popularIssueContribution = selectionForCompositeField "popularIssueContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

popularPullRequestContribution :: forall r . SelectionSet Scope__CreatedPullRequestContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
popularPullRequestContribution = selectionForCompositeField "popularPullRequestContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestContributionsInputRowOptional r = ( after :: Optional String
                                                  , before :: Optional String
                                                  , first :: Optional Int
                                                  , last :: Optional Int
                                                  , excludeFirst :: Optional Boolean
                                                  , excludePopular :: Optional Boolean
                                                  , orderBy :: Optional ContributionOrder
                                                  | r
                                                  )

type PullRequestContributionsInput = { | RefsInputRowOptional + () }

pullRequestContributions :: forall r . PullRequestContributionsInput -> SelectionSet Scope__CreatedPullRequestContributionConnection r -> SelectionSet Scope__ContributionsCollection r
pullRequestContributions input = selectionForCompositeField "pullRequestContributions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestContributionsByRepositoryInputRowOptional r = ( maxRepositories :: Optional Int
                                                              , excludeFirst :: Optional Boolean
                                                              , excludePopular :: Optional Boolean
                                                              | r
                                                              )

type PullRequestContributionsByRepositoryInput = { | RefsInputRowOptional + () }

pullRequestContributionsByRepository :: forall r . PullRequestContributionsByRepositoryInput -> SelectionSet Scope__PullRequestContributionsByRepository r -> SelectionSet Scope__ContributionsCollection (Array r)
pullRequestContributionsByRepository input = selectionForCompositeField "pullRequestContributionsByRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestReviewContributionsInputRowOptional r = ( after :: Optional String
                                                        , before :: Optional String
                                                        , first :: Optional Int
                                                        , last :: Optional Int
                                                        , orderBy :: Optional ContributionOrder
                                                        | r
                                                        )

type PullRequestReviewContributionsInput = { | RefsInputRowOptional + () }

pullRequestReviewContributions :: forall r . PullRequestReviewContributionsInput -> SelectionSet Scope__CreatedPullRequestReviewContributionConnection r -> SelectionSet Scope__ContributionsCollection r
pullRequestReviewContributions input = selectionForCompositeField "pullRequestReviewContributions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestReviewContributionsByRepositoryInputRowOptional r = ( maxRepositories :: Optional Int
                                                                    | r
                                                                    )

type PullRequestReviewContributionsByRepositoryInput = { | RefsInputRowOptional + () }

pullRequestReviewContributionsByRepository :: forall r . PullRequestReviewContributionsByRepositoryInput -> SelectionSet Scope__PullRequestReviewContributionsByRepository r -> SelectionSet Scope__ContributionsCollection (Array r)
pullRequestReviewContributionsByRepository input = selectionForCompositeField "pullRequestReviewContributionsByRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryContributionsInputRowOptional r = ( after :: Optional String
                                                 , before :: Optional String
                                                 , first :: Optional Int
                                                 , last :: Optional Int
                                                 , excludeFirst :: Optional Boolean
                                                 , orderBy :: Optional ContributionOrder
                                                 | r
                                                 )

type RepositoryContributionsInput = { | RefsInputRowOptional + () }

repositoryContributions :: forall r . RepositoryContributionsInput -> SelectionSet Scope__CreatedRepositoryContributionConnection r -> SelectionSet Scope__ContributionsCollection r
repositoryContributions input = selectionForCompositeField "repositoryContributions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

restrictedContributionsCount :: SelectionSet Scope__ContributionsCollection Int
restrictedContributionsCount = selectionForField "restrictedContributionsCount" [] graphqlDefaultResponseScalarDecoder

startedAt :: SelectionSet Scope__ContributionsCollection DateTime
startedAt = selectionForField "startedAt" [] graphqlDefaultResponseScalarDecoder

totalCommitContributions :: SelectionSet Scope__ContributionsCollection Int
totalCommitContributions = selectionForField "totalCommitContributions" [] graphqlDefaultResponseScalarDecoder

type TotalIssueContributionsInputRowOptional r = ( excludeFirst :: Optional Boolean
                                                 , excludePopular :: Optional Boolean
                                                 | r
                                                 )

type TotalIssueContributionsInput = { | RefsInputRowOptional + () }

totalIssueContributions :: TotalIssueContributionsInput -> SelectionSet Scope__ContributionsCollection Int
totalIssueContributions input = selectionForField "totalIssueContributions" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

type TotalPullRequestContributionsInputRowOptional r = ( excludeFirst :: Optional Boolean
                                                       , excludePopular :: Optional Boolean
                                                       | r
                                                       )

type TotalPullRequestContributionsInput = { | RefsInputRowOptional + () }

totalPullRequestContributions :: TotalPullRequestContributionsInput -> SelectionSet Scope__ContributionsCollection Int
totalPullRequestContributions input = selectionForField "totalPullRequestContributions" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

totalPullRequestReviewContributions :: SelectionSet Scope__ContributionsCollection Int
totalPullRequestReviewContributions = selectionForField "totalPullRequestReviewContributions" [] graphqlDefaultResponseScalarDecoder

totalRepositoriesWithContributedCommits :: SelectionSet Scope__ContributionsCollection Int
totalRepositoriesWithContributedCommits = selectionForField "totalRepositoriesWithContributedCommits" [] graphqlDefaultResponseScalarDecoder

type TotalRepositoriesWithContributedIssuesInputRowOptional r = ( excludeFirst :: Optional Boolean
                                                                , excludePopular :: Optional Boolean
                                                                | r
                                                                )

type TotalRepositoriesWithContributedIssuesInput = { | RefsInputRowOptional + () }

totalRepositoriesWithContributedIssues :: TotalRepositoriesWithContributedIssuesInput -> SelectionSet Scope__ContributionsCollection Int
totalRepositoriesWithContributedIssues input = selectionForField "totalRepositoriesWithContributedIssues" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

totalRepositoriesWithContributedPullRequestReviews :: SelectionSet Scope__ContributionsCollection Int
totalRepositoriesWithContributedPullRequestReviews = selectionForField "totalRepositoriesWithContributedPullRequestReviews" [] graphqlDefaultResponseScalarDecoder

type TotalRepositoriesWithContributedPullRequestsInputRowOptional r = ( excludeFirst :: Optional Boolean
                                                                      , excludePopular :: Optional Boolean
                                                                      | r
                                                                      )

type TotalRepositoriesWithContributedPullRequestsInput = { | RefsInputRowOptional + () }

totalRepositoriesWithContributedPullRequests :: TotalRepositoriesWithContributedPullRequestsInput -> SelectionSet Scope__ContributionsCollection Int
totalRepositoriesWithContributedPullRequests input = selectionForField "totalRepositoriesWithContributedPullRequests" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

type TotalRepositoryContributionsInputRowOptional r = ( excludeFirst :: Optional Boolean
                                                      | r
                                                      )

type TotalRepositoryContributionsInput = { | RefsInputRowOptional + () }

totalRepositoryContributions :: TotalRepositoryContributionsInput -> SelectionSet Scope__ContributionsCollection Int
totalRepositoryContributions input = selectionForField "totalRepositoryContributions" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__ContributionsCollection r
user = selectionForCompositeField "user" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
