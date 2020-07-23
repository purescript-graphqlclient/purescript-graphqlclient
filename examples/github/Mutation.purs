module Examples.Github.Mutation where

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

type AcceptEnterpriseAdministratorInvitationInputRowRequired r = ( input :: AcceptEnterpriseAdministratorInvitationInput
                                                                 | r
                                                                 )

type AcceptEnterpriseAdministratorInvitationInput = { | AcceptEnterpriseAdministratorInvitationInputRowRequired + () }

acceptEnterpriseAdministratorInvitation :: forall r . AcceptEnterpriseAdministratorInvitationInput -> SelectionSet Scope__AcceptEnterpriseAdministratorInvitationPayload r -> SelectionSet Scope__RootMutation (Maybe r)
acceptEnterpriseAdministratorInvitation input = selectionForCompositeField "acceptEnterpriseAdministratorInvitation" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AcceptTopicSuggestionInputRowRequired r = ( input :: AcceptTopicSuggestionInput
                                               | r
                                               )

type AcceptTopicSuggestionInput = { | AcceptTopicSuggestionInputRowRequired + () }

acceptTopicSuggestion :: forall r . AcceptTopicSuggestionInput -> SelectionSet Scope__AcceptTopicSuggestionPayload r -> SelectionSet Scope__RootMutation (Maybe r)
acceptTopicSuggestion input = selectionForCompositeField "acceptTopicSuggestion" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddAssigneesToAssignableInputRowRequired r = ( input :: AddAssigneesToAssignableInput
                                                  | r
                                                  )

type AddAssigneesToAssignableInput = { | AddAssigneesToAssignableInputRowRequired + () }

addAssigneesToAssignable :: forall r . AddAssigneesToAssignableInput -> SelectionSet Scope__AddAssigneesToAssignablePayload r -> SelectionSet Scope__RootMutation (Maybe r)
addAssigneesToAssignable input = selectionForCompositeField "addAssigneesToAssignable" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddCommentInputRowRequired r = ( input :: AddCommentInput
                                    | r
                                    )

type AddCommentInput = { | AddCommentInputRowRequired + () }

addComment :: forall r . AddCommentInput -> SelectionSet Scope__AddCommentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
addComment input = selectionForCompositeField "addComment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddLabelsToLabelableInputRowRequired r = ( input :: AddLabelsToLabelableInput
                                              | r
                                              )

type AddLabelsToLabelableInput = { | AddLabelsToLabelableInputRowRequired + () }

addLabelsToLabelable :: forall r . AddLabelsToLabelableInput -> SelectionSet Scope__AddLabelsToLabelablePayload r -> SelectionSet Scope__RootMutation (Maybe r)
addLabelsToLabelable input = selectionForCompositeField "addLabelsToLabelable" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddProjectCardInputRowRequired r = ( input :: AddProjectCardInput
                                        | r
                                        )

type AddProjectCardInput = { | AddProjectCardInputRowRequired + () }

addProjectCard :: forall r . AddProjectCardInput -> SelectionSet Scope__AddProjectCardPayload r -> SelectionSet Scope__RootMutation (Maybe r)
addProjectCard input = selectionForCompositeField "addProjectCard" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddProjectColumnInputRowRequired r = ( input :: AddProjectColumnInput
                                          | r
                                          )

type AddProjectColumnInput = { | AddProjectColumnInputRowRequired + () }

addProjectColumn :: forall r . AddProjectColumnInput -> SelectionSet Scope__AddProjectColumnPayload r -> SelectionSet Scope__RootMutation (Maybe r)
addProjectColumn input = selectionForCompositeField "addProjectColumn" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddPullRequestReviewInputRowRequired r = ( input :: AddPullRequestReviewInput
                                              | r
                                              )

type AddPullRequestReviewInput = { | AddPullRequestReviewInputRowRequired + () }

addPullRequestReview :: forall r . AddPullRequestReviewInput -> SelectionSet Scope__AddPullRequestReviewPayload r -> SelectionSet Scope__RootMutation (Maybe r)
addPullRequestReview input = selectionForCompositeField "addPullRequestReview" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddPullRequestReviewCommentInputRowRequired r = ( input :: AddPullRequestReviewCommentInput
                                                     | r
                                                     )

type AddPullRequestReviewCommentInput = { | AddPullRequestReviewCommentInputRowRequired + () }

addPullRequestReviewComment :: forall r . AddPullRequestReviewCommentInput -> SelectionSet Scope__AddPullRequestReviewCommentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
addPullRequestReviewComment input = selectionForCompositeField "addPullRequestReviewComment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddPullRequestReviewThreadInputRowRequired r = ( input :: AddPullRequestReviewThreadInput
                                                    | r
                                                    )

type AddPullRequestReviewThreadInput = { | AddPullRequestReviewThreadInputRowRequired + () }

addPullRequestReviewThread :: forall r . AddPullRequestReviewThreadInput -> SelectionSet Scope__AddPullRequestReviewThreadPayload r -> SelectionSet Scope__RootMutation (Maybe r)
addPullRequestReviewThread input = selectionForCompositeField "addPullRequestReviewThread" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddReactionInputRowRequired r = ( input :: AddReactionInput
                                     | r
                                     )

type AddReactionInput = { | AddReactionInputRowRequired + () }

addReaction :: forall r . AddReactionInput -> SelectionSet Scope__AddReactionPayload r -> SelectionSet Scope__RootMutation (Maybe r)
addReaction input = selectionForCompositeField "addReaction" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddStarInputRowRequired r = ( input :: AddStarInput
                                 | r
                                 )

type AddStarInput = { | AddStarInputRowRequired + () }

addStar :: forall r . AddStarInput -> SelectionSet Scope__AddStarPayload r -> SelectionSet Scope__RootMutation (Maybe r)
addStar input = selectionForCompositeField "addStar" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ArchiveRepositoryInputRowRequired r = ( input :: ArchiveRepositoryInput
                                           | r
                                           )

type ArchiveRepositoryInput = { | ArchiveRepositoryInputRowRequired + () }

archiveRepository :: forall r . ArchiveRepositoryInput -> SelectionSet Scope__ArchiveRepositoryPayload r -> SelectionSet Scope__RootMutation (Maybe r)
archiveRepository input = selectionForCompositeField "archiveRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CancelEnterpriseAdminInvitationInputRowRequired r = ( input :: CancelEnterpriseAdminInvitationInput
                                                         | r
                                                         )

type CancelEnterpriseAdminInvitationInput = { | CancelEnterpriseAdminInvitationInputRowRequired + () }

cancelEnterpriseAdminInvitation :: forall r . CancelEnterpriseAdminInvitationInput -> SelectionSet Scope__CancelEnterpriseAdminInvitationPayload r -> SelectionSet Scope__RootMutation (Maybe r)
cancelEnterpriseAdminInvitation input = selectionForCompositeField "cancelEnterpriseAdminInvitation" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ChangeUserStatusInputRowRequired r = ( input :: ChangeUserStatusInput
                                          | r
                                          )

type ChangeUserStatusInput = { | ChangeUserStatusInputRowRequired + () }

changeUserStatus :: forall r . ChangeUserStatusInput -> SelectionSet Scope__ChangeUserStatusPayload r -> SelectionSet Scope__RootMutation (Maybe r)
changeUserStatus input = selectionForCompositeField "changeUserStatus" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ClearLabelsFromLabelableInputRowRequired r = ( input :: ClearLabelsFromLabelableInput
                                                  | r
                                                  )

type ClearLabelsFromLabelableInput = { | ClearLabelsFromLabelableInputRowRequired + () }

clearLabelsFromLabelable :: forall r . ClearLabelsFromLabelableInput -> SelectionSet Scope__ClearLabelsFromLabelablePayload r -> SelectionSet Scope__RootMutation (Maybe r)
clearLabelsFromLabelable input = selectionForCompositeField "clearLabelsFromLabelable" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CloneProjectInputRowRequired r = ( input :: CloneProjectInput
                                      | r
                                      )

type CloneProjectInput = { | CloneProjectInputRowRequired + () }

cloneProject :: forall r . CloneProjectInput -> SelectionSet Scope__CloneProjectPayload r -> SelectionSet Scope__RootMutation (Maybe r)
cloneProject input = selectionForCompositeField "cloneProject" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CloneTemplateRepositoryInputRowRequired r = ( input :: CloneTemplateRepositoryInput
                                                 | r
                                                 )

type CloneTemplateRepositoryInput = { | CloneTemplateRepositoryInputRowRequired + () }

cloneTemplateRepository :: forall r . CloneTemplateRepositoryInput -> SelectionSet Scope__CloneTemplateRepositoryPayload r -> SelectionSet Scope__RootMutation (Maybe r)
cloneTemplateRepository input = selectionForCompositeField "cloneTemplateRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CloseIssueInputRowRequired r = ( input :: CloseIssueInput
                                    | r
                                    )

type CloseIssueInput = { | CloseIssueInputRowRequired + () }

closeIssue :: forall r . CloseIssueInput -> SelectionSet Scope__CloseIssuePayload r -> SelectionSet Scope__RootMutation (Maybe r)
closeIssue input = selectionForCompositeField "closeIssue" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ClosePullRequestInputRowRequired r = ( input :: ClosePullRequestInput
                                          | r
                                          )

type ClosePullRequestInput = { | ClosePullRequestInputRowRequired + () }

closePullRequest :: forall r . ClosePullRequestInput -> SelectionSet Scope__ClosePullRequestPayload r -> SelectionSet Scope__RootMutation (Maybe r)
closePullRequest input = selectionForCompositeField "closePullRequest" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ConvertProjectCardNoteToIssueInputRowRequired r = ( input :: ConvertProjectCardNoteToIssueInput
                                                       | r
                                                       )

type ConvertProjectCardNoteToIssueInput = { | ConvertProjectCardNoteToIssueInputRowRequired + () }

convertProjectCardNoteToIssue :: forall r . ConvertProjectCardNoteToIssueInput -> SelectionSet Scope__ConvertProjectCardNoteToIssuePayload r -> SelectionSet Scope__RootMutation (Maybe r)
convertProjectCardNoteToIssue input = selectionForCompositeField "convertProjectCardNoteToIssue" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateBranchProtectionRuleInputRowRequired r = ( input :: CreateBranchProtectionRuleInput
                                                    | r
                                                    )

type CreateBranchProtectionRuleInput = { | CreateBranchProtectionRuleInputRowRequired + () }

createBranchProtectionRule :: forall r . CreateBranchProtectionRuleInput -> SelectionSet Scope__CreateBranchProtectionRulePayload r -> SelectionSet Scope__RootMutation (Maybe r)
createBranchProtectionRule input = selectionForCompositeField "createBranchProtectionRule" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateEnterpriseOrganizationInputRowRequired r = ( input :: CreateEnterpriseOrganizationInput
                                                      | r
                                                      )

type CreateEnterpriseOrganizationInput = { | CreateEnterpriseOrganizationInputRowRequired + () }

createEnterpriseOrganization :: forall r . CreateEnterpriseOrganizationInput -> SelectionSet Scope__CreateEnterpriseOrganizationPayload r -> SelectionSet Scope__RootMutation (Maybe r)
createEnterpriseOrganization input = selectionForCompositeField "createEnterpriseOrganization" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateIpAllowListEntryInputRowRequired r = ( input :: CreateIpAllowListEntryInput
                                                | r
                                                )

type CreateIpAllowListEntryInput = { | CreateIpAllowListEntryInputRowRequired + () }

createIpAllowListEntry :: forall r . CreateIpAllowListEntryInput -> SelectionSet Scope__CreateIpAllowListEntryPayload r -> SelectionSet Scope__RootMutation (Maybe r)
createIpAllowListEntry input = selectionForCompositeField "createIpAllowListEntry" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateIssueInputRowRequired r = ( input :: CreateIssueInput
                                     | r
                                     )

type CreateIssueInput = { | CreateIssueInputRowRequired + () }

createIssue :: forall r . CreateIssueInput -> SelectionSet Scope__CreateIssuePayload r -> SelectionSet Scope__RootMutation (Maybe r)
createIssue input = selectionForCompositeField "createIssue" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateProjectInputRowRequired r = ( input :: CreateProjectInput
                                       | r
                                       )

type CreateProjectInput = { | CreateProjectInputRowRequired + () }

createProject :: forall r . CreateProjectInput -> SelectionSet Scope__CreateProjectPayload r -> SelectionSet Scope__RootMutation (Maybe r)
createProject input = selectionForCompositeField "createProject" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreatePullRequestInputRowRequired r = ( input :: CreatePullRequestInput
                                           | r
                                           )

type CreatePullRequestInput = { | CreatePullRequestInputRowRequired + () }

createPullRequest :: forall r . CreatePullRequestInput -> SelectionSet Scope__CreatePullRequestPayload r -> SelectionSet Scope__RootMutation (Maybe r)
createPullRequest input = selectionForCompositeField "createPullRequest" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateRefInputRowRequired r = ( input :: CreateRefInput
                                   | r
                                   )

type CreateRefInput = { | CreateRefInputRowRequired + () }

createRef :: forall r . CreateRefInput -> SelectionSet Scope__CreateRefPayload r -> SelectionSet Scope__RootMutation (Maybe r)
createRef input = selectionForCompositeField "createRef" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateRepositoryInputRowRequired r = ( input :: CreateRepositoryInput
                                          | r
                                          )

type CreateRepositoryInput = { | CreateRepositoryInputRowRequired + () }

createRepository :: forall r . CreateRepositoryInput -> SelectionSet Scope__CreateRepositoryPayload r -> SelectionSet Scope__RootMutation (Maybe r)
createRepository input = selectionForCompositeField "createRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateTeamDiscussionInputRowRequired r = ( input :: CreateTeamDiscussionInput
                                              | r
                                              )

type CreateTeamDiscussionInput = { | CreateTeamDiscussionInputRowRequired + () }

createTeamDiscussion :: forall r . CreateTeamDiscussionInput -> SelectionSet Scope__CreateTeamDiscussionPayload r -> SelectionSet Scope__RootMutation (Maybe r)
createTeamDiscussion input = selectionForCompositeField "createTeamDiscussion" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateTeamDiscussionCommentInputRowRequired r = ( input :: CreateTeamDiscussionCommentInput
                                                     | r
                                                     )

type CreateTeamDiscussionCommentInput = { | CreateTeamDiscussionCommentInputRowRequired + () }

createTeamDiscussionComment :: forall r . CreateTeamDiscussionCommentInput -> SelectionSet Scope__CreateTeamDiscussionCommentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
createTeamDiscussionComment input = selectionForCompositeField "createTeamDiscussionComment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeclineTopicSuggestionInputRowRequired r = ( input :: DeclineTopicSuggestionInput
                                                | r
                                                )

type DeclineTopicSuggestionInput = { | DeclineTopicSuggestionInputRowRequired + () }

declineTopicSuggestion :: forall r . DeclineTopicSuggestionInput -> SelectionSet Scope__DeclineTopicSuggestionPayload r -> SelectionSet Scope__RootMutation (Maybe r)
declineTopicSuggestion input = selectionForCompositeField "declineTopicSuggestion" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteBranchProtectionRuleInputRowRequired r = ( input :: DeleteBranchProtectionRuleInput
                                                    | r
                                                    )

type DeleteBranchProtectionRuleInput = { | DeleteBranchProtectionRuleInputRowRequired + () }

deleteBranchProtectionRule :: forall r . DeleteBranchProtectionRuleInput -> SelectionSet Scope__DeleteBranchProtectionRulePayload r -> SelectionSet Scope__RootMutation (Maybe r)
deleteBranchProtectionRule input = selectionForCompositeField "deleteBranchProtectionRule" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteDeploymentInputRowRequired r = ( input :: DeleteDeploymentInput
                                          | r
                                          )

type DeleteDeploymentInput = { | DeleteDeploymentInputRowRequired + () }

deleteDeployment :: forall r . DeleteDeploymentInput -> SelectionSet Scope__DeleteDeploymentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
deleteDeployment input = selectionForCompositeField "deleteDeployment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteIpAllowListEntryInputRowRequired r = ( input :: DeleteIpAllowListEntryInput
                                                | r
                                                )

type DeleteIpAllowListEntryInput = { | DeleteIpAllowListEntryInputRowRequired + () }

deleteIpAllowListEntry :: forall r . DeleteIpAllowListEntryInput -> SelectionSet Scope__DeleteIpAllowListEntryPayload r -> SelectionSet Scope__RootMutation (Maybe r)
deleteIpAllowListEntry input = selectionForCompositeField "deleteIpAllowListEntry" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteIssueInputRowRequired r = ( input :: DeleteIssueInput
                                     | r
                                     )

type DeleteIssueInput = { | DeleteIssueInputRowRequired + () }

deleteIssue :: forall r . DeleteIssueInput -> SelectionSet Scope__DeleteIssuePayload r -> SelectionSet Scope__RootMutation (Maybe r)
deleteIssue input = selectionForCompositeField "deleteIssue" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteIssueCommentInputRowRequired r = ( input :: DeleteIssueCommentInput
                                            | r
                                            )

type DeleteIssueCommentInput = { | DeleteIssueCommentInputRowRequired + () }

deleteIssueComment :: forall r . DeleteIssueCommentInput -> SelectionSet Scope__DeleteIssueCommentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
deleteIssueComment input = selectionForCompositeField "deleteIssueComment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteProjectInputRowRequired r = ( input :: DeleteProjectInput
                                       | r
                                       )

type DeleteProjectInput = { | DeleteProjectInputRowRequired + () }

deleteProject :: forall r . DeleteProjectInput -> SelectionSet Scope__DeleteProjectPayload r -> SelectionSet Scope__RootMutation (Maybe r)
deleteProject input = selectionForCompositeField "deleteProject" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteProjectCardInputRowRequired r = ( input :: DeleteProjectCardInput
                                           | r
                                           )

type DeleteProjectCardInput = { | DeleteProjectCardInputRowRequired + () }

deleteProjectCard :: forall r . DeleteProjectCardInput -> SelectionSet Scope__DeleteProjectCardPayload r -> SelectionSet Scope__RootMutation (Maybe r)
deleteProjectCard input = selectionForCompositeField "deleteProjectCard" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteProjectColumnInputRowRequired r = ( input :: DeleteProjectColumnInput
                                             | r
                                             )

type DeleteProjectColumnInput = { | DeleteProjectColumnInputRowRequired + () }

deleteProjectColumn :: forall r . DeleteProjectColumnInput -> SelectionSet Scope__DeleteProjectColumnPayload r -> SelectionSet Scope__RootMutation (Maybe r)
deleteProjectColumn input = selectionForCompositeField "deleteProjectColumn" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeletePullRequestReviewInputRowRequired r = ( input :: DeletePullRequestReviewInput
                                                 | r
                                                 )

type DeletePullRequestReviewInput = { | DeletePullRequestReviewInputRowRequired + () }

deletePullRequestReview :: forall r . DeletePullRequestReviewInput -> SelectionSet Scope__DeletePullRequestReviewPayload r -> SelectionSet Scope__RootMutation (Maybe r)
deletePullRequestReview input = selectionForCompositeField "deletePullRequestReview" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeletePullRequestReviewCommentInputRowRequired r = ( input :: DeletePullRequestReviewCommentInput
                                                        | r
                                                        )

type DeletePullRequestReviewCommentInput = { | DeletePullRequestReviewCommentInputRowRequired + () }

deletePullRequestReviewComment :: forall r . DeletePullRequestReviewCommentInput -> SelectionSet Scope__DeletePullRequestReviewCommentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
deletePullRequestReviewComment input = selectionForCompositeField "deletePullRequestReviewComment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteRefInputRowRequired r = ( input :: DeleteRefInput
                                   | r
                                   )

type DeleteRefInput = { | DeleteRefInputRowRequired + () }

deleteRef :: forall r . DeleteRefInput -> SelectionSet Scope__DeleteRefPayload r -> SelectionSet Scope__RootMutation (Maybe r)
deleteRef input = selectionForCompositeField "deleteRef" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteTeamDiscussionInputRowRequired r = ( input :: DeleteTeamDiscussionInput
                                              | r
                                              )

type DeleteTeamDiscussionInput = { | DeleteTeamDiscussionInputRowRequired + () }

deleteTeamDiscussion :: forall r . DeleteTeamDiscussionInput -> SelectionSet Scope__DeleteTeamDiscussionPayload r -> SelectionSet Scope__RootMutation (Maybe r)
deleteTeamDiscussion input = selectionForCompositeField "deleteTeamDiscussion" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteTeamDiscussionCommentInputRowRequired r = ( input :: DeleteTeamDiscussionCommentInput
                                                     | r
                                                     )

type DeleteTeamDiscussionCommentInput = { | DeleteTeamDiscussionCommentInputRowRequired + () }

deleteTeamDiscussionComment :: forall r . DeleteTeamDiscussionCommentInput -> SelectionSet Scope__DeleteTeamDiscussionCommentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
deleteTeamDiscussionComment input = selectionForCompositeField "deleteTeamDiscussionComment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DismissPullRequestReviewInputRowRequired r = ( input :: DismissPullRequestReviewInput
                                                  | r
                                                  )

type DismissPullRequestReviewInput = { | DismissPullRequestReviewInputRowRequired + () }

dismissPullRequestReview :: forall r . DismissPullRequestReviewInput -> SelectionSet Scope__DismissPullRequestReviewPayload r -> SelectionSet Scope__RootMutation (Maybe r)
dismissPullRequestReview input = selectionForCompositeField "dismissPullRequestReview" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type FollowUserInputRowRequired r = ( input :: FollowUserInput
                                    | r
                                    )

type FollowUserInput = { | FollowUserInputRowRequired + () }

followUser :: forall r . FollowUserInput -> SelectionSet Scope__FollowUserPayload r -> SelectionSet Scope__RootMutation (Maybe r)
followUser input = selectionForCompositeField "followUser" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type InviteEnterpriseAdminInputRowRequired r = ( input :: InviteEnterpriseAdminInput
                                               | r
                                               )

type InviteEnterpriseAdminInput = { | InviteEnterpriseAdminInputRowRequired + () }

inviteEnterpriseAdmin :: forall r . InviteEnterpriseAdminInput -> SelectionSet Scope__InviteEnterpriseAdminPayload r -> SelectionSet Scope__RootMutation (Maybe r)
inviteEnterpriseAdmin input = selectionForCompositeField "inviteEnterpriseAdmin" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LinkRepositoryToProjectInputRowRequired r = ( input :: LinkRepositoryToProjectInput
                                                 | r
                                                 )

type LinkRepositoryToProjectInput = { | LinkRepositoryToProjectInputRowRequired + () }

linkRepositoryToProject :: forall r . LinkRepositoryToProjectInput -> SelectionSet Scope__LinkRepositoryToProjectPayload r -> SelectionSet Scope__RootMutation (Maybe r)
linkRepositoryToProject input = selectionForCompositeField "linkRepositoryToProject" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LockLockableInputRowRequired r = ( input :: LockLockableInput
                                      | r
                                      )

type LockLockableInput = { | LockLockableInputRowRequired + () }

lockLockable :: forall r . LockLockableInput -> SelectionSet Scope__LockLockablePayload r -> SelectionSet Scope__RootMutation (Maybe r)
lockLockable input = selectionForCompositeField "lockLockable" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarkPullRequestReadyForReviewInputRowRequired r = ( input :: MarkPullRequestReadyForReviewInput
                                                       | r
                                                       )

type MarkPullRequestReadyForReviewInput = { | MarkPullRequestReadyForReviewInputRowRequired + () }

markPullRequestReadyForReview :: forall r . MarkPullRequestReadyForReviewInput -> SelectionSet Scope__MarkPullRequestReadyForReviewPayload r -> SelectionSet Scope__RootMutation (Maybe r)
markPullRequestReadyForReview input = selectionForCompositeField "markPullRequestReadyForReview" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MergeBranchInputRowRequired r = ( input :: MergeBranchInput
                                     | r
                                     )

type MergeBranchInput = { | MergeBranchInputRowRequired + () }

mergeBranch :: forall r . MergeBranchInput -> SelectionSet Scope__MergeBranchPayload r -> SelectionSet Scope__RootMutation (Maybe r)
mergeBranch input = selectionForCompositeField "mergeBranch" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MergePullRequestInputRowRequired r = ( input :: MergePullRequestInput
                                          | r
                                          )

type MergePullRequestInput = { | MergePullRequestInputRowRequired + () }

mergePullRequest :: forall r . MergePullRequestInput -> SelectionSet Scope__MergePullRequestPayload r -> SelectionSet Scope__RootMutation (Maybe r)
mergePullRequest input = selectionForCompositeField "mergePullRequest" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MinimizeCommentInputRowRequired r = ( input :: MinimizeCommentInput
                                         | r
                                         )

type MinimizeCommentInput = { | MinimizeCommentInputRowRequired + () }

minimizeComment :: forall r . MinimizeCommentInput -> SelectionSet Scope__MinimizeCommentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
minimizeComment input = selectionForCompositeField "minimizeComment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MoveProjectCardInputRowRequired r = ( input :: MoveProjectCardInput
                                         | r
                                         )

type MoveProjectCardInput = { | MoveProjectCardInputRowRequired + () }

moveProjectCard :: forall r . MoveProjectCardInput -> SelectionSet Scope__MoveProjectCardPayload r -> SelectionSet Scope__RootMutation (Maybe r)
moveProjectCard input = selectionForCompositeField "moveProjectCard" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MoveProjectColumnInputRowRequired r = ( input :: MoveProjectColumnInput
                                           | r
                                           )

type MoveProjectColumnInput = { | MoveProjectColumnInputRowRequired + () }

moveProjectColumn :: forall r . MoveProjectColumnInput -> SelectionSet Scope__MoveProjectColumnPayload r -> SelectionSet Scope__RootMutation (Maybe r)
moveProjectColumn input = selectionForCompositeField "moveProjectColumn" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RegenerateEnterpriseIdentityProviderRecoveryCodesInputRowRequired r = ( input :: RegenerateEnterpriseIdentityProviderRecoveryCodesInput
                                                                           | r
                                                                           )

type RegenerateEnterpriseIdentityProviderRecoveryCodesInput = { | RegenerateEnterpriseIdentityProviderRecoveryCodesInputRowRequired + () }

regenerateEnterpriseIdentityProviderRecoveryCodes :: forall r . RegenerateEnterpriseIdentityProviderRecoveryCodesInput -> SelectionSet Scope__RegenerateEnterpriseIdentityProviderRecoveryCodesPayload r -> SelectionSet Scope__RootMutation (Maybe r)
regenerateEnterpriseIdentityProviderRecoveryCodes input = selectionForCompositeField "regenerateEnterpriseIdentityProviderRecoveryCodes" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveAssigneesFromAssignableInputRowRequired r = ( input :: RemoveAssigneesFromAssignableInput
                                                       | r
                                                       )

type RemoveAssigneesFromAssignableInput = { | RemoveAssigneesFromAssignableInputRowRequired + () }

removeAssigneesFromAssignable :: forall r . RemoveAssigneesFromAssignableInput -> SelectionSet Scope__RemoveAssigneesFromAssignablePayload r -> SelectionSet Scope__RootMutation (Maybe r)
removeAssigneesFromAssignable input = selectionForCompositeField "removeAssigneesFromAssignable" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveEnterpriseAdminInputRowRequired r = ( input :: RemoveEnterpriseAdminInput
                                               | r
                                               )

type RemoveEnterpriseAdminInput = { | RemoveEnterpriseAdminInputRowRequired + () }

removeEnterpriseAdmin :: forall r . RemoveEnterpriseAdminInput -> SelectionSet Scope__RemoveEnterpriseAdminPayload r -> SelectionSet Scope__RootMutation (Maybe r)
removeEnterpriseAdmin input = selectionForCompositeField "removeEnterpriseAdmin" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveEnterpriseIdentityProviderInputRowRequired r = ( input :: RemoveEnterpriseIdentityProviderInput
                                                          | r
                                                          )

type RemoveEnterpriseIdentityProviderInput = { | RemoveEnterpriseIdentityProviderInputRowRequired + () }

removeEnterpriseIdentityProvider :: forall r . RemoveEnterpriseIdentityProviderInput -> SelectionSet Scope__RemoveEnterpriseIdentityProviderPayload r -> SelectionSet Scope__RootMutation (Maybe r)
removeEnterpriseIdentityProvider input = selectionForCompositeField "removeEnterpriseIdentityProvider" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveEnterpriseOrganizationInputRowRequired r = ( input :: RemoveEnterpriseOrganizationInput
                                                      | r
                                                      )

type RemoveEnterpriseOrganizationInput = { | RemoveEnterpriseOrganizationInputRowRequired + () }

removeEnterpriseOrganization :: forall r . RemoveEnterpriseOrganizationInput -> SelectionSet Scope__RemoveEnterpriseOrganizationPayload r -> SelectionSet Scope__RootMutation (Maybe r)
removeEnterpriseOrganization input = selectionForCompositeField "removeEnterpriseOrganization" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveLabelsFromLabelableInputRowRequired r = ( input :: RemoveLabelsFromLabelableInput
                                                   | r
                                                   )

type RemoveLabelsFromLabelableInput = { | RemoveLabelsFromLabelableInputRowRequired + () }

removeLabelsFromLabelable :: forall r . RemoveLabelsFromLabelableInput -> SelectionSet Scope__RemoveLabelsFromLabelablePayload r -> SelectionSet Scope__RootMutation (Maybe r)
removeLabelsFromLabelable input = selectionForCompositeField "removeLabelsFromLabelable" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveOutsideCollaboratorInputRowRequired r = ( input :: RemoveOutsideCollaboratorInput
                                                   | r
                                                   )

type RemoveOutsideCollaboratorInput = { | RemoveOutsideCollaboratorInputRowRequired + () }

removeOutsideCollaborator :: forall r . RemoveOutsideCollaboratorInput -> SelectionSet Scope__RemoveOutsideCollaboratorPayload r -> SelectionSet Scope__RootMutation (Maybe r)
removeOutsideCollaborator input = selectionForCompositeField "removeOutsideCollaborator" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveReactionInputRowRequired r = ( input :: RemoveReactionInput
                                        | r
                                        )

type RemoveReactionInput = { | RemoveReactionInputRowRequired + () }

removeReaction :: forall r . RemoveReactionInput -> SelectionSet Scope__RemoveReactionPayload r -> SelectionSet Scope__RootMutation (Maybe r)
removeReaction input = selectionForCompositeField "removeReaction" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveStarInputRowRequired r = ( input :: RemoveStarInput
                                    | r
                                    )

type RemoveStarInput = { | RemoveStarInputRowRequired + () }

removeStar :: forall r . RemoveStarInput -> SelectionSet Scope__RemoveStarPayload r -> SelectionSet Scope__RootMutation (Maybe r)
removeStar input = selectionForCompositeField "removeStar" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReopenIssueInputRowRequired r = ( input :: ReopenIssueInput
                                     | r
                                     )

type ReopenIssueInput = { | ReopenIssueInputRowRequired + () }

reopenIssue :: forall r . ReopenIssueInput -> SelectionSet Scope__ReopenIssuePayload r -> SelectionSet Scope__RootMutation (Maybe r)
reopenIssue input = selectionForCompositeField "reopenIssue" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReopenPullRequestInputRowRequired r = ( input :: ReopenPullRequestInput
                                           | r
                                           )

type ReopenPullRequestInput = { | ReopenPullRequestInputRowRequired + () }

reopenPullRequest :: forall r . ReopenPullRequestInput -> SelectionSet Scope__ReopenPullRequestPayload r -> SelectionSet Scope__RootMutation (Maybe r)
reopenPullRequest input = selectionForCompositeField "reopenPullRequest" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RequestReviewsInputRowRequired r = ( input :: RequestReviewsInput
                                        | r
                                        )

type RequestReviewsInput = { | RequestReviewsInputRowRequired + () }

requestReviews :: forall r . RequestReviewsInput -> SelectionSet Scope__RequestReviewsPayload r -> SelectionSet Scope__RootMutation (Maybe r)
requestReviews input = selectionForCompositeField "requestReviews" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ResolveReviewThreadInputRowRequired r = ( input :: ResolveReviewThreadInput
                                             | r
                                             )

type ResolveReviewThreadInput = { | ResolveReviewThreadInputRowRequired + () }

resolveReviewThread :: forall r . ResolveReviewThreadInput -> SelectionSet Scope__ResolveReviewThreadPayload r -> SelectionSet Scope__RootMutation (Maybe r)
resolveReviewThread input = selectionForCompositeField "resolveReviewThread" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SetEnterpriseIdentityProviderInputRowRequired r = ( input :: SetEnterpriseIdentityProviderInput
                                                       | r
                                                       )

type SetEnterpriseIdentityProviderInput = { | SetEnterpriseIdentityProviderInputRowRequired + () }

setEnterpriseIdentityProvider :: forall r . SetEnterpriseIdentityProviderInput -> SelectionSet Scope__SetEnterpriseIdentityProviderPayload r -> SelectionSet Scope__RootMutation (Maybe r)
setEnterpriseIdentityProvider input = selectionForCompositeField "setEnterpriseIdentityProvider" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SubmitPullRequestReviewInputRowRequired r = ( input :: SubmitPullRequestReviewInput
                                                 | r
                                                 )

type SubmitPullRequestReviewInput = { | SubmitPullRequestReviewInputRowRequired + () }

submitPullRequestReview :: forall r . SubmitPullRequestReviewInput -> SelectionSet Scope__SubmitPullRequestReviewPayload r -> SelectionSet Scope__RootMutation (Maybe r)
submitPullRequestReview input = selectionForCompositeField "submitPullRequestReview" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TransferIssueInputRowRequired r = ( input :: TransferIssueInput
                                       | r
                                       )

type TransferIssueInput = { | TransferIssueInputRowRequired + () }

transferIssue :: forall r . TransferIssueInput -> SelectionSet Scope__TransferIssuePayload r -> SelectionSet Scope__RootMutation (Maybe r)
transferIssue input = selectionForCompositeField "transferIssue" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnarchiveRepositoryInputRowRequired r = ( input :: UnarchiveRepositoryInput
                                             | r
                                             )

type UnarchiveRepositoryInput = { | UnarchiveRepositoryInputRowRequired + () }

unarchiveRepository :: forall r . UnarchiveRepositoryInput -> SelectionSet Scope__UnarchiveRepositoryPayload r -> SelectionSet Scope__RootMutation (Maybe r)
unarchiveRepository input = selectionForCompositeField "unarchiveRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnfollowUserInputRowRequired r = ( input :: UnfollowUserInput
                                      | r
                                      )

type UnfollowUserInput = { | UnfollowUserInputRowRequired + () }

unfollowUser :: forall r . UnfollowUserInput -> SelectionSet Scope__UnfollowUserPayload r -> SelectionSet Scope__RootMutation (Maybe r)
unfollowUser input = selectionForCompositeField "unfollowUser" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnlinkRepositoryFromProjectInputRowRequired r = ( input :: UnlinkRepositoryFromProjectInput
                                                     | r
                                                     )

type UnlinkRepositoryFromProjectInput = { | UnlinkRepositoryFromProjectInputRowRequired + () }

unlinkRepositoryFromProject :: forall r . UnlinkRepositoryFromProjectInput -> SelectionSet Scope__UnlinkRepositoryFromProjectPayload r -> SelectionSet Scope__RootMutation (Maybe r)
unlinkRepositoryFromProject input = selectionForCompositeField "unlinkRepositoryFromProject" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnlockLockableInputRowRequired r = ( input :: UnlockLockableInput
                                        | r
                                        )

type UnlockLockableInput = { | UnlockLockableInputRowRequired + () }

unlockLockable :: forall r . UnlockLockableInput -> SelectionSet Scope__UnlockLockablePayload r -> SelectionSet Scope__RootMutation (Maybe r)
unlockLockable input = selectionForCompositeField "unlockLockable" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnmarkIssueAsDuplicateInputRowRequired r = ( input :: UnmarkIssueAsDuplicateInput
                                                | r
                                                )

type UnmarkIssueAsDuplicateInput = { | UnmarkIssueAsDuplicateInputRowRequired + () }

unmarkIssueAsDuplicate :: forall r . UnmarkIssueAsDuplicateInput -> SelectionSet Scope__UnmarkIssueAsDuplicatePayload r -> SelectionSet Scope__RootMutation (Maybe r)
unmarkIssueAsDuplicate input = selectionForCompositeField "unmarkIssueAsDuplicate" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnminimizeCommentInputRowRequired r = ( input :: UnminimizeCommentInput
                                           | r
                                           )

type UnminimizeCommentInput = { | UnminimizeCommentInputRowRequired + () }

unminimizeComment :: forall r . UnminimizeCommentInput -> SelectionSet Scope__UnminimizeCommentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
unminimizeComment input = selectionForCompositeField "unminimizeComment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnresolveReviewThreadInputRowRequired r = ( input :: UnresolveReviewThreadInput
                                               | r
                                               )

type UnresolveReviewThreadInput = { | UnresolveReviewThreadInputRowRequired + () }

unresolveReviewThread :: forall r . UnresolveReviewThreadInput -> SelectionSet Scope__UnresolveReviewThreadPayload r -> SelectionSet Scope__RootMutation (Maybe r)
unresolveReviewThread input = selectionForCompositeField "unresolveReviewThread" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateBranchProtectionRuleInputRowRequired r = ( input :: UpdateBranchProtectionRuleInput
                                                    | r
                                                    )

type UpdateBranchProtectionRuleInput = { | UpdateBranchProtectionRuleInputRowRequired + () }

updateBranchProtectionRule :: forall r . UpdateBranchProtectionRuleInput -> SelectionSet Scope__UpdateBranchProtectionRulePayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateBranchProtectionRule input = selectionForCompositeField "updateBranchProtectionRule" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseActionExecutionCapabilitySettingInputRowRequired r = ( input :: UpdateEnterpriseActionExecutionCapabilitySettingInput
                                                                          | r
                                                                          )

type UpdateEnterpriseActionExecutionCapabilitySettingInput = { | UpdateEnterpriseActionExecutionCapabilitySettingInputRowRequired + () }

updateEnterpriseActionExecutionCapabilitySetting :: forall r . UpdateEnterpriseActionExecutionCapabilitySettingInput -> SelectionSet Scope__UpdateEnterpriseActionExecutionCapabilitySettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseActionExecutionCapabilitySetting input = selectionForCompositeField "updateEnterpriseActionExecutionCapabilitySetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseAdministratorRoleInputRowRequired r = ( input :: UpdateEnterpriseAdministratorRoleInput
                                                           | r
                                                           )

type UpdateEnterpriseAdministratorRoleInput = { | UpdateEnterpriseAdministratorRoleInputRowRequired + () }

updateEnterpriseAdministratorRole :: forall r . UpdateEnterpriseAdministratorRoleInput -> SelectionSet Scope__UpdateEnterpriseAdministratorRolePayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseAdministratorRole input = selectionForCompositeField "updateEnterpriseAdministratorRole" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseAllowPrivateRepositoryForkingSettingInputRowRequired r = ( input :: UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
                                                                              | r
                                                                              )

type UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput = { | UpdateEnterpriseAllowPrivateRepositoryForkingSettingInputRowRequired + () }

updateEnterpriseAllowPrivateRepositoryForkingSetting :: forall r . UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput -> SelectionSet Scope__UpdateEnterpriseAllowPrivateRepositoryForkingSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseAllowPrivateRepositoryForkingSetting input = selectionForCompositeField "updateEnterpriseAllowPrivateRepositoryForkingSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseDefaultRepositoryPermissionSettingInputRowRequired r = ( input :: UpdateEnterpriseDefaultRepositoryPermissionSettingInput
                                                                            | r
                                                                            )

type UpdateEnterpriseDefaultRepositoryPermissionSettingInput = { | UpdateEnterpriseDefaultRepositoryPermissionSettingInputRowRequired + () }

updateEnterpriseDefaultRepositoryPermissionSetting :: forall r . UpdateEnterpriseDefaultRepositoryPermissionSettingInput -> SelectionSet Scope__UpdateEnterpriseDefaultRepositoryPermissionSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseDefaultRepositoryPermissionSetting input = selectionForCompositeField "updateEnterpriseDefaultRepositoryPermissionSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInputRowRequired r = ( input :: UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
                                                                                     | r
                                                                                     )

type UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput = { | UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInputRowRequired + () }

updateEnterpriseMembersCanChangeRepositoryVisibilitySetting :: forall r . UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput -> SelectionSet Scope__UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanChangeRepositoryVisibilitySetting input = selectionForCompositeField "updateEnterpriseMembersCanChangeRepositoryVisibilitySetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanCreateRepositoriesSettingInputRowRequired r = ( input :: UpdateEnterpriseMembersCanCreateRepositoriesSettingInput
                                                                             | r
                                                                             )

type UpdateEnterpriseMembersCanCreateRepositoriesSettingInput = { | UpdateEnterpriseMembersCanCreateRepositoriesSettingInputRowRequired + () }

updateEnterpriseMembersCanCreateRepositoriesSetting :: forall r . UpdateEnterpriseMembersCanCreateRepositoriesSettingInput -> SelectionSet Scope__UpdateEnterpriseMembersCanCreateRepositoriesSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanCreateRepositoriesSetting input = selectionForCompositeField "updateEnterpriseMembersCanCreateRepositoriesSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanDeleteIssuesSettingInputRowRequired r = ( input :: UpdateEnterpriseMembersCanDeleteIssuesSettingInput
                                                                       | r
                                                                       )

type UpdateEnterpriseMembersCanDeleteIssuesSettingInput = { | UpdateEnterpriseMembersCanDeleteIssuesSettingInputRowRequired + () }

updateEnterpriseMembersCanDeleteIssuesSetting :: forall r . UpdateEnterpriseMembersCanDeleteIssuesSettingInput -> SelectionSet Scope__UpdateEnterpriseMembersCanDeleteIssuesSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanDeleteIssuesSetting input = selectionForCompositeField "updateEnterpriseMembersCanDeleteIssuesSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanDeleteRepositoriesSettingInputRowRequired r = ( input :: UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
                                                                             | r
                                                                             )

type UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput = { | UpdateEnterpriseMembersCanDeleteRepositoriesSettingInputRowRequired + () }

updateEnterpriseMembersCanDeleteRepositoriesSetting :: forall r . UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput -> SelectionSet Scope__UpdateEnterpriseMembersCanDeleteRepositoriesSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanDeleteRepositoriesSetting input = selectionForCompositeField "updateEnterpriseMembersCanDeleteRepositoriesSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanInviteCollaboratorsSettingInputRowRequired r = ( input :: UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
                                                                              | r
                                                                              )

type UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput = { | UpdateEnterpriseMembersCanInviteCollaboratorsSettingInputRowRequired + () }

updateEnterpriseMembersCanInviteCollaboratorsSetting :: forall r . UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput -> SelectionSet Scope__UpdateEnterpriseMembersCanInviteCollaboratorsSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanInviteCollaboratorsSetting input = selectionForCompositeField "updateEnterpriseMembersCanInviteCollaboratorsSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanMakePurchasesSettingInputRowRequired r = ( input :: UpdateEnterpriseMembersCanMakePurchasesSettingInput
                                                                        | r
                                                                        )

type UpdateEnterpriseMembersCanMakePurchasesSettingInput = { | UpdateEnterpriseMembersCanMakePurchasesSettingInputRowRequired + () }

updateEnterpriseMembersCanMakePurchasesSetting :: forall r . UpdateEnterpriseMembersCanMakePurchasesSettingInput -> SelectionSet Scope__UpdateEnterpriseMembersCanMakePurchasesSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanMakePurchasesSetting input = selectionForCompositeField "updateEnterpriseMembersCanMakePurchasesSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInputRowRequired r = ( input :: UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
                                                                                  | r
                                                                                  )

type UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput = { | UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInputRowRequired + () }

updateEnterpriseMembersCanUpdateProtectedBranchesSetting :: forall r . UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput -> SelectionSet Scope__UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanUpdateProtectedBranchesSetting input = selectionForCompositeField "updateEnterpriseMembersCanUpdateProtectedBranchesSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanViewDependencyInsightsSettingInputRowRequired r = ( input :: UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
                                                                                 | r
                                                                                 )

type UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput = { | UpdateEnterpriseMembersCanViewDependencyInsightsSettingInputRowRequired + () }

updateEnterpriseMembersCanViewDependencyInsightsSetting :: forall r . UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput -> SelectionSet Scope__UpdateEnterpriseMembersCanViewDependencyInsightsSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanViewDependencyInsightsSetting input = selectionForCompositeField "updateEnterpriseMembersCanViewDependencyInsightsSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseOrganizationProjectsSettingInputRowRequired r = ( input :: UpdateEnterpriseOrganizationProjectsSettingInput
                                                                     | r
                                                                     )

type UpdateEnterpriseOrganizationProjectsSettingInput = { | UpdateEnterpriseOrganizationProjectsSettingInputRowRequired + () }

updateEnterpriseOrganizationProjectsSetting :: forall r . UpdateEnterpriseOrganizationProjectsSettingInput -> SelectionSet Scope__UpdateEnterpriseOrganizationProjectsSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseOrganizationProjectsSetting input = selectionForCompositeField "updateEnterpriseOrganizationProjectsSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseProfileInputRowRequired r = ( input :: UpdateEnterpriseProfileInput
                                                 | r
                                                 )

type UpdateEnterpriseProfileInput = { | UpdateEnterpriseProfileInputRowRequired + () }

updateEnterpriseProfile :: forall r . UpdateEnterpriseProfileInput -> SelectionSet Scope__UpdateEnterpriseProfilePayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseProfile input = selectionForCompositeField "updateEnterpriseProfile" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseRepositoryProjectsSettingInputRowRequired r = ( input :: UpdateEnterpriseRepositoryProjectsSettingInput
                                                                   | r
                                                                   )

type UpdateEnterpriseRepositoryProjectsSettingInput = { | UpdateEnterpriseRepositoryProjectsSettingInputRowRequired + () }

updateEnterpriseRepositoryProjectsSetting :: forall r . UpdateEnterpriseRepositoryProjectsSettingInput -> SelectionSet Scope__UpdateEnterpriseRepositoryProjectsSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseRepositoryProjectsSetting input = selectionForCompositeField "updateEnterpriseRepositoryProjectsSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseTeamDiscussionsSettingInputRowRequired r = ( input :: UpdateEnterpriseTeamDiscussionsSettingInput
                                                                | r
                                                                )

type UpdateEnterpriseTeamDiscussionsSettingInput = { | UpdateEnterpriseTeamDiscussionsSettingInputRowRequired + () }

updateEnterpriseTeamDiscussionsSetting :: forall r . UpdateEnterpriseTeamDiscussionsSettingInput -> SelectionSet Scope__UpdateEnterpriseTeamDiscussionsSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseTeamDiscussionsSetting input = selectionForCompositeField "updateEnterpriseTeamDiscussionsSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInputRowRequired r = ( input :: UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
                                                                                | r
                                                                                )

type UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput = { | UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInputRowRequired + () }

updateEnterpriseTwoFactorAuthenticationRequiredSetting :: forall r . UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput -> SelectionSet Scope__UpdateEnterpriseTwoFactorAuthenticationRequiredSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseTwoFactorAuthenticationRequiredSetting input = selectionForCompositeField "updateEnterpriseTwoFactorAuthenticationRequiredSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateIpAllowListEnabledSettingInputRowRequired r = ( input :: UpdateIpAllowListEnabledSettingInput
                                                         | r
                                                         )

type UpdateIpAllowListEnabledSettingInput = { | UpdateIpAllowListEnabledSettingInputRowRequired + () }

updateIpAllowListEnabledSetting :: forall r . UpdateIpAllowListEnabledSettingInput -> SelectionSet Scope__UpdateIpAllowListEnabledSettingPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateIpAllowListEnabledSetting input = selectionForCompositeField "updateIpAllowListEnabledSetting" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateIpAllowListEntryInputRowRequired r = ( input :: UpdateIpAllowListEntryInput
                                                | r
                                                )

type UpdateIpAllowListEntryInput = { | UpdateIpAllowListEntryInputRowRequired + () }

updateIpAllowListEntry :: forall r . UpdateIpAllowListEntryInput -> SelectionSet Scope__UpdateIpAllowListEntryPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateIpAllowListEntry input = selectionForCompositeField "updateIpAllowListEntry" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateIssueInputRowRequired r = ( input :: UpdateIssueInput
                                     | r
                                     )

type UpdateIssueInput = { | UpdateIssueInputRowRequired + () }

updateIssue :: forall r . UpdateIssueInput -> SelectionSet Scope__UpdateIssuePayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateIssue input = selectionForCompositeField "updateIssue" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateIssueCommentInputRowRequired r = ( input :: UpdateIssueCommentInput
                                            | r
                                            )

type UpdateIssueCommentInput = { | UpdateIssueCommentInputRowRequired + () }

updateIssueComment :: forall r . UpdateIssueCommentInput -> SelectionSet Scope__UpdateIssueCommentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateIssueComment input = selectionForCompositeField "updateIssueComment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateProjectInputRowRequired r = ( input :: UpdateProjectInput
                                       | r
                                       )

type UpdateProjectInput = { | UpdateProjectInputRowRequired + () }

updateProject :: forall r . UpdateProjectInput -> SelectionSet Scope__UpdateProjectPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateProject input = selectionForCompositeField "updateProject" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateProjectCardInputRowRequired r = ( input :: UpdateProjectCardInput
                                           | r
                                           )

type UpdateProjectCardInput = { | UpdateProjectCardInputRowRequired + () }

updateProjectCard :: forall r . UpdateProjectCardInput -> SelectionSet Scope__UpdateProjectCardPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateProjectCard input = selectionForCompositeField "updateProjectCard" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateProjectColumnInputRowRequired r = ( input :: UpdateProjectColumnInput
                                             | r
                                             )

type UpdateProjectColumnInput = { | UpdateProjectColumnInputRowRequired + () }

updateProjectColumn :: forall r . UpdateProjectColumnInput -> SelectionSet Scope__UpdateProjectColumnPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateProjectColumn input = selectionForCompositeField "updateProjectColumn" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdatePullRequestInputRowRequired r = ( input :: UpdatePullRequestInput
                                           | r
                                           )

type UpdatePullRequestInput = { | UpdatePullRequestInputRowRequired + () }

updatePullRequest :: forall r . UpdatePullRequestInput -> SelectionSet Scope__UpdatePullRequestPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updatePullRequest input = selectionForCompositeField "updatePullRequest" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdatePullRequestReviewInputRowRequired r = ( input :: UpdatePullRequestReviewInput
                                                 | r
                                                 )

type UpdatePullRequestReviewInput = { | UpdatePullRequestReviewInputRowRequired + () }

updatePullRequestReview :: forall r . UpdatePullRequestReviewInput -> SelectionSet Scope__UpdatePullRequestReviewPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updatePullRequestReview input = selectionForCompositeField "updatePullRequestReview" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdatePullRequestReviewCommentInputRowRequired r = ( input :: UpdatePullRequestReviewCommentInput
                                                        | r
                                                        )

type UpdatePullRequestReviewCommentInput = { | UpdatePullRequestReviewCommentInputRowRequired + () }

updatePullRequestReviewComment :: forall r . UpdatePullRequestReviewCommentInput -> SelectionSet Scope__UpdatePullRequestReviewCommentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updatePullRequestReviewComment input = selectionForCompositeField "updatePullRequestReviewComment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateRefInputRowRequired r = ( input :: UpdateRefInput
                                   | r
                                   )

type UpdateRefInput = { | UpdateRefInputRowRequired + () }

updateRef :: forall r . UpdateRefInput -> SelectionSet Scope__UpdateRefPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateRef input = selectionForCompositeField "updateRef" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateRepositoryInputRowRequired r = ( input :: UpdateRepositoryInput
                                          | r
                                          )

type UpdateRepositoryInput = { | UpdateRepositoryInputRowRequired + () }

updateRepository :: forall r . UpdateRepositoryInput -> SelectionSet Scope__UpdateRepositoryPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateRepository input = selectionForCompositeField "updateRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateSubscriptionInputRowRequired r = ( input :: UpdateSubscriptionInput
                                            | r
                                            )

type UpdateSubscriptionInput = { | UpdateSubscriptionInputRowRequired + () }

updateSubscription :: forall r . UpdateSubscriptionInput -> SelectionSet Scope__UpdateSubscriptionPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateSubscription input = selectionForCompositeField "updateSubscription" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateTeamDiscussionInputRowRequired r = ( input :: UpdateTeamDiscussionInput
                                              | r
                                              )

type UpdateTeamDiscussionInput = { | UpdateTeamDiscussionInputRowRequired + () }

updateTeamDiscussion :: forall r . UpdateTeamDiscussionInput -> SelectionSet Scope__UpdateTeamDiscussionPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateTeamDiscussion input = selectionForCompositeField "updateTeamDiscussion" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateTeamDiscussionCommentInputRowRequired r = ( input :: UpdateTeamDiscussionCommentInput
                                                     | r
                                                     )

type UpdateTeamDiscussionCommentInput = { | UpdateTeamDiscussionCommentInputRowRequired + () }

updateTeamDiscussionComment :: forall r . UpdateTeamDiscussionCommentInput -> SelectionSet Scope__UpdateTeamDiscussionCommentPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateTeamDiscussionComment input = selectionForCompositeField "updateTeamDiscussionComment" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateTopicsInputRowRequired r = ( input :: UpdateTopicsInput
                                      | r
                                      )

type UpdateTopicsInput = { | UpdateTopicsInputRowRequired + () }

updateTopics :: forall r . UpdateTopicsInput -> SelectionSet Scope__UpdateTopicsPayload r -> SelectionSet Scope__RootMutation (Maybe r)
updateTopics input = selectionForCompositeField "updateTopics" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer
