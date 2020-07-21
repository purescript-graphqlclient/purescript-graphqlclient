module Examples.Github.Object.EnterpriseOwnerInfo where

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

type ActionExecutionCapabilitySettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                       , before :: Optional String
                                                                       , first :: Optional Int
                                                                       , last :: Optional Int
                                                                       , orderBy :: Optional OrganizationOrder
                                                                       | r
                                                                       )

type ActionExecutionCapabilitySettingOrganizationsInput = { | ActionExecutionCapabilitySettingOrganizationsInputRowOptional + () }

actionExecutionCapabilitySettingOrganizations :: forall r . ActionExecutionCapabilitySettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
actionExecutionCapabilitySettingOrganizations input = selectionForCompositeField "actionExecutionCapabilitySettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AdminsInputRowOptional r = ( query :: Optional String
                                , role :: Optional EnterpriseAdministratorRole
                                , orderBy :: Optional EnterpriseMemberOrder
                                , after :: Optional String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                | r
                                )

type AdminsInput = { | AdminsInputRowOptional + () }

admins :: forall r . AdminsInput -> SelectionSet Scope__EnterpriseAdministratorConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
admins input = selectionForCompositeField "admins" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AffiliatedUsersWithTwoFactorDisabledInputRowOptional r = ( after :: Optional String
                                                              , before :: Optional String
                                                              , first :: Optional Int
                                                              , last :: Optional Int
                                                              | r
                                                              )

type AffiliatedUsersWithTwoFactorDisabledInput = { | AffiliatedUsersWithTwoFactorDisabledInputRowOptional + () }

affiliatedUsersWithTwoFactorDisabled :: forall r . AffiliatedUsersWithTwoFactorDisabledInput -> SelectionSet Scope__UserConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
affiliatedUsersWithTwoFactorDisabled input = selectionForCompositeField "affiliatedUsersWithTwoFactorDisabled" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

affiliatedUsersWithTwoFactorDisabledExist :: SelectionSet Scope__EnterpriseOwnerInfo Boolean
affiliatedUsersWithTwoFactorDisabledExist = selectionForField "affiliatedUsersWithTwoFactorDisabledExist" [] graphqlDefaultResponseScalarDecoder

allowPrivateRepositoryForkingSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseEnabledDisabledSettingValue
allowPrivateRepositoryForkingSetting = selectionForField "allowPrivateRepositoryForkingSetting" [] graphqlDefaultResponseScalarDecoder

type AllowPrivateRepositoryForkingSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                           , before :: Optional String
                                                                           , first :: Optional Int
                                                                           , last :: Optional Int
                                                                           , orderBy :: Optional OrganizationOrder
                                                                           | r
                                                                           )

type AllowPrivateRepositoryForkingSettingOrganizationsInputRowRequired r = ( value :: Boolean
                                                                           | r
                                                                           )

type AllowPrivateRepositoryForkingSettingOrganizationsInput = { | AllowPrivateRepositoryForkingSettingOrganizationsInputRowOptional + AllowPrivateRepositoryForkingSettingOrganizationsInputRowRequired + () }

allowPrivateRepositoryForkingSettingOrganizations :: forall r . AllowPrivateRepositoryForkingSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
allowPrivateRepositoryForkingSettingOrganizations input = selectionForCompositeField "allowPrivateRepositoryForkingSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

defaultRepositoryPermissionSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseDefaultRepositoryPermissionSettingValue
defaultRepositoryPermissionSetting = selectionForField "defaultRepositoryPermissionSetting" [] graphqlDefaultResponseScalarDecoder

type DefaultRepositoryPermissionSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                         , before :: Optional String
                                                                         , first :: Optional Int
                                                                         , last :: Optional Int
                                                                         , orderBy :: Optional OrganizationOrder
                                                                         | r
                                                                         )

type DefaultRepositoryPermissionSettingOrganizationsInputRowRequired r = ( value :: DefaultRepositoryPermissionField
                                                                         | r
                                                                         )

