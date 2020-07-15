module Examples.Github.Object.Repository where

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

type AssignableUsersInput = { query :: Optional String
                            , after :: Optional String
                            , before :: Optional String
                            , first :: Optional Int
                            , last :: Optional Int
                            }

assignableUsers :: forall r . AssignableUsersInput -> SelectionSet Scope__UserConnection r -> SelectionSet Scope__Repository r
assignableUsers input = selectionForCompositeField "assignableUsers" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type BranchProtectionRulesInput = { after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  }

branchProtectionRules :: forall r . BranchProtectionRulesInput -> SelectionSet Scope__BranchProtectionRuleConnection r -> SelectionSet Scope__Repository r
branchProtectionRules input = selectionForCompositeField "branchProtectionRules" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

codeOfConduct :: forall r . SelectionSet Scope__CodeOfConduct r -> SelectionSet Scope__Repository (Maybe r)
codeOfConduct = selectionForCompositeField "codeOfConduct" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CollaboratorsInput = { affiliation :: Optional CollaboratorAffiliation
                          , query :: Optional String
                          , after :: Optional String
                          , before :: Optional String
                          , first :: Optional Int
                          , last :: Optional Int
                          }

collaborators :: forall r . CollaboratorsInput -> SelectionSet Scope__RepositoryCollaboratorConnection r -> SelectionSet Scope__Repository (Maybe r)
collaborators input = selectionForCompositeField "collaborators" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CommitCommentsInput = { after :: Optional String
                           , before :: Optional String
                           , first :: Optional Int
                           , last :: Optional Int
                           }

commitComments :: forall r . CommitCommentsInput -> SelectionSet Scope__CommitCommentConnection r -> SelectionSet Scope__Repository r
commitComments input = selectionForCompositeField "commitComments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__Repository DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Repository (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

defaultBranchRef :: forall r . SelectionSet Scope__Ref r -> SelectionSet Scope__Repository (Maybe r)
defaultBranchRef = selectionForCompositeField "defaultBranchRef" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

deleteBranchOnMerge :: SelectionSet Scope__Repository Boolean
deleteBranchOnMerge = selectionForField "deleteBranchOnMerge" [] graphqlDefaultResponseScalarDecoder

type DeployKeysInput = { after :: Optional String
                       , before :: Optional String
                       , first :: Optional Int
                       , last :: Optional Int
                       }

deployKeys :: forall r . DeployKeysInput -> SelectionSet Scope__DeployKeyConnection r -> SelectionSet Scope__Repository r
deployKeys input = selectionForCompositeField "deployKeys" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeploymentsInput = { environments :: Array String
                        , orderBy :: Optional DeploymentOrder
                        , after :: Optional String
                        , before :: Optional String
                        , first :: Optional Int
                        , last :: Optional Int
                        }

deployments :: forall r . DeploymentsInput -> SelectionSet Scope__DeploymentConnection r -> SelectionSet Scope__Repository r
deployments input = selectionForCompositeField "deployments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

description :: SelectionSet Scope__Repository (Maybe String)
description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

descriptionHTML :: SelectionSet Scope__Repository Html
descriptionHTML = selectionForField "descriptionHTML" [] graphqlDefaultResponseScalarDecoder

diskUsage :: SelectionSet Scope__Repository (Maybe Int)
diskUsage = selectionForField "diskUsage" [] graphqlDefaultResponseScalarDecoder

forkCount :: SelectionSet Scope__Repository Int
forkCount = selectionForField "forkCount" [] graphqlDefaultResponseScalarDecoder

type ForksInput = { privacy :: Optional RepositoryPrivacy
                  , orderBy :: Optional RepositoryOrder
                  , affiliations :: Array (Maybe RepositoryAffiliation)
                  , ownerAffiliations :: Array (Maybe RepositoryAffiliation)
                  , isLocked :: Optional Boolean
                  , after :: Optional String
                  , before :: Optional String
                  , first :: Optional Int
                  , last :: Optional Int
                  }

forks :: forall r . ForksInput -> SelectionSet Scope__RepositoryConnection r -> SelectionSet Scope__Repository r
forks input = selectionForCompositeField "forks" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

fundingLinks :: forall r . SelectionSet Scope__FundingLink r -> SelectionSet Scope__Repository (Array r)
fundingLinks = selectionForCompositeField "fundingLinks" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

hasIssuesEnabled :: SelectionSet Scope__Repository Boolean
hasIssuesEnabled = selectionForField "hasIssuesEnabled" [] graphqlDefaultResponseScalarDecoder

hasProjectsEnabled :: SelectionSet Scope__Repository Boolean
hasProjectsEnabled = selectionForField "hasProjectsEnabled" [] graphqlDefaultResponseScalarDecoder

hasWikiEnabled :: SelectionSet Scope__Repository Boolean
hasWikiEnabled = selectionForField "hasWikiEnabled" [] graphqlDefaultResponseScalarDecoder

homepageUrl :: SelectionSet Scope__Repository (Maybe Uri)
homepageUrl = selectionForField "homepageUrl" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Repository Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isArchived :: SelectionSet Scope__Repository Boolean
isArchived = selectionForField "isArchived" [] graphqlDefaultResponseScalarDecoder

isDisabled :: SelectionSet Scope__Repository Boolean
isDisabled = selectionForField "isDisabled" [] graphqlDefaultResponseScalarDecoder

isFork :: SelectionSet Scope__Repository Boolean
isFork = selectionForField "isFork" [] graphqlDefaultResponseScalarDecoder

isLocked :: SelectionSet Scope__Repository Boolean
isLocked = selectionForField "isLocked" [] graphqlDefaultResponseScalarDecoder

isMirror :: SelectionSet Scope__Repository Boolean
isMirror = selectionForField "isMirror" [] graphqlDefaultResponseScalarDecoder

isPrivate :: SelectionSet Scope__Repository Boolean
isPrivate = selectionForField "isPrivate" [] graphqlDefaultResponseScalarDecoder

isTemplate :: SelectionSet Scope__Repository Boolean
isTemplate = selectionForField "isTemplate" [] graphqlDefaultResponseScalarDecoder

type IssueInput = { number :: Int
                  }

issue :: forall r . IssueInput -> SelectionSet Scope__Issue r -> SelectionSet Scope__Repository (Maybe r)
issue input = selectionForCompositeField "issue" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type IssueOrPullRequestInput = { number :: Int
                               }

issueOrPullRequest :: forall r . IssueOrPullRequestInput -> SelectionSet Scope__IssueOrPullRequest r -> SelectionSet Scope__Repository (Maybe r)
issueOrPullRequest input = selectionForCompositeField "issueOrPullRequest" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type IssuesInput = { orderBy :: Optional IssueOrder
                   , labels :: Array String
                   , states :: Array IssueState
                   , filterBy :: Optional IssueFilters
                   , after :: Optional String
                   , before :: Optional String
                   , first :: Optional Int
                   , last :: Optional Int
                   }

issues :: forall r . IssuesInput -> SelectionSet Scope__IssueConnection r -> SelectionSet Scope__Repository r
issues input = selectionForCompositeField "issues" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LabelInput = { name :: String
                  }

label :: forall r . LabelInput -> SelectionSet Scope__Label r -> SelectionSet Scope__Repository (Maybe r)
label input = selectionForCompositeField "label" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LabelsInput = { orderBy :: Optional LabelOrder
                   , after :: Optional String
                   , before :: Optional String
                   , first :: Optional Int
                   , last :: Optional Int
                   , query :: Optional String
                   }

labels :: forall r . LabelsInput -> SelectionSet Scope__LabelConnection r -> SelectionSet Scope__Repository (Maybe r)
labels input = selectionForCompositeField "labels" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LanguagesInput = { after :: Optional String
                      , before :: Optional String
                      , first :: Optional Int
                      , last :: Optional Int
                      , orderBy :: Optional LanguageOrder
                      }

languages :: forall r . LanguagesInput -> SelectionSet Scope__LanguageConnection r -> SelectionSet Scope__Repository (Maybe r)
languages input = selectionForCompositeField "languages" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

licenseInfo :: forall r . SelectionSet Scope__License r -> SelectionSet Scope__Repository (Maybe r)
licenseInfo = selectionForCompositeField "licenseInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

lockReason :: SelectionSet Scope__Repository (Maybe RepositoryLockReason)
lockReason = selectionForField "lockReason" [] graphqlDefaultResponseScalarDecoder

type MentionableUsersInput = { query :: Optional String
                             , after :: Optional String
                             , before :: Optional String
                             , first :: Optional Int
                             , last :: Optional Int
                             }

mentionableUsers :: forall r . MentionableUsersInput -> SelectionSet Scope__UserConnection r -> SelectionSet Scope__Repository r
mentionableUsers input = selectionForCompositeField "mentionableUsers" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mergeCommitAllowed :: SelectionSet Scope__Repository Boolean
mergeCommitAllowed = selectionForField "mergeCommitAllowed" [] graphqlDefaultResponseScalarDecoder

type MilestoneInput = { number :: Int
                      }

milestone :: forall r . MilestoneInput -> SelectionSet Scope__Milestone r -> SelectionSet Scope__Repository (Maybe r)
milestone input = selectionForCompositeField "milestone" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MilestonesInput = { after :: Optional String
                       , before :: Optional String
                       , first :: Optional Int
                       , last :: Optional Int
                       , states :: Array MilestoneState
                       , orderBy :: Optional MilestoneOrder
                       }

milestones :: forall r . MilestonesInput -> SelectionSet Scope__MilestoneConnection r -> SelectionSet Scope__Repository (Maybe r)
milestones input = selectionForCompositeField "milestones" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mirrorUrl :: SelectionSet Scope__Repository (Maybe Uri)
mirrorUrl = selectionForField "mirrorUrl" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Repository String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

nameWithOwner :: SelectionSet Scope__Repository String
nameWithOwner = selectionForField "nameWithOwner" [] graphqlDefaultResponseScalarDecoder

type ObjectInput = { oid :: Optional GitObjectId
                   , expression :: Optional String
                   }

object :: forall r . ObjectInput -> SelectionSet Scope__GitObject r -> SelectionSet Scope__Repository (Maybe r)
object input = selectionForCompositeField "object" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

openGraphImageUrl :: SelectionSet Scope__Repository Uri
openGraphImageUrl = selectionForField "openGraphImageUrl" [] graphqlDefaultResponseScalarDecoder

owner :: forall r . SelectionSet Scope__RepositoryOwner r -> SelectionSet Scope__Repository r
owner = selectionForCompositeField "owner" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PackagesInput = { after :: Optional String
                     , before :: Optional String
                     , first :: Optional Int
                     , last :: Optional Int
                     , names :: Array (Maybe String)
                     , repositoryId :: Optional Id
                     , packageType :: Optional PackageType
                     , orderBy :: Optional PackageOrder
                     }

packages :: forall r . PackagesInput -> SelectionSet Scope__PackageConnection r -> SelectionSet Scope__Repository r
packages input = selectionForCompositeField "packages" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

parent :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__Repository (Maybe r)
parent = selectionForCompositeField "parent" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

primaryLanguage :: forall r . SelectionSet Scope__Language r -> SelectionSet Scope__Repository (Maybe r)
primaryLanguage = selectionForCompositeField "primaryLanguage" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectInput = { number :: Int
                    }

project :: forall r . ProjectInput -> SelectionSet Scope__Project r -> SelectionSet Scope__Repository (Maybe r)
project input = selectionForCompositeField "project" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectsInput = { orderBy :: Optional ProjectOrder
                     , search :: Optional String
                     , states :: Array ProjectState
                     , after :: Optional String
                     , before :: Optional String
                     , first :: Optional Int
                     , last :: Optional Int
                     }

projects :: forall r . ProjectsInput -> SelectionSet Scope__ProjectConnection r -> SelectionSet Scope__Repository r
projects input = selectionForCompositeField "projects" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

projectsResourcePath :: SelectionSet Scope__Repository Uri
projectsResourcePath = selectionForField "projectsResourcePath" [] graphqlDefaultResponseScalarDecoder

projectsUrl :: SelectionSet Scope__Repository Uri
projectsUrl = selectionForField "projectsUrl" [] graphqlDefaultResponseScalarDecoder

type PullRequestInput = { number :: Int
                        }

pullRequest :: forall r . PullRequestInput -> SelectionSet Scope__PullRequest r -> SelectionSet Scope__Repository (Maybe r)
pullRequest input = selectionForCompositeField "pullRequest" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestsInput = { states :: Array PullRequestState
                         , labels :: Array String
                         , headRefName :: Optional String
                         , baseRefName :: Optional String
                         , orderBy :: Optional IssueOrder
                         , after :: Optional String
                         , before :: Optional String
                         , first :: Optional Int
                         , last :: Optional Int
                         }

pullRequests :: forall r . PullRequestsInput -> SelectionSet Scope__PullRequestConnection r -> SelectionSet Scope__Repository r
pullRequests input = selectionForCompositeField "pullRequests" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pushedAt :: SelectionSet Scope__Repository (Maybe DateTime)
pushedAt = selectionForField "pushedAt" [] graphqlDefaultResponseScalarDecoder

rebaseMergeAllowed :: SelectionSet Scope__Repository Boolean
rebaseMergeAllowed = selectionForField "rebaseMergeAllowed" [] graphqlDefaultResponseScalarDecoder

type RefInput = { qualifiedName :: String
                }

ref :: forall r . RefInput -> SelectionSet Scope__Ref r -> SelectionSet Scope__Repository (Maybe r)
ref input = selectionForCompositeField "ref" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RefsInput = { query :: Optional String
                 , after :: Optional String
                 , before :: Optional String
                 , first :: Optional Int
                 , last :: Optional Int
                 , refPrefix :: String
                 , direction :: Optional OrderDirection
                 , orderBy :: Optional RefOrder
                 }

refs :: forall r . RefsInput -> SelectionSet Scope__RefConnection r -> SelectionSet Scope__Repository (Maybe r)
refs input = selectionForCompositeField "refs" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReleaseInput = { tagName :: String
                    }

release :: forall r . ReleaseInput -> SelectionSet Scope__Release r -> SelectionSet Scope__Repository (Maybe r)
release input = selectionForCompositeField "release" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReleasesInput = { after :: Optional String
                     , before :: Optional String
                     , first :: Optional Int
                     , last :: Optional Int
                     , orderBy :: Optional ReleaseOrder
                     }

releases :: forall r . ReleasesInput -> SelectionSet Scope__ReleaseConnection r -> SelectionSet Scope__Repository r
releases input = selectionForCompositeField "releases" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryTopicsInput = { after :: Optional String
                             , before :: Optional String
                             , first :: Optional Int
                             , last :: Optional Int
                             }

repositoryTopics :: forall r . RepositoryTopicsInput -> SelectionSet Scope__RepositoryTopicConnection r -> SelectionSet Scope__Repository r
repositoryTopics input = selectionForCompositeField "repositoryTopics" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Repository Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

type ShortDescriptionHtmlInput = { limit :: Optional Int
                                 }

shortDescriptionHTML :: ShortDescriptionHtmlInput -> SelectionSet Scope__Repository Html
shortDescriptionHTML input = selectionForField "shortDescriptionHTML" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

squashMergeAllowed :: SelectionSet Scope__Repository Boolean
squashMergeAllowed = selectionForField "squashMergeAllowed" [] graphqlDefaultResponseScalarDecoder

sshUrl :: SelectionSet Scope__Repository GitSshRemote
sshUrl = selectionForField "sshUrl" [] graphqlDefaultResponseScalarDecoder

type StargazersInput = { after :: Optional String
                       , before :: Optional String
                       , first :: Optional Int
                       , last :: Optional Int
                       , orderBy :: Optional StarOrder
                       }

stargazers :: forall r . StargazersInput -> SelectionSet Scope__StargazerConnection r -> SelectionSet Scope__Repository r
stargazers input = selectionForCompositeField "stargazers" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SubmodulesInput = { after :: Optional String
                       , before :: Optional String
                       , first :: Optional Int
                       , last :: Optional Int
                       }

submodules :: forall r . SubmodulesInput -> SelectionSet Scope__SubmoduleConnection r -> SelectionSet Scope__Repository r
submodules input = selectionForCompositeField "submodules" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

tempCloneToken :: SelectionSet Scope__Repository (Maybe String)
tempCloneToken = selectionForField "tempCloneToken" [] graphqlDefaultResponseScalarDecoder

templateRepository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__Repository (Maybe r)
templateRepository = selectionForCompositeField "templateRepository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

updatedAt :: SelectionSet Scope__Repository DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Repository Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

usesCustomOpenGraphImage :: SelectionSet Scope__Repository Boolean
usesCustomOpenGraphImage = selectionForField "usesCustomOpenGraphImage" [] graphqlDefaultResponseScalarDecoder

viewerCanAdminister :: SelectionSet Scope__Repository Boolean
viewerCanAdminister = selectionForField "viewerCanAdminister" [] graphqlDefaultResponseScalarDecoder

viewerCanCreateProjects :: SelectionSet Scope__Repository Boolean
viewerCanCreateProjects = selectionForField "viewerCanCreateProjects" [] graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__Repository Boolean
viewerCanSubscribe = selectionForField "viewerCanSubscribe" [] graphqlDefaultResponseScalarDecoder

viewerCanUpdateTopics :: SelectionSet Scope__Repository Boolean
viewerCanUpdateTopics = selectionForField "viewerCanUpdateTopics" [] graphqlDefaultResponseScalarDecoder

viewerHasStarred :: SelectionSet Scope__Repository Boolean
viewerHasStarred = selectionForField "viewerHasStarred" [] graphqlDefaultResponseScalarDecoder

viewerPermission :: SelectionSet Scope__Repository (Maybe RepositoryPermission)
viewerPermission = selectionForField "viewerPermission" [] graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__Repository (Maybe SubscriptionState)
viewerSubscription = selectionForField "viewerSubscription" [] graphqlDefaultResponseScalarDecoder

type VulnerabilityAlertsInput = { after :: Optional String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                }

vulnerabilityAlerts :: forall r . VulnerabilityAlertsInput -> SelectionSet Scope__RepositoryVulnerabilityAlertConnection r -> SelectionSet Scope__Repository (Maybe r)
vulnerabilityAlerts input = selectionForCompositeField "vulnerabilityAlerts" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type WatchersInput = { after :: Optional String
                     , before :: Optional String
                     , first :: Optional Int
                     , last :: Optional Int
                     }

watchers :: forall r . WatchersInput -> SelectionSet Scope__UserConnection r -> SelectionSet Scope__Repository r
watchers input = selectionForCompositeField "watchers" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer
