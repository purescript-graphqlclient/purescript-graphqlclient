module Examples.Github.Query where

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

type CodeOfConductInput = { key :: String
                          }

codeOfConduct :: forall r . CodeOfConductInput -> SelectionSet Scope__CodeOfConduct r -> SelectionSet Scope__RootQuery (Maybe r)
codeOfConduct input = selectionForCompositeField "codeOfConduct" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

codesOfConduct :: forall r . SelectionSet Scope__CodeOfConduct r -> SelectionSet Scope__RootQuery (Array (Maybe r))
codesOfConduct = selectionForCompositeField "codesOfConduct" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type EnterpriseInput = { slug :: String
                       , invitationToken :: Optional String
                       }

enterprise :: forall r . EnterpriseInput -> SelectionSet Scope__Enterprise r -> SelectionSet Scope__RootQuery (Maybe r)
enterprise input = selectionForCompositeField "enterprise" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type EnterpriseAdministratorInvitationInput = { userLogin :: String
                                              , enterpriseSlug :: String
                                              , role :: EnterpriseAdministratorRole
                                              }

enterpriseAdministratorInvitation :: forall r . EnterpriseAdministratorInvitationInput -> SelectionSet Scope__EnterpriseAdministratorInvitation r -> SelectionSet Scope__RootQuery (Maybe r)
enterpriseAdministratorInvitation input = selectionForCompositeField "enterpriseAdministratorInvitation" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type EnterpriseAdministratorInvitationByTokenInput = { invitationToken :: String
                                                     }

enterpriseAdministratorInvitationByToken :: forall r . EnterpriseAdministratorInvitationByTokenInput -> SelectionSet Scope__EnterpriseAdministratorInvitation r -> SelectionSet Scope__RootQuery (Maybe r)
enterpriseAdministratorInvitationByToken input = selectionForCompositeField "enterpriseAdministratorInvitationByToken" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LicenseInput = { key :: String
                    }

license :: forall r . LicenseInput -> SelectionSet Scope__License r -> SelectionSet Scope__RootQuery (Maybe r)
license input = selectionForCompositeField "license" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

licenses :: forall r . SelectionSet Scope__License r -> SelectionSet Scope__RootQuery (Array (Maybe r))
licenses = selectionForCompositeField "licenses" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarketplaceCategoriesInput = { includeCategories :: Array String
                                  , excludeEmpty :: Optional Boolean
                                  , excludeSubcategories :: Optional Boolean
                                  }

marketplaceCategories :: forall r . MarketplaceCategoriesInput -> SelectionSet Scope__MarketplaceCategory r -> SelectionSet Scope__RootQuery (Array r)
marketplaceCategories input = selectionForCompositeField "marketplaceCategories" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarketplaceCategoryInput = { slug :: String
                                , useTopicAliases :: Optional Boolean
                                }

marketplaceCategory :: forall r . MarketplaceCategoryInput -> SelectionSet Scope__MarketplaceCategory r -> SelectionSet Scope__RootQuery (Maybe r)
marketplaceCategory input = selectionForCompositeField "marketplaceCategory" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarketplaceListingInput = { slug :: String
                               }

marketplaceListing :: forall r . MarketplaceListingInput -> SelectionSet Scope__MarketplaceListing r -> SelectionSet Scope__RootQuery (Maybe r)
marketplaceListing input = selectionForCompositeField "marketplaceListing" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarketplaceListingsInput = { after :: Optional String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                , categorySlug :: Optional String
                                , useTopicAliases :: Optional Boolean
                                , viewerCanAdmin :: Optional Boolean
                                , adminId :: Optional Id
                                , organizationId :: Optional Id
                                , allStates :: Optional Boolean
                                , slugs :: Array (Maybe String)
                                , primaryCategoryOnly :: Optional Boolean
                                , withFreeTrialsOnly :: Optional Boolean
                                }

marketplaceListings :: forall r . MarketplaceListingsInput -> SelectionSet Scope__MarketplaceListingConnection r -> SelectionSet Scope__RootQuery r
marketplaceListings input = selectionForCompositeField "marketplaceListings" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

meta :: forall r . SelectionSet Scope__GitHubMetadata r -> SelectionSet Scope__RootQuery r
meta = selectionForCompositeField "meta" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type NodeInput = { id :: Id
                 }

node :: forall r . NodeInput -> SelectionSet Scope__Node r -> SelectionSet Scope__RootQuery (Maybe r)
node input = selectionForCompositeField "node" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type NodesInput = { ids :: Array Id
                  }

nodes :: forall r . NodesInput -> SelectionSet Scope__Node r -> SelectionSet Scope__RootQuery (Array (Maybe r))
nodes input = selectionForCompositeField "nodes" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type OrganizationInput = { login :: String
                         }

organization :: forall r . OrganizationInput -> SelectionSet Scope__Organization r -> SelectionSet Scope__RootQuery (Maybe r)
organization input = selectionForCompositeField "organization" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RateLimitInput = { dryRun :: Optional Boolean
                      }

rateLimit :: forall r . RateLimitInput -> SelectionSet Scope__RateLimit r -> SelectionSet Scope__RootQuery (Maybe r)
rateLimit input = selectionForCompositeField "rateLimit" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

relay :: forall r . SelectionSet Scope__RootQuery r -> SelectionSet Scope__RootQuery r
relay = selectionForCompositeField "relay" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryInput = { owner :: String
                       , name :: String
                       }

repository :: forall r . RepositoryInput -> SelectionSet Scope__Repository r -> SelectionSet Scope__RootQuery (Maybe r)
repository input = selectionForCompositeField "repository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryOwnerInput = { login :: String
                            }

repositoryOwner :: forall r . RepositoryOwnerInput -> SelectionSet Scope__RepositoryOwner r -> SelectionSet Scope__RootQuery (Maybe r)
repositoryOwner input = selectionForCompositeField "repositoryOwner" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ResourceInput = { url :: Uri
                     }

resource :: forall r . ResourceInput -> SelectionSet Scope__UniformResourceLocatable r -> SelectionSet Scope__RootQuery (Maybe r)
resource input = selectionForCompositeField "resource" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SearchInput = { after :: Optional String
                   , before :: Optional String
                   , first :: Optional Int
                   , last :: Optional Int
                   , query :: String
                   , type_ :: SearchType
                   }

search :: forall r . SearchInput -> SelectionSet Scope__SearchResultItemConnection r -> SelectionSet Scope__RootQuery r
search input = selectionForCompositeField "search" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SecurityAdvisoriesInput = { orderBy :: Optional SecurityAdvisoryOrder
                               , identifier :: Optional SecurityAdvisoryIdentifierFilter
                               , publishedSince :: Optional DateTime
                               , updatedSince :: Optional DateTime
                               , after :: Optional String
                               , before :: Optional String
                               , first :: Optional Int
                               , last :: Optional Int
                               }

securityAdvisories :: forall r . SecurityAdvisoriesInput -> SelectionSet Scope__SecurityAdvisoryConnection r -> SelectionSet Scope__RootQuery r
securityAdvisories input = selectionForCompositeField "securityAdvisories" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SecurityAdvisoryInput = { ghsaId :: String
                             }

securityAdvisory :: forall r . SecurityAdvisoryInput -> SelectionSet Scope__SecurityAdvisory r -> SelectionSet Scope__RootQuery (Maybe r)
securityAdvisory input = selectionForCompositeField "securityAdvisory" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SecurityVulnerabilitiesInput = { orderBy :: Optional SecurityVulnerabilityOrder
                                    , ecosystem :: Optional SecurityAdvisoryEcosystem
                                    , package :: Optional String
                                    , severities :: Array SecurityAdvisorySeverity
                                    , after :: Optional String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    }

securityVulnerabilities :: forall r . SecurityVulnerabilitiesInput -> SelectionSet Scope__SecurityVulnerabilityConnection r -> SelectionSet Scope__RootQuery r
securityVulnerabilities input = selectionForCompositeField "securityVulnerabilities" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorsListingInput = { slug :: String
                            }

sponsorsListing :: forall r . SponsorsListingInput -> SelectionSet Scope__SponsorsListing r -> SelectionSet Scope__RootQuery (Maybe r)
sponsorsListing input = selectionForCompositeField "sponsorsListing" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TopicInput = { name :: String
                  }

topic :: forall r . TopicInput -> SelectionSet Scope__Topic r -> SelectionSet Scope__RootQuery (Maybe r)
topic input = selectionForCompositeField "topic" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UserInput = { login :: String
                 }

user :: forall r . UserInput -> SelectionSet Scope__User r -> SelectionSet Scope__RootQuery (Maybe r)
user input = selectionForCompositeField "user" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewer :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__RootQuery r
viewer = selectionForCompositeField "viewer" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