type DefaultRepositoryPermissionSettingOrganizationsInput = { | DefaultRepositoryPermissionSettingOrganizationsInputRowOptional + DefaultRepositoryPermissionSettingOrganizationsInputRowRequired + () }

defaultRepositoryPermissionSettingOrganizations :: forall r . DefaultRepositoryPermissionSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
defaultRepositoryPermissionSettingOrganizations input = selectionForCompositeField "defaultRepositoryPermissionSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type EnterpriseServerInstallationsInputRowOptional r = ( after :: Optional String
                                                       , before :: Optional String
                                                       , first :: Optional Int
                                                       , last :: Optional Int
                                                       , connectedOnly :: Optional Boolean
                                                       , orderBy :: Optional EnterpriseServerInstallationOrder
                                                       | r
                                                       )

type EnterpriseServerInstallationsInput = { | EnterpriseServerInstallationsInputRowOptional + () }

enterpriseServerInstallations :: forall r . EnterpriseServerInstallationsInput -> SelectionSet Scope__EnterpriseServerInstallationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
enterpriseServerInstallations input = selectionForCompositeField "enterpriseServerInstallations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ipAllowListEnabledSetting :: SelectionSet Scope__EnterpriseOwnerInfo IpAllowListEnabledSettingValue
ipAllowListEnabledSetting = selectionForField "ipAllowListEnabledSetting" [] graphqlDefaultResponseScalarDecoder

type IpAllowListEntriesInputRowOptional r = ( after :: Optional String
                                            , before :: Optional String
                                            , first :: Optional Int
                                            , last :: Optional Int
                                            , orderBy :: Optional IpAllowListEntryOrder
                                            | r
                                            )

type IpAllowListEntriesInput = { | IpAllowListEntriesInputRowOptional + () }

ipAllowListEntries :: forall r . IpAllowListEntriesInput -> SelectionSet Scope__IpAllowListEntryConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
ipAllowListEntries input = selectionForCompositeField "ipAllowListEntries" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

isUpdatingDefaultRepositoryPermission :: SelectionSet Scope__EnterpriseOwnerInfo Boolean
isUpdatingDefaultRepositoryPermission = selectionForField "isUpdatingDefaultRepositoryPermission" [] graphqlDefaultResponseScalarDecoder

isUpdatingTwoFactorRequirement :: SelectionSet Scope__EnterpriseOwnerInfo Boolean
isUpdatingTwoFactorRequirement = selectionForField "isUpdatingTwoFactorRequirement" [] graphqlDefaultResponseScalarDecoder

membersCanChangeRepositoryVisibilitySetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseEnabledDisabledSettingValue
membersCanChangeRepositoryVisibilitySetting = selectionForField "membersCanChangeRepositoryVisibilitySetting" [] graphqlDefaultResponseScalarDecoder

type MembersCanChangeRepositoryVisibilitySettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                                  , before :: Optional String
                                                                                  , first :: Optional Int
                                                                                  , last :: Optional Int
                                                                                  , orderBy :: Optional OrganizationOrder
                                                                                  | r
                                                                                  )

type MembersCanChangeRepositoryVisibilitySettingOrganizationsInputRowRequired r = ( value :: Boolean
                                                                                  | r
                                                                                  )

type MembersCanChangeRepositoryVisibilitySettingOrganizationsInput = { | MembersCanChangeRepositoryVisibilitySettingOrganizationsInputRowOptional + MembersCanChangeRepositoryVisibilitySettingOrganizationsInputRowRequired + () }

membersCanChangeRepositoryVisibilitySettingOrganizations :: forall r . MembersCanChangeRepositoryVisibilitySettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanChangeRepositoryVisibilitySettingOrganizations input = selectionForCompositeField "membersCanChangeRepositoryVisibilitySettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanCreateInternalRepositoriesSetting :: SelectionSet Scope__EnterpriseOwnerInfo (Maybe Boolean)
membersCanCreateInternalRepositoriesSetting = selectionForField "membersCanCreateInternalRepositoriesSetting" [] graphqlDefaultResponseScalarDecoder

membersCanCreatePrivateRepositoriesSetting :: SelectionSet Scope__EnterpriseOwnerInfo (Maybe Boolean)
membersCanCreatePrivateRepositoriesSetting = selectionForField "membersCanCreatePrivateRepositoriesSetting" [] graphqlDefaultResponseScalarDecoder

membersCanCreatePublicRepositoriesSetting :: SelectionSet Scope__EnterpriseOwnerInfo (Maybe Boolean)
membersCanCreatePublicRepositoriesSetting = selectionForField "membersCanCreatePublicRepositoriesSetting" [] graphqlDefaultResponseScalarDecoder

membersCanCreateRepositoriesSetting :: SelectionSet Scope__EnterpriseOwnerInfo (Maybe EnterpriseMembersCanCreateRepositoriesSettingValue)
membersCanCreateRepositoriesSetting = selectionForField "membersCanCreateRepositoriesSetting" [] graphqlDefaultResponseScalarDecoder

type MembersCanCreateRepositoriesSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                          , before :: Optional String
                                                                          , first :: Optional Int
                                                                          , last :: Optional Int
                                                                          , orderBy :: Optional OrganizationOrder
                                                                          | r
                                                                          )

type MembersCanCreateRepositoriesSettingOrganizationsInputRowRequired r = ( value :: OrganizationMembersCanCreateRepositoriesSettingValue
                                                                          | r
                                                                          )

type MembersCanCreateRepositoriesSettingOrganizationsInput = { | MembersCanCreateRepositoriesSettingOrganizationsInputRowOptional + MembersCanCreateRepositoriesSettingOrganizationsInputRowRequired + () }

membersCanCreateRepositoriesSettingOrganizations :: forall r . MembersCanCreateRepositoriesSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanCreateRepositoriesSettingOrganizations input = selectionForCompositeField "membersCanCreateRepositoriesSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanDeleteIssuesSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseEnabledDisabledSettingValue
membersCanDeleteIssuesSetting = selectionForField "membersCanDeleteIssuesSetting" [] graphqlDefaultResponseScalarDecoder

type MembersCanDeleteIssuesSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                    , before :: Optional String
                                                                    , first :: Optional Int
                                                                    , last :: Optional Int
                                                                    , orderBy :: Optional OrganizationOrder
                                                                    | r
                                                                    )

type MembersCanDeleteIssuesSettingOrganizationsInputRowRequired r = ( value :: Boolean
                                                                    | r
                                                                    )

type MembersCanDeleteIssuesSettingOrganizationsInput = { | MembersCanDeleteIssuesSettingOrganizationsInputRowOptional + MembersCanDeleteIssuesSettingOrganizationsInputRowRequired + () }

membersCanDeleteIssuesSettingOrganizations :: forall r . MembersCanDeleteIssuesSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanDeleteIssuesSettingOrganizations input = selectionForCompositeField "membersCanDeleteIssuesSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanDeleteRepositoriesSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseEnabledDisabledSettingValue
membersCanDeleteRepositoriesSetting = selectionForField "membersCanDeleteRepositoriesSetting" [] graphqlDefaultResponseScalarDecoder

type MembersCanDeleteRepositoriesSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                          , before :: Optional String
                                                                          , first :: Optional Int
                                                                          , last :: Optional Int
                                                                          , orderBy :: Optional OrganizationOrder
                                                                          | r
                                                                          )

type MembersCanDeleteRepositoriesSettingOrganizationsInputRowRequired r = ( value :: Boolean
                                                                          | r
                                                                          )

type MembersCanDeleteRepositoriesSettingOrganizationsInput = { | MembersCanDeleteRepositoriesSettingOrganizationsInputRowOptional + MembersCanDeleteRepositoriesSettingOrganizationsInputRowRequired + () }

membersCanDeleteRepositoriesSettingOrganizations :: forall r . MembersCanDeleteRepositoriesSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanDeleteRepositoriesSettingOrganizations input = selectionForCompositeField "membersCanDeleteRepositoriesSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanInviteCollaboratorsSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseEnabledDisabledSettingValue
membersCanInviteCollaboratorsSetting = selectionForField "membersCanInviteCollaboratorsSetting" [] graphqlDefaultResponseScalarDecoder

type MembersCanInviteCollaboratorsSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                           , before :: Optional String
                                                                           , first :: Optional Int
                                                                           , last :: Optional Int
                                                                           , orderBy :: Optional OrganizationOrder
                                                                           | r
                                                                           )

type MembersCanInviteCollaboratorsSettingOrganizationsInputRowRequired r = ( value :: Boolean
                                                                           | r
                                                                           )

type MembersCanInviteCollaboratorsSettingOrganizationsInput = { | MembersCanInviteCollaboratorsSettingOrganizationsInputRowOptional + MembersCanInviteCollaboratorsSettingOrganizationsInputRowRequired + () }

membersCanInviteCollaboratorsSettingOrganizations :: forall r . MembersCanInviteCollaboratorsSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanInviteCollaboratorsSettingOrganizations input = selectionForCompositeField "membersCanInviteCollaboratorsSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanMakePurchasesSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseMembersCanMakePurchasesSettingValue
membersCanMakePurchasesSetting = selectionForField "membersCanMakePurchasesSetting" [] graphqlDefaultResponseScalarDecoder

membersCanUpdateProtectedBranchesSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseEnabledDisabledSettingValue
membersCanUpdateProtectedBranchesSetting = selectionForField "membersCanUpdateProtectedBranchesSetting" [] graphqlDefaultResponseScalarDecoder

type MembersCanUpdateProtectedBranchesSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                               , before :: Optional String
                                                                               , first :: Optional Int
                                                                               , last :: Optional Int
                                                                               , orderBy :: Optional OrganizationOrder
                                                                               | r
                                                                               )

type MembersCanUpdateProtectedBranchesSettingOrganizationsInputRowRequired r = ( value :: Boolean
                                                                               | r
                                                                               )

type MembersCanUpdateProtectedBranchesSettingOrganizationsInput = { | MembersCanUpdateProtectedBranchesSettingOrganizationsInputRowOptional + MembersCanUpdateProtectedBranchesSettingOrganizationsInputRowRequired + () }

membersCanUpdateProtectedBranchesSettingOrganizations :: forall r . MembersCanUpdateProtectedBranchesSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanUpdateProtectedBranchesSettingOrganizations input = selectionForCompositeField "membersCanUpdateProtectedBranchesSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanViewDependencyInsightsSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseEnabledDisabledSettingValue
membersCanViewDependencyInsightsSetting = selectionForField "membersCanViewDependencyInsightsSetting" [] graphqlDefaultResponseScalarDecoder

type MembersCanViewDependencyInsightsSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                              , before :: Optional String
                                                                              , first :: Optional Int
                                                                              , last :: Optional Int
                                                                              , orderBy :: Optional OrganizationOrder
                                                                              | r
                                                                              )

type MembersCanViewDependencyInsightsSettingOrganizationsInputRowRequired r = ( value :: Boolean
                                                                              | r
                                                                              )

type MembersCanViewDependencyInsightsSettingOrganizationsInput = { | MembersCanViewDependencyInsightsSettingOrganizationsInputRowOptional + MembersCanViewDependencyInsightsSettingOrganizationsInputRowRequired + () }

membersCanViewDependencyInsightsSettingOrganizations :: forall r . MembersCanViewDependencyInsightsSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanViewDependencyInsightsSettingOrganizations input = selectionForCompositeField "membersCanViewDependencyInsightsSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationProjectsSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseEnabledDisabledSettingValue
organizationProjectsSetting = selectionForField "organizationProjectsSetting" [] graphqlDefaultResponseScalarDecoder

type OrganizationProjectsSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                  , before :: Optional String
                                                                  , first :: Optional Int
                                                                  , last :: Optional Int
                                                                  , orderBy :: Optional OrganizationOrder
                                                                  | r
                                                                  )

type OrganizationProjectsSettingOrganizationsInputRowRequired r = ( value :: Boolean
                                                                  | r
                                                                  )

type OrganizationProjectsSettingOrganizationsInput = { | OrganizationProjectsSettingOrganizationsInputRowOptional + OrganizationProjectsSettingOrganizationsInputRowRequired + () }

organizationProjectsSettingOrganizations :: forall r . OrganizationProjectsSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
organizationProjectsSettingOrganizations input = selectionForCompositeField "organizationProjectsSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type OutsideCollaboratorsInputRowOptional r = ( login :: Optional String
                                              , query :: Optional String
                                              , orderBy :: Optional EnterpriseMemberOrder
                                              , visibility :: Optional RepositoryVisibility
                                              , after :: Optional String
                                              , before :: Optional String
                                              , first :: Optional Int
                                              , last :: Optional Int
                                              | r
                                              )

type OutsideCollaboratorsInput = { | OutsideCollaboratorsInputRowOptional + () }

outsideCollaborators :: forall r . OutsideCollaboratorsInput -> SelectionSet Scope__EnterpriseOutsideCollaboratorConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
outsideCollaborators input = selectionForCompositeField "outsideCollaborators" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingAdminInvitationsInputRowOptional r = ( query :: Optional String
                                                 , orderBy :: Optional EnterpriseAdministratorInvitationOrder
                                                 , role :: Optional EnterpriseAdministratorRole
                                                 , after :: Optional String
                                                 , before :: Optional String
                                                 , first :: Optional Int
                                                 , last :: Optional Int
                                                 | r
                                                 )

type PendingAdminInvitationsInput = { | PendingAdminInvitationsInputRowOptional + () }

pendingAdminInvitations :: forall r . PendingAdminInvitationsInput -> SelectionSet Scope__EnterpriseAdministratorInvitationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
pendingAdminInvitations input = selectionForCompositeField "pendingAdminInvitations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingCollaboratorInvitationsInputRowOptional r = ( query :: Optional String
                                                        , orderBy :: Optional RepositoryInvitationOrder
                                                        , after :: Optional String
                                                        , before :: Optional String
                                                        , first :: Optional Int
                                                        , last :: Optional Int
                                                        | r
                                                        )

type PendingCollaboratorInvitationsInput = { | PendingCollaboratorInvitationsInputRowOptional + () }

pendingCollaboratorInvitations :: forall r . PendingCollaboratorInvitationsInput -> SelectionSet Scope__RepositoryInvitationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
pendingCollaboratorInvitations input = selectionForCompositeField "pendingCollaboratorInvitations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingCollaboratorsInputRowOptional r = ( query :: Optional String
                                              , orderBy :: Optional RepositoryInvitationOrder
                                              , after :: Optional String
                                              , before :: Optional String
                                              , first :: Optional Int
                                              , last :: Optional Int
                                              | r
                                              )

type PendingCollaboratorsInput = { | PendingCollaboratorsInputRowOptional + () }

pendingCollaborators :: forall r . PendingCollaboratorsInput -> SelectionSet Scope__EnterprisePendingCollaboratorConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
pendingCollaborators input = selectionForCompositeField "pendingCollaborators" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingMemberInvitationsInputRowOptional r = ( query :: Optional String
                                                  , after :: Optional String
                                                  , before :: Optional String
                                                  , first :: Optional Int
                                                  , last :: Optional Int
                                                  | r
                                                  )

type PendingMemberInvitationsInput = { | PendingMemberInvitationsInputRowOptional + () }

pendingMemberInvitations :: forall r . PendingMemberInvitationsInput -> SelectionSet Scope__EnterprisePendingMemberInvitationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
pendingMemberInvitations input = selectionForCompositeField "pendingMemberInvitations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryProjectsSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseEnabledDisabledSettingValue
repositoryProjectsSetting = selectionForField "repositoryProjectsSetting" [] graphqlDefaultResponseScalarDecoder

type RepositoryProjectsSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                , before :: Optional String
                                                                , first :: Optional Int
                                                                , last :: Optional Int
                                                                , orderBy :: Optional OrganizationOrder
                                                                | r
                                                                )

type RepositoryProjectsSettingOrganizationsInputRowRequired r = ( value :: Boolean
                                                                | r
                                                                )

type RepositoryProjectsSettingOrganizationsInput = { | RepositoryProjectsSettingOrganizationsInputRowOptional + RepositoryProjectsSettingOrganizationsInputRowRequired + () }

repositoryProjectsSettingOrganizations :: forall r . RepositoryProjectsSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
repositoryProjectsSettingOrganizations input = selectionForCompositeField "repositoryProjectsSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

samlIdentityProvider :: forall r . SelectionSet Scope__EnterpriseIdentityProvider r -> SelectionSet Scope__EnterpriseOwnerInfo (Maybe r)
samlIdentityProvider = selectionForCompositeField "samlIdentityProvider" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SamlIdentityProviderSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                                  , before :: Optional String
                                                                  , first :: Optional Int
                                                                  , last :: Optional Int
                                                                  , orderBy :: Optional OrganizationOrder
                                                                  | r
                                                                  )

type SamlIdentityProviderSettingOrganizationsInputRowRequired r = ( value :: IdentityProviderConfigurationState
                                                                  | r
                                                                  )

type SamlIdentityProviderSettingOrganizationsInput = { | SamlIdentityProviderSettingOrganizationsInputRowOptional + SamlIdentityProviderSettingOrganizationsInputRowRequired + () }

samlIdentityProviderSettingOrganizations :: forall r . SamlIdentityProviderSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
samlIdentityProviderSettingOrganizations input = selectionForCompositeField "samlIdentityProviderSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

teamDiscussionsSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseEnabledDisabledSettingValue
teamDiscussionsSetting = selectionForField "teamDiscussionsSetting" [] graphqlDefaultResponseScalarDecoder

type TeamDiscussionsSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                             , before :: Optional String
                                                             , first :: Optional Int
                                                             , last :: Optional Int
                                                             , orderBy :: Optional OrganizationOrder
                                                             | r
                                                             )

type TeamDiscussionsSettingOrganizationsInputRowRequired r = ( value :: Boolean
                                                             | r
                                                             )

type TeamDiscussionsSettingOrganizationsInput = { | TeamDiscussionsSettingOrganizationsInputRowOptional + TeamDiscussionsSettingOrganizationsInputRowRequired + () }

teamDiscussionsSettingOrganizations :: forall r . TeamDiscussionsSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
teamDiscussionsSettingOrganizations input = selectionForCompositeField "teamDiscussionsSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

twoFactorRequiredSetting :: SelectionSet Scope__EnterpriseOwnerInfo EnterpriseEnabledSettingValue
twoFactorRequiredSetting = selectionForField "twoFactorRequiredSetting" [] graphqlDefaultResponseScalarDecoder

type TwoFactorRequiredSettingOrganizationsInputRowOptional r = ( after :: Optional String
                                                               , before :: Optional String
                                                               , first :: Optional Int
                                                               , last :: Optional Int
                                                               , orderBy :: Optional OrganizationOrder
                                                               | r
                                                               )

type TwoFactorRequiredSettingOrganizationsInputRowRequired r = ( value :: Boolean
                                                               | r
                                                               )

type TwoFactorRequiredSettingOrganizationsInput = { | TwoFactorRequiredSettingOrganizationsInputRowOptional + TwoFactorRequiredSettingOrganizationsInputRowRequired + () }

twoFactorRequiredSettingOrganizations :: forall r . TwoFactorRequiredSettingOrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__EnterpriseOwnerInfo r
twoFactorRequiredSettingOrganizations input = selectionForCompositeField "twoFactorRequiredSettingOrganizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer
