module Examples.Github.Mutation where

import Examples.Github.InputObject
  ( AbortQueuedMigrationsInput
  , AcceptEnterpriseAdministratorInvitationInput
  , AcceptTopicSuggestionInput
  , AddAssigneesToAssignableInput
  , AddCommentInput
  , AddDiscussionCommentInput
  , AddEnterpriseSupportEntitlementInput
  , AddLabelsToLabelableInput
  , AddProjectCardInput
  , AddProjectColumnInput
  , AddProjectNextItemInput
  , AddPullRequestReviewInput
  , AddPullRequestReviewCommentInput
  , AddPullRequestReviewThreadInput
  , AddReactionInput
  , AddStarInput
  , AddUpvoteInput
  , AddVerifiableDomainInput
  , ApproveDeploymentsInput
  , ApproveVerifiableDomainInput
  , ArchiveRepositoryInput
  , CancelEnterpriseAdminInvitationInput
  , CancelSponsorshipInput
  , ChangeUserStatusInput
  , ClearLabelsFromLabelableInput
  , CloneProjectInput
  , CloneTemplateRepositoryInput
  , CloseIssueInput
  , ClosePullRequestInput
  , ConvertProjectCardNoteToIssueInput
  , ConvertPullRequestToDraftInput
  , CreateBranchProtectionRuleInput
  , CreateCheckRunInput
  , CreateCheckSuiteInput
  , CreateCommitOnBranchInput
  , CreateDiscussionInput
  , CreateEnterpriseOrganizationInput
  , CreateEnvironmentInput
  , CreateIpAllowListEntryInput
  , CreateIssueInput
  , CreateMigrationSourceInput
  , CreateProjectInput
  , CreatePullRequestInput
  , CreateRefInput
  , CreateRepositoryInput
  , CreateSponsorshipInput
  , CreateTeamDiscussionInput
  , CreateTeamDiscussionCommentInput
  , DeclineTopicSuggestionInput
  , DeleteBranchProtectionRuleInput
  , DeleteDeploymentInput
  , DeleteDiscussionInput
  , DeleteDiscussionCommentInput
  , DeleteEnvironmentInput
  , DeleteIpAllowListEntryInput
  , DeleteIssueInput
  , DeleteIssueCommentInput
  , DeleteProjectInput
  , DeleteProjectCardInput
  , DeleteProjectColumnInput
  , DeleteProjectNextItemInput
  , DeletePullRequestReviewInput
  , DeletePullRequestReviewCommentInput
  , DeleteRefInput
  , DeleteTeamDiscussionInput
  , DeleteTeamDiscussionCommentInput
  , DeleteVerifiableDomainInput
  , DisablePullRequestAutoMergeInput
  , DismissPullRequestReviewInput
  , DismissRepositoryVulnerabilityAlertInput
  , EnablePullRequestAutoMergeInput
  , FollowUserInput
  , GrantEnterpriseOrganizationsMigratorRoleInput
  , GrantMigratorRoleInput
  , InviteEnterpriseAdminInput
  , LinkRepositoryToProjectInput
  , LockLockableInput
  , MarkDiscussionCommentAsAnswerInput
  , MarkFileAsViewedInput
  , MarkPullRequestReadyForReviewInput
  , MergeBranchInput
  , MergePullRequestInput
  , MinimizeCommentInput
  , MoveProjectCardInput
  , MoveProjectColumnInput
  , PinIssueInput
  , RegenerateEnterpriseIdentityProviderRecoveryCodesInput
  , RegenerateVerifiableDomainTokenInput
  , RejectDeploymentsInput
  , RemoveAssigneesFromAssignableInput
  , RemoveEnterpriseAdminInput
  , RemoveEnterpriseIdentityProviderInput
  , RemoveEnterpriseOrganizationInput
  , RemoveEnterpriseSupportEntitlementInput
  , RemoveLabelsFromLabelableInput
  , RemoveOutsideCollaboratorInput
  , RemoveReactionInput
  , RemoveStarInput
  , RemoveUpvoteInput
  , ReopenIssueInput
  , ReopenPullRequestInput
  , RequestReviewsInput
  , RerequestCheckSuiteInput
  , ResolveReviewThreadInput
  , RevokeEnterpriseOrganizationsMigratorRoleInput
  , RevokeMigratorRoleInput
  , SetEnterpriseIdentityProviderInput
  , SetOrganizationInteractionLimitInput
  , SetRepositoryInteractionLimitInput
  , SetUserInteractionLimitInput
  , StartRepositoryMigrationInput
  , SubmitPullRequestReviewInput
  , TransferIssueInput
  , UnarchiveRepositoryInput
  , UnfollowUserInput
  , UnlinkRepositoryFromProjectInput
  , UnlockLockableInput
  , UnmarkDiscussionCommentAsAnswerInput
  , UnmarkFileAsViewedInput
  , UnmarkIssueAsDuplicateInput
  , UnminimizeCommentInput
  , UnpinIssueInput
  , UnresolveReviewThreadInput
  , UpdateBranchProtectionRuleInput
  , UpdateCheckRunInput
  , UpdateCheckSuitePreferencesInput
  , UpdateDiscussionInput
  , UpdateDiscussionCommentInput
  , UpdateEnterpriseAdministratorRoleInput
  , UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
  , UpdateEnterpriseDefaultRepositoryPermissionSettingInput
  , UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
  , UpdateEnterpriseMembersCanCreateRepositoriesSettingInput
  , UpdateEnterpriseMembersCanDeleteIssuesSettingInput
  , UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
  , UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
  , UpdateEnterpriseMembersCanMakePurchasesSettingInput
  , UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
  , UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
  , UpdateEnterpriseOrganizationProjectsSettingInput
  , UpdateEnterpriseOwnerOrganizationRoleInput
  , UpdateEnterpriseProfileInput
  , UpdateEnterpriseRepositoryProjectsSettingInput
  , UpdateEnterpriseTeamDiscussionsSettingInput
  , UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
  , UpdateEnvironmentInput
  , UpdateIpAllowListEnabledSettingInput
  , UpdateIpAllowListEntryInput
  , UpdateIpAllowListForInstalledAppsEnabledSettingInput
  , UpdateIssueInput
  , UpdateIssueCommentInput
  , UpdateNotificationRestrictionSettingInput
  , UpdateOrganizationAllowPrivateRepositoryForkingSettingInput
  , UpdateProjectInput
  , UpdateProjectCardInput
  , UpdateProjectColumnInput
  , UpdateProjectNextItemFieldInput
  , UpdatePullRequestInput
  , UpdatePullRequestBranchInput
  , UpdatePullRequestReviewInput
  , UpdatePullRequestReviewCommentInput
  , UpdateRefInput
  , UpdateRepositoryInput
  , UpdateSponsorshipPreferencesInput
  , UpdateSubscriptionInput
  , UpdateTeamDiscussionInput
  , UpdateTeamDiscussionCommentInput
  , UpdateTopicsInput
  , VerifyVerifiableDomainInput
  ) as Examples.Github.InputObject
import Type.Row (type (+))
import GraphQLClient
  ( SelectionSet
  , Scope__RootMutation
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__AbortQueuedMigrationsPayload
  , Scope__AcceptEnterpriseAdministratorInvitationPayload
  , Scope__AcceptTopicSuggestionPayload
  , Scope__AddAssigneesToAssignablePayload
  , Scope__AddCommentPayload
  , Scope__AddDiscussionCommentPayload
  , Scope__AddEnterpriseSupportEntitlementPayload
  , Scope__AddLabelsToLabelablePayload
  , Scope__AddProjectCardPayload
  , Scope__AddProjectColumnPayload
  , Scope__AddProjectNextItemPayload
  , Scope__AddPullRequestReviewPayload
  , Scope__AddPullRequestReviewCommentPayload
  , Scope__AddPullRequestReviewThreadPayload
  , Scope__AddReactionPayload
  , Scope__AddStarPayload
  , Scope__AddUpvotePayload
  , Scope__AddVerifiableDomainPayload
  , Scope__ApproveDeploymentsPayload
  , Scope__ApproveVerifiableDomainPayload
  , Scope__ArchiveRepositoryPayload
  , Scope__CancelEnterpriseAdminInvitationPayload
  , Scope__CancelSponsorshipPayload
  , Scope__ChangeUserStatusPayload
  , Scope__ClearLabelsFromLabelablePayload
  , Scope__CloneProjectPayload
  , Scope__CloneTemplateRepositoryPayload
  , Scope__CloseIssuePayload
  , Scope__ClosePullRequestPayload
  , Scope__ConvertProjectCardNoteToIssuePayload
  , Scope__ConvertPullRequestToDraftPayload
  , Scope__CreateBranchProtectionRulePayload
  , Scope__CreateCheckRunPayload
  , Scope__CreateCheckSuitePayload
  , Scope__CreateCommitOnBranchPayload
  , Scope__CreateDiscussionPayload
  , Scope__CreateEnterpriseOrganizationPayload
  , Scope__CreateEnvironmentPayload
  , Scope__CreateIpAllowListEntryPayload
  , Scope__CreateIssuePayload
  , Scope__CreateMigrationSourcePayload
  , Scope__CreateProjectPayload
  , Scope__CreatePullRequestPayload
  , Scope__CreateRefPayload
  , Scope__CreateRepositoryPayload
  , Scope__CreateSponsorshipPayload
  , Scope__CreateTeamDiscussionPayload
  , Scope__CreateTeamDiscussionCommentPayload
  , Scope__DeclineTopicSuggestionPayload
  , Scope__DeleteBranchProtectionRulePayload
  , Scope__DeleteDeploymentPayload
  , Scope__DeleteDiscussionPayload
  , Scope__DeleteDiscussionCommentPayload
  , Scope__DeleteEnvironmentPayload
  , Scope__DeleteIpAllowListEntryPayload
  , Scope__DeleteIssuePayload
  , Scope__DeleteIssueCommentPayload
  , Scope__DeleteProjectPayload
  , Scope__DeleteProjectCardPayload
  , Scope__DeleteProjectColumnPayload
  , Scope__DeleteProjectNextItemPayload
  , Scope__DeletePullRequestReviewPayload
  , Scope__DeletePullRequestReviewCommentPayload
  , Scope__DeleteRefPayload
  , Scope__DeleteTeamDiscussionPayload
  , Scope__DeleteTeamDiscussionCommentPayload
  , Scope__DeleteVerifiableDomainPayload
  , Scope__DisablePullRequestAutoMergePayload
  , Scope__DismissPullRequestReviewPayload
  , Scope__DismissRepositoryVulnerabilityAlertPayload
  , Scope__EnablePullRequestAutoMergePayload
  , Scope__FollowUserPayload
  , Scope__GrantEnterpriseOrganizationsMigratorRolePayload
  , Scope__GrantMigratorRolePayload
  , Scope__InviteEnterpriseAdminPayload
  , Scope__LinkRepositoryToProjectPayload
  , Scope__LockLockablePayload
  , Scope__MarkDiscussionCommentAsAnswerPayload
  , Scope__MarkFileAsViewedPayload
  , Scope__MarkPullRequestReadyForReviewPayload
  , Scope__MergeBranchPayload
  , Scope__MergePullRequestPayload
  , Scope__MinimizeCommentPayload
  , Scope__MoveProjectCardPayload
  , Scope__MoveProjectColumnPayload
  , Scope__PinIssuePayload
  , Scope__RegenerateEnterpriseIdentityProviderRecoveryCodesPayload
  , Scope__RegenerateVerifiableDomainTokenPayload
  , Scope__RejectDeploymentsPayload
  , Scope__RemoveAssigneesFromAssignablePayload
  , Scope__RemoveEnterpriseAdminPayload
  , Scope__RemoveEnterpriseIdentityProviderPayload
  , Scope__RemoveEnterpriseOrganizationPayload
  , Scope__RemoveEnterpriseSupportEntitlementPayload
  , Scope__RemoveLabelsFromLabelablePayload
  , Scope__RemoveOutsideCollaboratorPayload
  , Scope__RemoveReactionPayload
  , Scope__RemoveStarPayload
  , Scope__RemoveUpvotePayload
  , Scope__ReopenIssuePayload
  , Scope__ReopenPullRequestPayload
  , Scope__RequestReviewsPayload
  , Scope__RerequestCheckSuitePayload
  , Scope__ResolveReviewThreadPayload
  , Scope__RevokeEnterpriseOrganizationsMigratorRolePayload
  , Scope__RevokeMigratorRolePayload
  , Scope__SetEnterpriseIdentityProviderPayload
  , Scope__SetOrganizationInteractionLimitPayload
  , Scope__SetRepositoryInteractionLimitPayload
  , Scope__SetUserInteractionLimitPayload
  , Scope__StartRepositoryMigrationPayload
  , Scope__SubmitPullRequestReviewPayload
  , Scope__TransferIssuePayload
  , Scope__UnarchiveRepositoryPayload
  , Scope__UnfollowUserPayload
  , Scope__UnlinkRepositoryFromProjectPayload
  , Scope__UnlockLockablePayload
  , Scope__UnmarkDiscussionCommentAsAnswerPayload
  , Scope__UnmarkFileAsViewedPayload
  , Scope__UnmarkIssueAsDuplicatePayload
  , Scope__UnminimizeCommentPayload
  , Scope__UnpinIssuePayload
  , Scope__UnresolveReviewThreadPayload
  , Scope__UpdateBranchProtectionRulePayload
  , Scope__UpdateCheckRunPayload
  , Scope__UpdateCheckSuitePreferencesPayload
  , Scope__UpdateDiscussionPayload
  , Scope__UpdateDiscussionCommentPayload
  , Scope__UpdateEnterpriseAdministratorRolePayload
  , Scope__UpdateEnterpriseAllowPrivateRepositoryForkingSettingPayload
  , Scope__UpdateEnterpriseDefaultRepositoryPermissionSettingPayload
  , Scope__UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingPayload
  , Scope__UpdateEnterpriseMembersCanCreateRepositoriesSettingPayload
  , Scope__UpdateEnterpriseMembersCanDeleteIssuesSettingPayload
  , Scope__UpdateEnterpriseMembersCanDeleteRepositoriesSettingPayload
  , Scope__UpdateEnterpriseMembersCanInviteCollaboratorsSettingPayload
  , Scope__UpdateEnterpriseMembersCanMakePurchasesSettingPayload
  , Scope__UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingPayload
  , Scope__UpdateEnterpriseMembersCanViewDependencyInsightsSettingPayload
  , Scope__UpdateEnterpriseOrganizationProjectsSettingPayload
  , Scope__UpdateEnterpriseOwnerOrganizationRolePayload
  , Scope__UpdateEnterpriseProfilePayload
  , Scope__UpdateEnterpriseRepositoryProjectsSettingPayload
  , Scope__UpdateEnterpriseTeamDiscussionsSettingPayload
  , Scope__UpdateEnterpriseTwoFactorAuthenticationRequiredSettingPayload
  , Scope__UpdateEnvironmentPayload
  , Scope__UpdateIpAllowListEnabledSettingPayload
  , Scope__UpdateIpAllowListEntryPayload
  , Scope__UpdateIpAllowListForInstalledAppsEnabledSettingPayload
  , Scope__UpdateIssuePayload
  , Scope__UpdateIssueCommentPayload
  , Scope__UpdateNotificationRestrictionSettingPayload
  , Scope__UpdateOrganizationAllowPrivateRepositoryForkingSettingPayload
  , Scope__UpdateProjectPayload
  , Scope__UpdateProjectCardPayload
  , Scope__UpdateProjectColumnPayload
  , Scope__UpdateProjectNextItemFieldPayload
  , Scope__UpdatePullRequestPayload
  , Scope__UpdatePullRequestBranchPayload
  , Scope__UpdatePullRequestReviewPayload
  , Scope__UpdatePullRequestReviewCommentPayload
  , Scope__UpdateRefPayload
  , Scope__UpdateRepositoryPayload
  , Scope__UpdateSponsorshipPreferencesPayload
  , Scope__UpdateSubscriptionPayload
  , Scope__UpdateTeamDiscussionPayload
  , Scope__UpdateTeamDiscussionCommentPayload
  , Scope__UpdateTopicsPayload
  , Scope__VerifyVerifiableDomainPayload
  )
import Data.Maybe (Maybe)

type AbortQueuedMigrationsInputRowRequired r
  = ( input :: Examples.Github.InputObject.AbortQueuedMigrationsInput | r )

type AbortQueuedMigrationsInput
  = { | AbortQueuedMigrationsInputRowRequired + () }

abortQueuedMigrations
  :: forall r
   . AbortQueuedMigrationsInput
  -> SelectionSet Scope__AbortQueuedMigrationsPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
abortQueuedMigrations input = selectionForCompositeField
                              "abortQueuedMigrations"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AcceptEnterpriseAdministratorInvitationInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.AcceptEnterpriseAdministratorInvitationInput
    | r
    )

type AcceptEnterpriseAdministratorInvitationInput
  = { | AcceptEnterpriseAdministratorInvitationInputRowRequired + () }

acceptEnterpriseAdministratorInvitation
  :: forall r
   . AcceptEnterpriseAdministratorInvitationInput
  -> SelectionSet Scope__AcceptEnterpriseAdministratorInvitationPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
acceptEnterpriseAdministratorInvitation input = selectionForCompositeField
                                                "acceptEnterpriseAdministratorInvitation"
                                                (toGraphQLArguments
                                                 input)
                                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AcceptTopicSuggestionInputRowRequired r
  = ( input :: Examples.Github.InputObject.AcceptTopicSuggestionInput | r )

type AcceptTopicSuggestionInput
  = { | AcceptTopicSuggestionInputRowRequired + () }

acceptTopicSuggestion
  :: forall r
   . AcceptTopicSuggestionInput
  -> SelectionSet Scope__AcceptTopicSuggestionPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
acceptTopicSuggestion input = selectionForCompositeField
                              "acceptTopicSuggestion"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddAssigneesToAssignableInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddAssigneesToAssignableInput | r )

type AddAssigneesToAssignableInput
  = { | AddAssigneesToAssignableInputRowRequired + () }

addAssigneesToAssignable
  :: forall r
   . AddAssigneesToAssignableInput
  -> SelectionSet Scope__AddAssigneesToAssignablePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addAssigneesToAssignable input = selectionForCompositeField
                                 "addAssigneesToAssignable"
                                 (toGraphQLArguments
                                  input)
                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddCommentInput | r )

type AddCommentInput = { | AddCommentInputRowRequired + () }

addComment
  :: forall r
   . AddCommentInput
  -> SelectionSet Scope__AddCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addComment input = selectionForCompositeField
                   "addComment"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddDiscussionCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddDiscussionCommentInput | r )

type AddDiscussionCommentInput = { | AddDiscussionCommentInputRowRequired + () }

addDiscussionComment
  :: forall r
   . AddDiscussionCommentInput
  -> SelectionSet Scope__AddDiscussionCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addDiscussionComment input = selectionForCompositeField
                             "addDiscussionComment"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddEnterpriseSupportEntitlementInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddEnterpriseSupportEntitlementInput
    | r
    )

type AddEnterpriseSupportEntitlementInput
  = { | AddEnterpriseSupportEntitlementInputRowRequired + () }

addEnterpriseSupportEntitlement
  :: forall r
   . AddEnterpriseSupportEntitlementInput
  -> SelectionSet Scope__AddEnterpriseSupportEntitlementPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addEnterpriseSupportEntitlement input = selectionForCompositeField
                                        "addEnterpriseSupportEntitlement"
                                        (toGraphQLArguments
                                         input)
                                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddLabelsToLabelableInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddLabelsToLabelableInput | r )

type AddLabelsToLabelableInput = { | AddLabelsToLabelableInputRowRequired + () }

addLabelsToLabelable
  :: forall r
   . AddLabelsToLabelableInput
  -> SelectionSet Scope__AddLabelsToLabelablePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addLabelsToLabelable input = selectionForCompositeField
                             "addLabelsToLabelable"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddProjectCardInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddProjectCardInput | r )

type AddProjectCardInput = { | AddProjectCardInputRowRequired + () }

addProjectCard
  :: forall r
   . AddProjectCardInput
  -> SelectionSet Scope__AddProjectCardPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addProjectCard input = selectionForCompositeField
                       "addProjectCard"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddProjectColumnInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddProjectColumnInput | r )

type AddProjectColumnInput = { | AddProjectColumnInputRowRequired + () }

addProjectColumn
  :: forall r
   . AddProjectColumnInput
  -> SelectionSet Scope__AddProjectColumnPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addProjectColumn input = selectionForCompositeField
                         "addProjectColumn"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddProjectNextItemInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddProjectNextItemInput | r )

type AddProjectNextItemInput = { | AddProjectNextItemInputRowRequired + () }

addProjectNextItem
  :: forall r
   . AddProjectNextItemInput
  -> SelectionSet Scope__AddProjectNextItemPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addProjectNextItem input = selectionForCompositeField
                           "addProjectNextItem"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddPullRequestReviewInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddPullRequestReviewInput | r )

type AddPullRequestReviewInput = { | AddPullRequestReviewInputRowRequired + () }

addPullRequestReview
  :: forall r
   . AddPullRequestReviewInput
  -> SelectionSet Scope__AddPullRequestReviewPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addPullRequestReview input = selectionForCompositeField
                             "addPullRequestReview"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddPullRequestReviewCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddPullRequestReviewCommentInput
    | r
    )

type AddPullRequestReviewCommentInput
  = { | AddPullRequestReviewCommentInputRowRequired + () }

addPullRequestReviewComment
  :: forall r
   . AddPullRequestReviewCommentInput
  -> SelectionSet Scope__AddPullRequestReviewCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addPullRequestReviewComment input = selectionForCompositeField
                                    "addPullRequestReviewComment"
                                    (toGraphQLArguments
                                     input)
                                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddPullRequestReviewThreadInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddPullRequestReviewThreadInput | r )

type AddPullRequestReviewThreadInput
  = { | AddPullRequestReviewThreadInputRowRequired + () }

addPullRequestReviewThread
  :: forall r
   . AddPullRequestReviewThreadInput
  -> SelectionSet Scope__AddPullRequestReviewThreadPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addPullRequestReviewThread input = selectionForCompositeField
                                   "addPullRequestReviewThread"
                                   (toGraphQLArguments
                                    input)
                                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddReactionInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddReactionInput | r )

type AddReactionInput = { | AddReactionInputRowRequired + () }

addReaction
  :: forall r
   . AddReactionInput
  -> SelectionSet Scope__AddReactionPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addReaction input = selectionForCompositeField
                    "addReaction"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddStarInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddStarInput | r )

type AddStarInput = { | AddStarInputRowRequired + () }

addStar
  :: forall r
   . AddStarInput
  -> SelectionSet Scope__AddStarPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addStar input = selectionForCompositeField
                "addStar"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddUpvoteInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddUpvoteInput | r )

type AddUpvoteInput = { | AddUpvoteInputRowRequired + () }

addUpvote
  :: forall r
   . AddUpvoteInput
  -> SelectionSet Scope__AddUpvotePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addUpvote input = selectionForCompositeField
                  "addUpvote"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AddVerifiableDomainInputRowRequired r
  = ( input :: Examples.Github.InputObject.AddVerifiableDomainInput | r )

type AddVerifiableDomainInput = { | AddVerifiableDomainInputRowRequired + () }

addVerifiableDomain
  :: forall r
   . AddVerifiableDomainInput
  -> SelectionSet Scope__AddVerifiableDomainPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
addVerifiableDomain input = selectionForCompositeField
                            "addVerifiableDomain"
                            (toGraphQLArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ApproveDeploymentsInputRowRequired r
  = ( input :: Examples.Github.InputObject.ApproveDeploymentsInput | r )

type ApproveDeploymentsInput = { | ApproveDeploymentsInputRowRequired + () }

approveDeployments
  :: forall r
   . ApproveDeploymentsInput
  -> SelectionSet Scope__ApproveDeploymentsPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
approveDeployments input = selectionForCompositeField
                           "approveDeployments"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ApproveVerifiableDomainInputRowRequired r
  = ( input :: Examples.Github.InputObject.ApproveVerifiableDomainInput | r )

type ApproveVerifiableDomainInput
  = { | ApproveVerifiableDomainInputRowRequired + () }

approveVerifiableDomain
  :: forall r
   . ApproveVerifiableDomainInput
  -> SelectionSet Scope__ApproveVerifiableDomainPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
approveVerifiableDomain input = selectionForCompositeField
                                "approveVerifiableDomain"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ArchiveRepositoryInputRowRequired r
  = ( input :: Examples.Github.InputObject.ArchiveRepositoryInput | r )

type ArchiveRepositoryInput = { | ArchiveRepositoryInputRowRequired + () }

archiveRepository
  :: forall r
   . ArchiveRepositoryInput
  -> SelectionSet Scope__ArchiveRepositoryPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
archiveRepository input = selectionForCompositeField
                          "archiveRepository"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CancelEnterpriseAdminInvitationInputRowRequired r
  = ( input :: Examples.Github.InputObject.CancelEnterpriseAdminInvitationInput
    | r
    )

type CancelEnterpriseAdminInvitationInput
  = { | CancelEnterpriseAdminInvitationInputRowRequired + () }

cancelEnterpriseAdminInvitation
  :: forall r
   . CancelEnterpriseAdminInvitationInput
  -> SelectionSet Scope__CancelEnterpriseAdminInvitationPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
cancelEnterpriseAdminInvitation input = selectionForCompositeField
                                        "cancelEnterpriseAdminInvitation"
                                        (toGraphQLArguments
                                         input)
                                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CancelSponsorshipInputRowRequired r
  = ( input :: Examples.Github.InputObject.CancelSponsorshipInput | r )

type CancelSponsorshipInput = { | CancelSponsorshipInputRowRequired + () }

cancelSponsorship
  :: forall r
   . CancelSponsorshipInput
  -> SelectionSet Scope__CancelSponsorshipPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
cancelSponsorship input = selectionForCompositeField
                          "cancelSponsorship"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ChangeUserStatusInputRowRequired r
  = ( input :: Examples.Github.InputObject.ChangeUserStatusInput | r )

type ChangeUserStatusInput = { | ChangeUserStatusInputRowRequired + () }

changeUserStatus
  :: forall r
   . ChangeUserStatusInput
  -> SelectionSet Scope__ChangeUserStatusPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
changeUserStatus input = selectionForCompositeField
                         "changeUserStatus"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ClearLabelsFromLabelableInputRowRequired r
  = ( input :: Examples.Github.InputObject.ClearLabelsFromLabelableInput | r )

type ClearLabelsFromLabelableInput
  = { | ClearLabelsFromLabelableInputRowRequired + () }

clearLabelsFromLabelable
  :: forall r
   . ClearLabelsFromLabelableInput
  -> SelectionSet Scope__ClearLabelsFromLabelablePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
clearLabelsFromLabelable input = selectionForCompositeField
                                 "clearLabelsFromLabelable"
                                 (toGraphQLArguments
                                  input)
                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CloneProjectInputRowRequired r
  = ( input :: Examples.Github.InputObject.CloneProjectInput | r )

type CloneProjectInput = { | CloneProjectInputRowRequired + () }

cloneProject
  :: forall r
   . CloneProjectInput
  -> SelectionSet Scope__CloneProjectPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
cloneProject input = selectionForCompositeField
                     "cloneProject"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CloneTemplateRepositoryInputRowRequired r
  = ( input :: Examples.Github.InputObject.CloneTemplateRepositoryInput | r )

type CloneTemplateRepositoryInput
  = { | CloneTemplateRepositoryInputRowRequired + () }

cloneTemplateRepository
  :: forall r
   . CloneTemplateRepositoryInput
  -> SelectionSet Scope__CloneTemplateRepositoryPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
cloneTemplateRepository input = selectionForCompositeField
                                "cloneTemplateRepository"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CloseIssueInputRowRequired r
  = ( input :: Examples.Github.InputObject.CloseIssueInput | r )

type CloseIssueInput = { | CloseIssueInputRowRequired + () }

closeIssue
  :: forall r
   . CloseIssueInput
  -> SelectionSet Scope__CloseIssuePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
closeIssue input = selectionForCompositeField
                   "closeIssue"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ClosePullRequestInputRowRequired r
  = ( input :: Examples.Github.InputObject.ClosePullRequestInput | r )

type ClosePullRequestInput = { | ClosePullRequestInputRowRequired + () }

closePullRequest
  :: forall r
   . ClosePullRequestInput
  -> SelectionSet Scope__ClosePullRequestPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
closePullRequest input = selectionForCompositeField
                         "closePullRequest"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ConvertProjectCardNoteToIssueInputRowRequired r
  = ( input :: Examples.Github.InputObject.ConvertProjectCardNoteToIssueInput
    | r
    )

type ConvertProjectCardNoteToIssueInput
  = { | ConvertProjectCardNoteToIssueInputRowRequired + () }

convertProjectCardNoteToIssue
  :: forall r
   . ConvertProjectCardNoteToIssueInput
  -> SelectionSet Scope__ConvertProjectCardNoteToIssuePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
convertProjectCardNoteToIssue input = selectionForCompositeField
                                      "convertProjectCardNoteToIssue"
                                      (toGraphQLArguments
                                       input)
                                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ConvertPullRequestToDraftInputRowRequired r
  = ( input :: Examples.Github.InputObject.ConvertPullRequestToDraftInput | r )

type ConvertPullRequestToDraftInput
  = { | ConvertPullRequestToDraftInputRowRequired + () }

convertPullRequestToDraft
  :: forall r
   . ConvertPullRequestToDraftInput
  -> SelectionSet Scope__ConvertPullRequestToDraftPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
convertPullRequestToDraft input = selectionForCompositeField
                                  "convertPullRequestToDraft"
                                  (toGraphQLArguments
                                   input)
                                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateBranchProtectionRuleInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateBranchProtectionRuleInput | r )

type CreateBranchProtectionRuleInput
  = { | CreateBranchProtectionRuleInputRowRequired + () }

createBranchProtectionRule
  :: forall r
   . CreateBranchProtectionRuleInput
  -> SelectionSet Scope__CreateBranchProtectionRulePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createBranchProtectionRule input = selectionForCompositeField
                                   "createBranchProtectionRule"
                                   (toGraphQLArguments
                                    input)
                                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateCheckRunInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateCheckRunInput | r )

type CreateCheckRunInput = { | CreateCheckRunInputRowRequired + () }

createCheckRun
  :: forall r
   . CreateCheckRunInput
  -> SelectionSet Scope__CreateCheckRunPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createCheckRun input = selectionForCompositeField
                       "createCheckRun"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateCheckSuiteInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateCheckSuiteInput | r )

type CreateCheckSuiteInput = { | CreateCheckSuiteInputRowRequired + () }

createCheckSuite
  :: forall r
   . CreateCheckSuiteInput
  -> SelectionSet Scope__CreateCheckSuitePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createCheckSuite input = selectionForCompositeField
                         "createCheckSuite"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateCommitOnBranchInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateCommitOnBranchInput | r )

type CreateCommitOnBranchInput = { | CreateCommitOnBranchInputRowRequired + () }

createCommitOnBranch
  :: forall r
   . CreateCommitOnBranchInput
  -> SelectionSet Scope__CreateCommitOnBranchPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createCommitOnBranch input = selectionForCompositeField
                             "createCommitOnBranch"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateDiscussionInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateDiscussionInput | r )

type CreateDiscussionInput = { | CreateDiscussionInputRowRequired + () }

createDiscussion
  :: forall r
   . CreateDiscussionInput
  -> SelectionSet Scope__CreateDiscussionPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createDiscussion input = selectionForCompositeField
                         "createDiscussion"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateEnterpriseOrganizationInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateEnterpriseOrganizationInput
    | r
    )

type CreateEnterpriseOrganizationInput
  = { | CreateEnterpriseOrganizationInputRowRequired + () }

createEnterpriseOrganization
  :: forall r
   . CreateEnterpriseOrganizationInput
  -> SelectionSet Scope__CreateEnterpriseOrganizationPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createEnterpriseOrganization input = selectionForCompositeField
                                     "createEnterpriseOrganization"
                                     (toGraphQLArguments
                                      input)
                                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateEnvironmentInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateEnvironmentInput | r )

type CreateEnvironmentInput = { | CreateEnvironmentInputRowRequired + () }

createEnvironment
  :: forall r
   . CreateEnvironmentInput
  -> SelectionSet Scope__CreateEnvironmentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createEnvironment input = selectionForCompositeField
                          "createEnvironment"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateIpAllowListEntryInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateIpAllowListEntryInput | r )

type CreateIpAllowListEntryInput
  = { | CreateIpAllowListEntryInputRowRequired + () }

createIpAllowListEntry
  :: forall r
   . CreateIpAllowListEntryInput
  -> SelectionSet Scope__CreateIpAllowListEntryPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createIpAllowListEntry input = selectionForCompositeField
                               "createIpAllowListEntry"
                               (toGraphQLArguments
                                input)
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateIssueInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateIssueInput | r )

type CreateIssueInput = { | CreateIssueInputRowRequired + () }

createIssue
  :: forall r
   . CreateIssueInput
  -> SelectionSet Scope__CreateIssuePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createIssue input = selectionForCompositeField
                    "createIssue"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateMigrationSourceInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateMigrationSourceInput | r )

type CreateMigrationSourceInput
  = { | CreateMigrationSourceInputRowRequired + () }

createMigrationSource
  :: forall r
   . CreateMigrationSourceInput
  -> SelectionSet Scope__CreateMigrationSourcePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createMigrationSource input = selectionForCompositeField
                              "createMigrationSource"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateProjectInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateProjectInput | r )

type CreateProjectInput = { | CreateProjectInputRowRequired + () }

createProject
  :: forall r
   . CreateProjectInput
  -> SelectionSet Scope__CreateProjectPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createProject input = selectionForCompositeField
                      "createProject"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreatePullRequestInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreatePullRequestInput | r )

type CreatePullRequestInput = { | CreatePullRequestInputRowRequired + () }

createPullRequest
  :: forall r
   . CreatePullRequestInput
  -> SelectionSet Scope__CreatePullRequestPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createPullRequest input = selectionForCompositeField
                          "createPullRequest"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateRefInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateRefInput | r )

type CreateRefInput = { | CreateRefInputRowRequired + () }

createRef
  :: forall r
   . CreateRefInput
  -> SelectionSet Scope__CreateRefPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createRef input = selectionForCompositeField
                  "createRef"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateRepositoryInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateRepositoryInput | r )

type CreateRepositoryInput = { | CreateRepositoryInputRowRequired + () }

createRepository
  :: forall r
   . CreateRepositoryInput
  -> SelectionSet Scope__CreateRepositoryPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createRepository input = selectionForCompositeField
                         "createRepository"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateSponsorshipInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateSponsorshipInput | r )

type CreateSponsorshipInput = { | CreateSponsorshipInputRowRequired + () }

createSponsorship
  :: forall r
   . CreateSponsorshipInput
  -> SelectionSet Scope__CreateSponsorshipPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createSponsorship input = selectionForCompositeField
                          "createSponsorship"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateTeamDiscussionInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateTeamDiscussionInput | r )

type CreateTeamDiscussionInput = { | CreateTeamDiscussionInputRowRequired + () }

createTeamDiscussion
  :: forall r
   . CreateTeamDiscussionInput
  -> SelectionSet Scope__CreateTeamDiscussionPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createTeamDiscussion input = selectionForCompositeField
                             "createTeamDiscussion"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CreateTeamDiscussionCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.CreateTeamDiscussionCommentInput
    | r
    )

type CreateTeamDiscussionCommentInput
  = { | CreateTeamDiscussionCommentInputRowRequired + () }

createTeamDiscussionComment
  :: forall r
   . CreateTeamDiscussionCommentInput
  -> SelectionSet Scope__CreateTeamDiscussionCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
createTeamDiscussionComment input = selectionForCompositeField
                                    "createTeamDiscussionComment"
                                    (toGraphQLArguments
                                     input)
                                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeclineTopicSuggestionInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeclineTopicSuggestionInput | r )

type DeclineTopicSuggestionInput
  = { | DeclineTopicSuggestionInputRowRequired + () }

declineTopicSuggestion
  :: forall r
   . DeclineTopicSuggestionInput
  -> SelectionSet Scope__DeclineTopicSuggestionPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
declineTopicSuggestion input = selectionForCompositeField
                               "declineTopicSuggestion"
                               (toGraphQLArguments
                                input)
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteBranchProtectionRuleInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteBranchProtectionRuleInput | r )

type DeleteBranchProtectionRuleInput
  = { | DeleteBranchProtectionRuleInputRowRequired + () }

deleteBranchProtectionRule
  :: forall r
   . DeleteBranchProtectionRuleInput
  -> SelectionSet Scope__DeleteBranchProtectionRulePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteBranchProtectionRule input = selectionForCompositeField
                                   "deleteBranchProtectionRule"
                                   (toGraphQLArguments
                                    input)
                                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteDeploymentInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteDeploymentInput | r )

type DeleteDeploymentInput = { | DeleteDeploymentInputRowRequired + () }

deleteDeployment
  :: forall r
   . DeleteDeploymentInput
  -> SelectionSet Scope__DeleteDeploymentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteDeployment input = selectionForCompositeField
                         "deleteDeployment"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteDiscussionInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteDiscussionInput | r )

type DeleteDiscussionInput = { | DeleteDiscussionInputRowRequired + () }

deleteDiscussion
  :: forall r
   . DeleteDiscussionInput
  -> SelectionSet Scope__DeleteDiscussionPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteDiscussion input = selectionForCompositeField
                         "deleteDiscussion"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteDiscussionCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteDiscussionCommentInput | r )

type DeleteDiscussionCommentInput
  = { | DeleteDiscussionCommentInputRowRequired + () }

deleteDiscussionComment
  :: forall r
   . DeleteDiscussionCommentInput
  -> SelectionSet Scope__DeleteDiscussionCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteDiscussionComment input = selectionForCompositeField
                                "deleteDiscussionComment"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteEnvironmentInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteEnvironmentInput | r )

type DeleteEnvironmentInput = { | DeleteEnvironmentInputRowRequired + () }

deleteEnvironment
  :: forall r
   . DeleteEnvironmentInput
  -> SelectionSet Scope__DeleteEnvironmentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteEnvironment input = selectionForCompositeField
                          "deleteEnvironment"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteIpAllowListEntryInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteIpAllowListEntryInput | r )

type DeleteIpAllowListEntryInput
  = { | DeleteIpAllowListEntryInputRowRequired + () }

deleteIpAllowListEntry
  :: forall r
   . DeleteIpAllowListEntryInput
  -> SelectionSet Scope__DeleteIpAllowListEntryPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteIpAllowListEntry input = selectionForCompositeField
                               "deleteIpAllowListEntry"
                               (toGraphQLArguments
                                input)
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteIssueInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteIssueInput | r )

type DeleteIssueInput = { | DeleteIssueInputRowRequired + () }

deleteIssue
  :: forall r
   . DeleteIssueInput
  -> SelectionSet Scope__DeleteIssuePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteIssue input = selectionForCompositeField
                    "deleteIssue"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteIssueCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteIssueCommentInput | r )

type DeleteIssueCommentInput = { | DeleteIssueCommentInputRowRequired + () }

deleteIssueComment
  :: forall r
   . DeleteIssueCommentInput
  -> SelectionSet Scope__DeleteIssueCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteIssueComment input = selectionForCompositeField
                           "deleteIssueComment"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteProjectInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteProjectInput | r )

type DeleteProjectInput = { | DeleteProjectInputRowRequired + () }

deleteProject
  :: forall r
   . DeleteProjectInput
  -> SelectionSet Scope__DeleteProjectPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteProject input = selectionForCompositeField
                      "deleteProject"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteProjectCardInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteProjectCardInput | r )

type DeleteProjectCardInput = { | DeleteProjectCardInputRowRequired + () }

deleteProjectCard
  :: forall r
   . DeleteProjectCardInput
  -> SelectionSet Scope__DeleteProjectCardPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteProjectCard input = selectionForCompositeField
                          "deleteProjectCard"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteProjectColumnInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteProjectColumnInput | r )

type DeleteProjectColumnInput = { | DeleteProjectColumnInputRowRequired + () }

deleteProjectColumn
  :: forall r
   . DeleteProjectColumnInput
  -> SelectionSet Scope__DeleteProjectColumnPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteProjectColumn input = selectionForCompositeField
                            "deleteProjectColumn"
                            (toGraphQLArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteProjectNextItemInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteProjectNextItemInput | r )

type DeleteProjectNextItemInput
  = { | DeleteProjectNextItemInputRowRequired + () }

deleteProjectNextItem
  :: forall r
   . DeleteProjectNextItemInput
  -> SelectionSet Scope__DeleteProjectNextItemPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteProjectNextItem input = selectionForCompositeField
                              "deleteProjectNextItem"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeletePullRequestReviewInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeletePullRequestReviewInput | r )

type DeletePullRequestReviewInput
  = { | DeletePullRequestReviewInputRowRequired + () }

deletePullRequestReview
  :: forall r
   . DeletePullRequestReviewInput
  -> SelectionSet Scope__DeletePullRequestReviewPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deletePullRequestReview input = selectionForCompositeField
                                "deletePullRequestReview"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeletePullRequestReviewCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeletePullRequestReviewCommentInput
    | r
    )

type DeletePullRequestReviewCommentInput
  = { | DeletePullRequestReviewCommentInputRowRequired + () }

deletePullRequestReviewComment
  :: forall r
   . DeletePullRequestReviewCommentInput
  -> SelectionSet Scope__DeletePullRequestReviewCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deletePullRequestReviewComment input = selectionForCompositeField
                                       "deletePullRequestReviewComment"
                                       (toGraphQLArguments
                                        input)
                                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteRefInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteRefInput | r )

type DeleteRefInput = { | DeleteRefInputRowRequired + () }

deleteRef
  :: forall r
   . DeleteRefInput
  -> SelectionSet Scope__DeleteRefPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteRef input = selectionForCompositeField
                  "deleteRef"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteTeamDiscussionInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteTeamDiscussionInput | r )

type DeleteTeamDiscussionInput = { | DeleteTeamDiscussionInputRowRequired + () }

deleteTeamDiscussion
  :: forall r
   . DeleteTeamDiscussionInput
  -> SelectionSet Scope__DeleteTeamDiscussionPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteTeamDiscussion input = selectionForCompositeField
                             "deleteTeamDiscussion"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteTeamDiscussionCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteTeamDiscussionCommentInput
    | r
    )

type DeleteTeamDiscussionCommentInput
  = { | DeleteTeamDiscussionCommentInputRowRequired + () }

deleteTeamDiscussionComment
  :: forall r
   . DeleteTeamDiscussionCommentInput
  -> SelectionSet Scope__DeleteTeamDiscussionCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteTeamDiscussionComment input = selectionForCompositeField
                                    "deleteTeamDiscussionComment"
                                    (toGraphQLArguments
                                     input)
                                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeleteVerifiableDomainInputRowRequired r
  = ( input :: Examples.Github.InputObject.DeleteVerifiableDomainInput | r )

type DeleteVerifiableDomainInput
  = { | DeleteVerifiableDomainInputRowRequired + () }

deleteVerifiableDomain
  :: forall r
   . DeleteVerifiableDomainInput
  -> SelectionSet Scope__DeleteVerifiableDomainPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
deleteVerifiableDomain input = selectionForCompositeField
                               "deleteVerifiableDomain"
                               (toGraphQLArguments
                                input)
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DisablePullRequestAutoMergeInputRowRequired r
  = ( input :: Examples.Github.InputObject.DisablePullRequestAutoMergeInput
    | r
    )

type DisablePullRequestAutoMergeInput
  = { | DisablePullRequestAutoMergeInputRowRequired + () }

disablePullRequestAutoMerge
  :: forall r
   . DisablePullRequestAutoMergeInput
  -> SelectionSet Scope__DisablePullRequestAutoMergePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
disablePullRequestAutoMerge input = selectionForCompositeField
                                    "disablePullRequestAutoMerge"
                                    (toGraphQLArguments
                                     input)
                                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DismissPullRequestReviewInputRowRequired r
  = ( input :: Examples.Github.InputObject.DismissPullRequestReviewInput | r )

type DismissPullRequestReviewInput
  = { | DismissPullRequestReviewInputRowRequired + () }

dismissPullRequestReview
  :: forall r
   . DismissPullRequestReviewInput
  -> SelectionSet Scope__DismissPullRequestReviewPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
dismissPullRequestReview input = selectionForCompositeField
                                 "dismissPullRequestReview"
                                 (toGraphQLArguments
                                  input)
                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DismissRepositoryVulnerabilityAlertInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.DismissRepositoryVulnerabilityAlertInput
    | r
    )

type DismissRepositoryVulnerabilityAlertInput
  = { | DismissRepositoryVulnerabilityAlertInputRowRequired + () }

dismissRepositoryVulnerabilityAlert
  :: forall r
   . DismissRepositoryVulnerabilityAlertInput
  -> SelectionSet Scope__DismissRepositoryVulnerabilityAlertPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
dismissRepositoryVulnerabilityAlert input = selectionForCompositeField
                                            "dismissRepositoryVulnerabilityAlert"
                                            (toGraphQLArguments
                                             input)
                                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type EnablePullRequestAutoMergeInputRowRequired r
  = ( input :: Examples.Github.InputObject.EnablePullRequestAutoMergeInput | r )

type EnablePullRequestAutoMergeInput
  = { | EnablePullRequestAutoMergeInputRowRequired + () }

enablePullRequestAutoMerge
  :: forall r
   . EnablePullRequestAutoMergeInput
  -> SelectionSet Scope__EnablePullRequestAutoMergePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
enablePullRequestAutoMerge input = selectionForCompositeField
                                   "enablePullRequestAutoMerge"
                                   (toGraphQLArguments
                                    input)
                                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type FollowUserInputRowRequired r
  = ( input :: Examples.Github.InputObject.FollowUserInput | r )

type FollowUserInput = { | FollowUserInputRowRequired + () }

followUser
  :: forall r
   . FollowUserInput
  -> SelectionSet Scope__FollowUserPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
followUser input = selectionForCompositeField
                   "followUser"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GrantEnterpriseOrganizationsMigratorRoleInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.GrantEnterpriseOrganizationsMigratorRoleInput
    | r
    )

type GrantEnterpriseOrganizationsMigratorRoleInput
  = { | GrantEnterpriseOrganizationsMigratorRoleInputRowRequired + () }

grantEnterpriseOrganizationsMigratorRole
  :: forall r
   . GrantEnterpriseOrganizationsMigratorRoleInput
  -> SelectionSet Scope__GrantEnterpriseOrganizationsMigratorRolePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
grantEnterpriseOrganizationsMigratorRole input = selectionForCompositeField
                                                 "grantEnterpriseOrganizationsMigratorRole"
                                                 (toGraphQLArguments
                                                  input)
                                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GrantMigratorRoleInputRowRequired r
  = ( input :: Examples.Github.InputObject.GrantMigratorRoleInput | r )

type GrantMigratorRoleInput = { | GrantMigratorRoleInputRowRequired + () }

grantMigratorRole
  :: forall r
   . GrantMigratorRoleInput
  -> SelectionSet Scope__GrantMigratorRolePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
grantMigratorRole input = selectionForCompositeField
                          "grantMigratorRole"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type InviteEnterpriseAdminInputRowRequired r
  = ( input :: Examples.Github.InputObject.InviteEnterpriseAdminInput | r )

type InviteEnterpriseAdminInput
  = { | InviteEnterpriseAdminInputRowRequired + () }

inviteEnterpriseAdmin
  :: forall r
   . InviteEnterpriseAdminInput
  -> SelectionSet Scope__InviteEnterpriseAdminPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
inviteEnterpriseAdmin input = selectionForCompositeField
                              "inviteEnterpriseAdmin"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LinkRepositoryToProjectInputRowRequired r
  = ( input :: Examples.Github.InputObject.LinkRepositoryToProjectInput | r )

type LinkRepositoryToProjectInput
  = { | LinkRepositoryToProjectInputRowRequired + () }

linkRepositoryToProject
  :: forall r
   . LinkRepositoryToProjectInput
  -> SelectionSet Scope__LinkRepositoryToProjectPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
linkRepositoryToProject input = selectionForCompositeField
                                "linkRepositoryToProject"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LockLockableInputRowRequired r
  = ( input :: Examples.Github.InputObject.LockLockableInput | r )

type LockLockableInput = { | LockLockableInputRowRequired + () }

lockLockable
  :: forall r
   . LockLockableInput
  -> SelectionSet Scope__LockLockablePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
lockLockable input = selectionForCompositeField
                     "lockLockable"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarkDiscussionCommentAsAnswerInputRowRequired r
  = ( input :: Examples.Github.InputObject.MarkDiscussionCommentAsAnswerInput
    | r
    )

type MarkDiscussionCommentAsAnswerInput
  = { | MarkDiscussionCommentAsAnswerInputRowRequired + () }

markDiscussionCommentAsAnswer
  :: forall r
   . MarkDiscussionCommentAsAnswerInput
  -> SelectionSet Scope__MarkDiscussionCommentAsAnswerPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
markDiscussionCommentAsAnswer input = selectionForCompositeField
                                      "markDiscussionCommentAsAnswer"
                                      (toGraphQLArguments
                                       input)
                                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarkFileAsViewedInputRowRequired r
  = ( input :: Examples.Github.InputObject.MarkFileAsViewedInput | r )

type MarkFileAsViewedInput = { | MarkFileAsViewedInputRowRequired + () }

markFileAsViewed
  :: forall r
   . MarkFileAsViewedInput
  -> SelectionSet Scope__MarkFileAsViewedPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
markFileAsViewed input = selectionForCompositeField
                         "markFileAsViewed"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarkPullRequestReadyForReviewInputRowRequired r
  = ( input :: Examples.Github.InputObject.MarkPullRequestReadyForReviewInput
    | r
    )

type MarkPullRequestReadyForReviewInput
  = { | MarkPullRequestReadyForReviewInputRowRequired + () }

markPullRequestReadyForReview
  :: forall r
   . MarkPullRequestReadyForReviewInput
  -> SelectionSet Scope__MarkPullRequestReadyForReviewPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
markPullRequestReadyForReview input = selectionForCompositeField
                                      "markPullRequestReadyForReview"
                                      (toGraphQLArguments
                                       input)
                                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MergeBranchInputRowRequired r
  = ( input :: Examples.Github.InputObject.MergeBranchInput | r )

type MergeBranchInput = { | MergeBranchInputRowRequired + () }

mergeBranch
  :: forall r
   . MergeBranchInput
  -> SelectionSet Scope__MergeBranchPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
mergeBranch input = selectionForCompositeField
                    "mergeBranch"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MergePullRequestInputRowRequired r
  = ( input :: Examples.Github.InputObject.MergePullRequestInput | r )

type MergePullRequestInput = { | MergePullRequestInputRowRequired + () }

mergePullRequest
  :: forall r
   . MergePullRequestInput
  -> SelectionSet Scope__MergePullRequestPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
mergePullRequest input = selectionForCompositeField
                         "mergePullRequest"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MinimizeCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.MinimizeCommentInput | r )

type MinimizeCommentInput = { | MinimizeCommentInputRowRequired + () }

minimizeComment
  :: forall r
   . MinimizeCommentInput
  -> SelectionSet Scope__MinimizeCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
minimizeComment input = selectionForCompositeField
                        "minimizeComment"
                        (toGraphQLArguments
                         input)
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MoveProjectCardInputRowRequired r
  = ( input :: Examples.Github.InputObject.MoveProjectCardInput | r )

type MoveProjectCardInput = { | MoveProjectCardInputRowRequired + () }

moveProjectCard
  :: forall r
   . MoveProjectCardInput
  -> SelectionSet Scope__MoveProjectCardPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
moveProjectCard input = selectionForCompositeField
                        "moveProjectCard"
                        (toGraphQLArguments
                         input)
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MoveProjectColumnInputRowRequired r
  = ( input :: Examples.Github.InputObject.MoveProjectColumnInput | r )

type MoveProjectColumnInput = { | MoveProjectColumnInputRowRequired + () }

moveProjectColumn
  :: forall r
   . MoveProjectColumnInput
  -> SelectionSet Scope__MoveProjectColumnPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
moveProjectColumn input = selectionForCompositeField
                          "moveProjectColumn"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinIssueInputRowRequired r
  = ( input :: Examples.Github.InputObject.PinIssueInput | r )

type PinIssueInput = { | PinIssueInputRowRequired + () }

pinIssue
  :: forall r
   . PinIssueInput
  -> SelectionSet Scope__PinIssuePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
pinIssue input = selectionForCompositeField
                 "pinIssue"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RegenerateEnterpriseIdentityProviderRecoveryCodesInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.RegenerateEnterpriseIdentityProviderRecoveryCodesInput
    | r
    )

type RegenerateEnterpriseIdentityProviderRecoveryCodesInput
  = { | RegenerateEnterpriseIdentityProviderRecoveryCodesInputRowRequired + () }

regenerateEnterpriseIdentityProviderRecoveryCodes
  :: forall r
   . RegenerateEnterpriseIdentityProviderRecoveryCodesInput
  -> SelectionSet
        Scope__RegenerateEnterpriseIdentityProviderRecoveryCodesPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
regenerateEnterpriseIdentityProviderRecoveryCodes input = selectionForCompositeField
                                                          "regenerateEnterpriseIdentityProviderRecoveryCodes"
                                                          (toGraphQLArguments
                                                           input)
                                                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RegenerateVerifiableDomainTokenInputRowRequired r
  = ( input :: Examples.Github.InputObject.RegenerateVerifiableDomainTokenInput
    | r
    )

type RegenerateVerifiableDomainTokenInput
  = { | RegenerateVerifiableDomainTokenInputRowRequired + () }

regenerateVerifiableDomainToken
  :: forall r
   . RegenerateVerifiableDomainTokenInput
  -> SelectionSet Scope__RegenerateVerifiableDomainTokenPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
regenerateVerifiableDomainToken input = selectionForCompositeField
                                        "regenerateVerifiableDomainToken"
                                        (toGraphQLArguments
                                         input)
                                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RejectDeploymentsInputRowRequired r
  = ( input :: Examples.Github.InputObject.RejectDeploymentsInput | r )

type RejectDeploymentsInput = { | RejectDeploymentsInputRowRequired + () }

rejectDeployments
  :: forall r
   . RejectDeploymentsInput
  -> SelectionSet Scope__RejectDeploymentsPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
rejectDeployments input = selectionForCompositeField
                          "rejectDeployments"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveAssigneesFromAssignableInputRowRequired r
  = ( input :: Examples.Github.InputObject.RemoveAssigneesFromAssignableInput
    | r
    )

type RemoveAssigneesFromAssignableInput
  = { | RemoveAssigneesFromAssignableInputRowRequired + () }

removeAssigneesFromAssignable
  :: forall r
   . RemoveAssigneesFromAssignableInput
  -> SelectionSet Scope__RemoveAssigneesFromAssignablePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
removeAssigneesFromAssignable input = selectionForCompositeField
                                      "removeAssigneesFromAssignable"
                                      (toGraphQLArguments
                                       input)
                                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveEnterpriseAdminInputRowRequired r
  = ( input :: Examples.Github.InputObject.RemoveEnterpriseAdminInput | r )

type RemoveEnterpriseAdminInput
  = { | RemoveEnterpriseAdminInputRowRequired + () }

removeEnterpriseAdmin
  :: forall r
   . RemoveEnterpriseAdminInput
  -> SelectionSet Scope__RemoveEnterpriseAdminPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
removeEnterpriseAdmin input = selectionForCompositeField
                              "removeEnterpriseAdmin"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveEnterpriseIdentityProviderInputRowRequired r
  = ( input :: Examples.Github.InputObject.RemoveEnterpriseIdentityProviderInput
    | r
    )

type RemoveEnterpriseIdentityProviderInput
  = { | RemoveEnterpriseIdentityProviderInputRowRequired + () }

removeEnterpriseIdentityProvider
  :: forall r
   . RemoveEnterpriseIdentityProviderInput
  -> SelectionSet Scope__RemoveEnterpriseIdentityProviderPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
removeEnterpriseIdentityProvider input = selectionForCompositeField
                                         "removeEnterpriseIdentityProvider"
                                         (toGraphQLArguments
                                          input)
                                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveEnterpriseOrganizationInputRowRequired r
  = ( input :: Examples.Github.InputObject.RemoveEnterpriseOrganizationInput
    | r
    )

type RemoveEnterpriseOrganizationInput
  = { | RemoveEnterpriseOrganizationInputRowRequired + () }

removeEnterpriseOrganization
  :: forall r
   . RemoveEnterpriseOrganizationInput
  -> SelectionSet Scope__RemoveEnterpriseOrganizationPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
removeEnterpriseOrganization input = selectionForCompositeField
                                     "removeEnterpriseOrganization"
                                     (toGraphQLArguments
                                      input)
                                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveEnterpriseSupportEntitlementInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.RemoveEnterpriseSupportEntitlementInput
    | r
    )

type RemoveEnterpriseSupportEntitlementInput
  = { | RemoveEnterpriseSupportEntitlementInputRowRequired + () }

removeEnterpriseSupportEntitlement
  :: forall r
   . RemoveEnterpriseSupportEntitlementInput
  -> SelectionSet Scope__RemoveEnterpriseSupportEntitlementPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
removeEnterpriseSupportEntitlement input = selectionForCompositeField
                                           "removeEnterpriseSupportEntitlement"
                                           (toGraphQLArguments
                                            input)
                                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveLabelsFromLabelableInputRowRequired r
  = ( input :: Examples.Github.InputObject.RemoveLabelsFromLabelableInput | r )

type RemoveLabelsFromLabelableInput
  = { | RemoveLabelsFromLabelableInputRowRequired + () }

removeLabelsFromLabelable
  :: forall r
   . RemoveLabelsFromLabelableInput
  -> SelectionSet Scope__RemoveLabelsFromLabelablePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
removeLabelsFromLabelable input = selectionForCompositeField
                                  "removeLabelsFromLabelable"
                                  (toGraphQLArguments
                                   input)
                                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveOutsideCollaboratorInputRowRequired r
  = ( input :: Examples.Github.InputObject.RemoveOutsideCollaboratorInput | r )

type RemoveOutsideCollaboratorInput
  = { | RemoveOutsideCollaboratorInputRowRequired + () }

removeOutsideCollaborator
  :: forall r
   . RemoveOutsideCollaboratorInput
  -> SelectionSet Scope__RemoveOutsideCollaboratorPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
removeOutsideCollaborator input = selectionForCompositeField
                                  "removeOutsideCollaborator"
                                  (toGraphQLArguments
                                   input)
                                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveReactionInputRowRequired r
  = ( input :: Examples.Github.InputObject.RemoveReactionInput | r )

type RemoveReactionInput = { | RemoveReactionInputRowRequired + () }

removeReaction
  :: forall r
   . RemoveReactionInput
  -> SelectionSet Scope__RemoveReactionPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
removeReaction input = selectionForCompositeField
                       "removeReaction"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveStarInputRowRequired r
  = ( input :: Examples.Github.InputObject.RemoveStarInput | r )

type RemoveStarInput = { | RemoveStarInputRowRequired + () }

removeStar
  :: forall r
   . RemoveStarInput
  -> SelectionSet Scope__RemoveStarPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
removeStar input = selectionForCompositeField
                   "removeStar"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RemoveUpvoteInputRowRequired r
  = ( input :: Examples.Github.InputObject.RemoveUpvoteInput | r )

type RemoveUpvoteInput = { | RemoveUpvoteInputRowRequired + () }

removeUpvote
  :: forall r
   . RemoveUpvoteInput
  -> SelectionSet Scope__RemoveUpvotePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
removeUpvote input = selectionForCompositeField
                     "removeUpvote"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReopenIssueInputRowRequired r
  = ( input :: Examples.Github.InputObject.ReopenIssueInput | r )

type ReopenIssueInput = { | ReopenIssueInputRowRequired + () }

reopenIssue
  :: forall r
   . ReopenIssueInput
  -> SelectionSet Scope__ReopenIssuePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
reopenIssue input = selectionForCompositeField
                    "reopenIssue"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReopenPullRequestInputRowRequired r
  = ( input :: Examples.Github.InputObject.ReopenPullRequestInput | r )

type ReopenPullRequestInput = { | ReopenPullRequestInputRowRequired + () }

reopenPullRequest
  :: forall r
   . ReopenPullRequestInput
  -> SelectionSet Scope__ReopenPullRequestPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
reopenPullRequest input = selectionForCompositeField
                          "reopenPullRequest"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RequestReviewsInputRowRequired r
  = ( input :: Examples.Github.InputObject.RequestReviewsInput | r )

type RequestReviewsInput = { | RequestReviewsInputRowRequired + () }

requestReviews
  :: forall r
   . RequestReviewsInput
  -> SelectionSet Scope__RequestReviewsPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
requestReviews input = selectionForCompositeField
                       "requestReviews"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RerequestCheckSuiteInputRowRequired r
  = ( input :: Examples.Github.InputObject.RerequestCheckSuiteInput | r )

type RerequestCheckSuiteInput = { | RerequestCheckSuiteInputRowRequired + () }

rerequestCheckSuite
  :: forall r
   . RerequestCheckSuiteInput
  -> SelectionSet Scope__RerequestCheckSuitePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
rerequestCheckSuite input = selectionForCompositeField
                            "rerequestCheckSuite"
                            (toGraphQLArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ResolveReviewThreadInputRowRequired r
  = ( input :: Examples.Github.InputObject.ResolveReviewThreadInput | r )

type ResolveReviewThreadInput = { | ResolveReviewThreadInputRowRequired + () }

resolveReviewThread
  :: forall r
   . ResolveReviewThreadInput
  -> SelectionSet Scope__ResolveReviewThreadPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
resolveReviewThread input = selectionForCompositeField
                            "resolveReviewThread"
                            (toGraphQLArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RevokeEnterpriseOrganizationsMigratorRoleInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.RevokeEnterpriseOrganizationsMigratorRoleInput
    | r
    )

type RevokeEnterpriseOrganizationsMigratorRoleInput
  = { | RevokeEnterpriseOrganizationsMigratorRoleInputRowRequired + () }

revokeEnterpriseOrganizationsMigratorRole
  :: forall r
   . RevokeEnterpriseOrganizationsMigratorRoleInput
  -> SelectionSet Scope__RevokeEnterpriseOrganizationsMigratorRolePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
revokeEnterpriseOrganizationsMigratorRole input = selectionForCompositeField
                                                  "revokeEnterpriseOrganizationsMigratorRole"
                                                  (toGraphQLArguments
                                                   input)
                                                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RevokeMigratorRoleInputRowRequired r
  = ( input :: Examples.Github.InputObject.RevokeMigratorRoleInput | r )

type RevokeMigratorRoleInput = { | RevokeMigratorRoleInputRowRequired + () }

revokeMigratorRole
  :: forall r
   . RevokeMigratorRoleInput
  -> SelectionSet Scope__RevokeMigratorRolePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
revokeMigratorRole input = selectionForCompositeField
                           "revokeMigratorRole"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SetEnterpriseIdentityProviderInputRowRequired r
  = ( input :: Examples.Github.InputObject.SetEnterpriseIdentityProviderInput
    | r
    )

type SetEnterpriseIdentityProviderInput
  = { | SetEnterpriseIdentityProviderInputRowRequired + () }

setEnterpriseIdentityProvider
  :: forall r
   . SetEnterpriseIdentityProviderInput
  -> SelectionSet Scope__SetEnterpriseIdentityProviderPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
setEnterpriseIdentityProvider input = selectionForCompositeField
                                      "setEnterpriseIdentityProvider"
                                      (toGraphQLArguments
                                       input)
                                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SetOrganizationInteractionLimitInputRowRequired r
  = ( input :: Examples.Github.InputObject.SetOrganizationInteractionLimitInput
    | r
    )

type SetOrganizationInteractionLimitInput
  = { | SetOrganizationInteractionLimitInputRowRequired + () }

setOrganizationInteractionLimit
  :: forall r
   . SetOrganizationInteractionLimitInput
  -> SelectionSet Scope__SetOrganizationInteractionLimitPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
setOrganizationInteractionLimit input = selectionForCompositeField
                                        "setOrganizationInteractionLimit"
                                        (toGraphQLArguments
                                         input)
                                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SetRepositoryInteractionLimitInputRowRequired r
  = ( input :: Examples.Github.InputObject.SetRepositoryInteractionLimitInput
    | r
    )

type SetRepositoryInteractionLimitInput
  = { | SetRepositoryInteractionLimitInputRowRequired + () }

setRepositoryInteractionLimit
  :: forall r
   . SetRepositoryInteractionLimitInput
  -> SelectionSet Scope__SetRepositoryInteractionLimitPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
setRepositoryInteractionLimit input = selectionForCompositeField
                                      "setRepositoryInteractionLimit"
                                      (toGraphQLArguments
                                       input)
                                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SetUserInteractionLimitInputRowRequired r
  = ( input :: Examples.Github.InputObject.SetUserInteractionLimitInput | r )

type SetUserInteractionLimitInput
  = { | SetUserInteractionLimitInputRowRequired + () }

setUserInteractionLimit
  :: forall r
   . SetUserInteractionLimitInput
  -> SelectionSet Scope__SetUserInteractionLimitPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
setUserInteractionLimit input = selectionForCompositeField
                                "setUserInteractionLimit"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type StartRepositoryMigrationInputRowRequired r
  = ( input :: Examples.Github.InputObject.StartRepositoryMigrationInput | r )

type StartRepositoryMigrationInput
  = { | StartRepositoryMigrationInputRowRequired + () }

startRepositoryMigration
  :: forall r
   . StartRepositoryMigrationInput
  -> SelectionSet Scope__StartRepositoryMigrationPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
startRepositoryMigration input = selectionForCompositeField
                                 "startRepositoryMigration"
                                 (toGraphQLArguments
                                  input)
                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SubmitPullRequestReviewInputRowRequired r
  = ( input :: Examples.Github.InputObject.SubmitPullRequestReviewInput | r )

type SubmitPullRequestReviewInput
  = { | SubmitPullRequestReviewInputRowRequired + () }

submitPullRequestReview
  :: forall r
   . SubmitPullRequestReviewInput
  -> SelectionSet Scope__SubmitPullRequestReviewPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
submitPullRequestReview input = selectionForCompositeField
                                "submitPullRequestReview"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TransferIssueInputRowRequired r
  = ( input :: Examples.Github.InputObject.TransferIssueInput | r )

type TransferIssueInput = { | TransferIssueInputRowRequired + () }

transferIssue
  :: forall r
   . TransferIssueInput
  -> SelectionSet Scope__TransferIssuePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
transferIssue input = selectionForCompositeField
                      "transferIssue"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnarchiveRepositoryInputRowRequired r
  = ( input :: Examples.Github.InputObject.UnarchiveRepositoryInput | r )

type UnarchiveRepositoryInput = { | UnarchiveRepositoryInputRowRequired + () }

unarchiveRepository
  :: forall r
   . UnarchiveRepositoryInput
  -> SelectionSet Scope__UnarchiveRepositoryPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
unarchiveRepository input = selectionForCompositeField
                            "unarchiveRepository"
                            (toGraphQLArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnfollowUserInputRowRequired r
  = ( input :: Examples.Github.InputObject.UnfollowUserInput | r )

type UnfollowUserInput = { | UnfollowUserInputRowRequired + () }

unfollowUser
  :: forall r
   . UnfollowUserInput
  -> SelectionSet Scope__UnfollowUserPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
unfollowUser input = selectionForCompositeField
                     "unfollowUser"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnlinkRepositoryFromProjectInputRowRequired r
  = ( input :: Examples.Github.InputObject.UnlinkRepositoryFromProjectInput
    | r
    )

type UnlinkRepositoryFromProjectInput
  = { | UnlinkRepositoryFromProjectInputRowRequired + () }

unlinkRepositoryFromProject
  :: forall r
   . UnlinkRepositoryFromProjectInput
  -> SelectionSet Scope__UnlinkRepositoryFromProjectPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
unlinkRepositoryFromProject input = selectionForCompositeField
                                    "unlinkRepositoryFromProject"
                                    (toGraphQLArguments
                                     input)
                                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnlockLockableInputRowRequired r
  = ( input :: Examples.Github.InputObject.UnlockLockableInput | r )

type UnlockLockableInput = { | UnlockLockableInputRowRequired + () }

unlockLockable
  :: forall r
   . UnlockLockableInput
  -> SelectionSet Scope__UnlockLockablePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
unlockLockable input = selectionForCompositeField
                       "unlockLockable"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnmarkDiscussionCommentAsAnswerInputRowRequired r
  = ( input :: Examples.Github.InputObject.UnmarkDiscussionCommentAsAnswerInput
    | r
    )

type UnmarkDiscussionCommentAsAnswerInput
  = { | UnmarkDiscussionCommentAsAnswerInputRowRequired + () }

unmarkDiscussionCommentAsAnswer
  :: forall r
   . UnmarkDiscussionCommentAsAnswerInput
  -> SelectionSet Scope__UnmarkDiscussionCommentAsAnswerPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
unmarkDiscussionCommentAsAnswer input = selectionForCompositeField
                                        "unmarkDiscussionCommentAsAnswer"
                                        (toGraphQLArguments
                                         input)
                                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnmarkFileAsViewedInputRowRequired r
  = ( input :: Examples.Github.InputObject.UnmarkFileAsViewedInput | r )

type UnmarkFileAsViewedInput = { | UnmarkFileAsViewedInputRowRequired + () }

unmarkFileAsViewed
  :: forall r
   . UnmarkFileAsViewedInput
  -> SelectionSet Scope__UnmarkFileAsViewedPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
unmarkFileAsViewed input = selectionForCompositeField
                           "unmarkFileAsViewed"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnmarkIssueAsDuplicateInputRowRequired r
  = ( input :: Examples.Github.InputObject.UnmarkIssueAsDuplicateInput | r )

type UnmarkIssueAsDuplicateInput
  = { | UnmarkIssueAsDuplicateInputRowRequired + () }

unmarkIssueAsDuplicate
  :: forall r
   . UnmarkIssueAsDuplicateInput
  -> SelectionSet Scope__UnmarkIssueAsDuplicatePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
unmarkIssueAsDuplicate input = selectionForCompositeField
                               "unmarkIssueAsDuplicate"
                               (toGraphQLArguments
                                input)
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnminimizeCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.UnminimizeCommentInput | r )

type UnminimizeCommentInput = { | UnminimizeCommentInputRowRequired + () }

unminimizeComment
  :: forall r
   . UnminimizeCommentInput
  -> SelectionSet Scope__UnminimizeCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
unminimizeComment input = selectionForCompositeField
                          "unminimizeComment"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnpinIssueInputRowRequired r
  = ( input :: Examples.Github.InputObject.UnpinIssueInput | r )

type UnpinIssueInput = { | UnpinIssueInputRowRequired + () }

unpinIssue
  :: forall r
   . UnpinIssueInput
  -> SelectionSet Scope__UnpinIssuePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
unpinIssue input = selectionForCompositeField
                   "unpinIssue"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UnresolveReviewThreadInputRowRequired r
  = ( input :: Examples.Github.InputObject.UnresolveReviewThreadInput | r )

type UnresolveReviewThreadInput
  = { | UnresolveReviewThreadInputRowRequired + () }

unresolveReviewThread
  :: forall r
   . UnresolveReviewThreadInput
  -> SelectionSet Scope__UnresolveReviewThreadPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
unresolveReviewThread input = selectionForCompositeField
                              "unresolveReviewThread"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateBranchProtectionRuleInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateBranchProtectionRuleInput | r )

type UpdateBranchProtectionRuleInput
  = { | UpdateBranchProtectionRuleInputRowRequired + () }

updateBranchProtectionRule
  :: forall r
   . UpdateBranchProtectionRuleInput
  -> SelectionSet Scope__UpdateBranchProtectionRulePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateBranchProtectionRule input = selectionForCompositeField
                                   "updateBranchProtectionRule"
                                   (toGraphQLArguments
                                    input)
                                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateCheckRunInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateCheckRunInput | r )

type UpdateCheckRunInput = { | UpdateCheckRunInputRowRequired + () }

updateCheckRun
  :: forall r
   . UpdateCheckRunInput
  -> SelectionSet Scope__UpdateCheckRunPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateCheckRun input = selectionForCompositeField
                       "updateCheckRun"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateCheckSuitePreferencesInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateCheckSuitePreferencesInput
    | r
    )

type UpdateCheckSuitePreferencesInput
  = { | UpdateCheckSuitePreferencesInputRowRequired + () }

updateCheckSuitePreferences
  :: forall r
   . UpdateCheckSuitePreferencesInput
  -> SelectionSet Scope__UpdateCheckSuitePreferencesPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateCheckSuitePreferences input = selectionForCompositeField
                                    "updateCheckSuitePreferences"
                                    (toGraphQLArguments
                                     input)
                                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateDiscussionInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateDiscussionInput | r )

type UpdateDiscussionInput = { | UpdateDiscussionInputRowRequired + () }

updateDiscussion
  :: forall r
   . UpdateDiscussionInput
  -> SelectionSet Scope__UpdateDiscussionPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateDiscussion input = selectionForCompositeField
                         "updateDiscussion"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateDiscussionCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateDiscussionCommentInput | r )

type UpdateDiscussionCommentInput
  = { | UpdateDiscussionCommentInputRowRequired + () }

updateDiscussionComment
  :: forall r
   . UpdateDiscussionCommentInput
  -> SelectionSet Scope__UpdateDiscussionCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateDiscussionComment input = selectionForCompositeField
                                "updateDiscussionComment"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseAdministratorRoleInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseAdministratorRoleInput
    | r
    )

type UpdateEnterpriseAdministratorRoleInput
  = { | UpdateEnterpriseAdministratorRoleInputRowRequired + () }

updateEnterpriseAdministratorRole
  :: forall r
   . UpdateEnterpriseAdministratorRoleInput
  -> SelectionSet Scope__UpdateEnterpriseAdministratorRolePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseAdministratorRole input = selectionForCompositeField
                                          "updateEnterpriseAdministratorRole"
                                          (toGraphQLArguments
                                           input)
                                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseAllowPrivateRepositoryForkingSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
    | r
    )

type UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
  = { | UpdateEnterpriseAllowPrivateRepositoryForkingSettingInputRowRequired
      + ()
    }

updateEnterpriseAllowPrivateRepositoryForkingSetting
  :: forall r
   . UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
  -> SelectionSet
        Scope__UpdateEnterpriseAllowPrivateRepositoryForkingSettingPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseAllowPrivateRepositoryForkingSetting input = selectionForCompositeField
                                                             "updateEnterpriseAllowPrivateRepositoryForkingSetting"
                                                             (toGraphQLArguments
                                                              input)
                                                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseDefaultRepositoryPermissionSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseDefaultRepositoryPermissionSettingInput
    | r
    )

type UpdateEnterpriseDefaultRepositoryPermissionSettingInput
  = { | UpdateEnterpriseDefaultRepositoryPermissionSettingInputRowRequired + ()
    }

updateEnterpriseDefaultRepositoryPermissionSetting
  :: forall r
   . UpdateEnterpriseDefaultRepositoryPermissionSettingInput
  -> SelectionSet
        Scope__UpdateEnterpriseDefaultRepositoryPermissionSettingPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseDefaultRepositoryPermissionSetting input = selectionForCompositeField
                                                           "updateEnterpriseDefaultRepositoryPermissionSetting"
                                                           (toGraphQLArguments
                                                            input)
                                                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
    | r
    )

type UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
  = { | UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInputRowRequired
      + ()
    }

updateEnterpriseMembersCanChangeRepositoryVisibilitySetting
  :: forall r
   . UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
  -> SelectionSet
        Scope__UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanChangeRepositoryVisibilitySetting input = selectionForCompositeField
                                                                    "updateEnterpriseMembersCanChangeRepositoryVisibilitySetting"
                                                                    (toGraphQLArguments
                                                                     input)
                                                                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanCreateRepositoriesSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseMembersCanCreateRepositoriesSettingInput
    | r
    )

type UpdateEnterpriseMembersCanCreateRepositoriesSettingInput
  = { | UpdateEnterpriseMembersCanCreateRepositoriesSettingInputRowRequired + ()
    }

updateEnterpriseMembersCanCreateRepositoriesSetting
  :: forall r
   . UpdateEnterpriseMembersCanCreateRepositoriesSettingInput
  -> SelectionSet
        Scope__UpdateEnterpriseMembersCanCreateRepositoriesSettingPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanCreateRepositoriesSetting input = selectionForCompositeField
                                                            "updateEnterpriseMembersCanCreateRepositoriesSetting"
                                                            (toGraphQLArguments
                                                             input)
                                                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanDeleteIssuesSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseMembersCanDeleteIssuesSettingInput
    | r
    )

type UpdateEnterpriseMembersCanDeleteIssuesSettingInput
  = { | UpdateEnterpriseMembersCanDeleteIssuesSettingInputRowRequired + () }

updateEnterpriseMembersCanDeleteIssuesSetting
  :: forall r
   . UpdateEnterpriseMembersCanDeleteIssuesSettingInput
  -> SelectionSet Scope__UpdateEnterpriseMembersCanDeleteIssuesSettingPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanDeleteIssuesSetting input = selectionForCompositeField
                                                      "updateEnterpriseMembersCanDeleteIssuesSetting"
                                                      (toGraphQLArguments
                                                       input)
                                                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanDeleteRepositoriesSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
    | r
    )

type UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
  = { | UpdateEnterpriseMembersCanDeleteRepositoriesSettingInputRowRequired + ()
    }

updateEnterpriseMembersCanDeleteRepositoriesSetting
  :: forall r
   . UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
  -> SelectionSet
        Scope__UpdateEnterpriseMembersCanDeleteRepositoriesSettingPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanDeleteRepositoriesSetting input = selectionForCompositeField
                                                            "updateEnterpriseMembersCanDeleteRepositoriesSetting"
                                                            (toGraphQLArguments
                                                             input)
                                                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanInviteCollaboratorsSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
    | r
    )

type UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
  = { | UpdateEnterpriseMembersCanInviteCollaboratorsSettingInputRowRequired
      + ()
    }

updateEnterpriseMembersCanInviteCollaboratorsSetting
  :: forall r
   . UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
  -> SelectionSet
        Scope__UpdateEnterpriseMembersCanInviteCollaboratorsSettingPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanInviteCollaboratorsSetting input = selectionForCompositeField
                                                             "updateEnterpriseMembersCanInviteCollaboratorsSetting"
                                                             (toGraphQLArguments
                                                              input)
                                                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanMakePurchasesSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseMembersCanMakePurchasesSettingInput
    | r
    )

type UpdateEnterpriseMembersCanMakePurchasesSettingInput
  = { | UpdateEnterpriseMembersCanMakePurchasesSettingInputRowRequired + () }

updateEnterpriseMembersCanMakePurchasesSetting
  :: forall r
   . UpdateEnterpriseMembersCanMakePurchasesSettingInput
  -> SelectionSet Scope__UpdateEnterpriseMembersCanMakePurchasesSettingPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanMakePurchasesSetting input = selectionForCompositeField
                                                       "updateEnterpriseMembersCanMakePurchasesSetting"
                                                       (toGraphQLArguments
                                                        input)
                                                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
    | r
    )

type UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
  = { | UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInputRowRequired
      + ()
    }

updateEnterpriseMembersCanUpdateProtectedBranchesSetting
  :: forall r
   . UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
  -> SelectionSet
        Scope__UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanUpdateProtectedBranchesSetting input = selectionForCompositeField
                                                                 "updateEnterpriseMembersCanUpdateProtectedBranchesSetting"
                                                                 (toGraphQLArguments
                                                                  input)
                                                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseMembersCanViewDependencyInsightsSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
    | r
    )

type UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
  = { | UpdateEnterpriseMembersCanViewDependencyInsightsSettingInputRowRequired
      + ()
    }

updateEnterpriseMembersCanViewDependencyInsightsSetting
  :: forall r
   . UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
  -> SelectionSet
        Scope__UpdateEnterpriseMembersCanViewDependencyInsightsSettingPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseMembersCanViewDependencyInsightsSetting input = selectionForCompositeField
                                                                "updateEnterpriseMembersCanViewDependencyInsightsSetting"
                                                                (toGraphQLArguments
                                                                 input)
                                                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseOrganizationProjectsSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseOrganizationProjectsSettingInput
    | r
    )

type UpdateEnterpriseOrganizationProjectsSettingInput
  = { | UpdateEnterpriseOrganizationProjectsSettingInputRowRequired + () }

updateEnterpriseOrganizationProjectsSetting
  :: forall r
   . UpdateEnterpriseOrganizationProjectsSettingInput
  -> SelectionSet Scope__UpdateEnterpriseOrganizationProjectsSettingPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseOrganizationProjectsSetting input = selectionForCompositeField
                                                    "updateEnterpriseOrganizationProjectsSetting"
                                                    (toGraphQLArguments
                                                     input)
                                                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseOwnerOrganizationRoleInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseOwnerOrganizationRoleInput
    | r
    )

type UpdateEnterpriseOwnerOrganizationRoleInput
  = { | UpdateEnterpriseOwnerOrganizationRoleInputRowRequired + () }

updateEnterpriseOwnerOrganizationRole
  :: forall r
   . UpdateEnterpriseOwnerOrganizationRoleInput
  -> SelectionSet Scope__UpdateEnterpriseOwnerOrganizationRolePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseOwnerOrganizationRole input = selectionForCompositeField
                                              "updateEnterpriseOwnerOrganizationRole"
                                              (toGraphQLArguments
                                               input)
                                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseProfileInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateEnterpriseProfileInput | r )

type UpdateEnterpriseProfileInput
  = { | UpdateEnterpriseProfileInputRowRequired + () }

updateEnterpriseProfile
  :: forall r
   . UpdateEnterpriseProfileInput
  -> SelectionSet Scope__UpdateEnterpriseProfilePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseProfile input = selectionForCompositeField
                                "updateEnterpriseProfile"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseRepositoryProjectsSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseRepositoryProjectsSettingInput
    | r
    )

type UpdateEnterpriseRepositoryProjectsSettingInput
  = { | UpdateEnterpriseRepositoryProjectsSettingInputRowRequired + () }

updateEnterpriseRepositoryProjectsSetting
  :: forall r
   . UpdateEnterpriseRepositoryProjectsSettingInput
  -> SelectionSet Scope__UpdateEnterpriseRepositoryProjectsSettingPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseRepositoryProjectsSetting input = selectionForCompositeField
                                                  "updateEnterpriseRepositoryProjectsSetting"
                                                  (toGraphQLArguments
                                                   input)
                                                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseTeamDiscussionsSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseTeamDiscussionsSettingInput
    | r
    )

type UpdateEnterpriseTeamDiscussionsSettingInput
  = { | UpdateEnterpriseTeamDiscussionsSettingInputRowRequired + () }

updateEnterpriseTeamDiscussionsSetting
  :: forall r
   . UpdateEnterpriseTeamDiscussionsSettingInput
  -> SelectionSet Scope__UpdateEnterpriseTeamDiscussionsSettingPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseTeamDiscussionsSetting input = selectionForCompositeField
                                               "updateEnterpriseTeamDiscussionsSetting"
                                               (toGraphQLArguments
                                                input)
                                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
    | r
    )

type UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
  = { | UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInputRowRequired
      + ()
    }

updateEnterpriseTwoFactorAuthenticationRequiredSetting
  :: forall r
   . UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
  -> SelectionSet
        Scope__UpdateEnterpriseTwoFactorAuthenticationRequiredSettingPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnterpriseTwoFactorAuthenticationRequiredSetting input = selectionForCompositeField
                                                               "updateEnterpriseTwoFactorAuthenticationRequiredSetting"
                                                               (toGraphQLArguments
                                                                input)
                                                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateEnvironmentInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateEnvironmentInput | r )

type UpdateEnvironmentInput = { | UpdateEnvironmentInputRowRequired + () }

updateEnvironment
  :: forall r
   . UpdateEnvironmentInput
  -> SelectionSet Scope__UpdateEnvironmentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateEnvironment input = selectionForCompositeField
                          "updateEnvironment"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateIpAllowListEnabledSettingInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateIpAllowListEnabledSettingInput
    | r
    )

type UpdateIpAllowListEnabledSettingInput
  = { | UpdateIpAllowListEnabledSettingInputRowRequired + () }

updateIpAllowListEnabledSetting
  :: forall r
   . UpdateIpAllowListEnabledSettingInput
  -> SelectionSet Scope__UpdateIpAllowListEnabledSettingPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateIpAllowListEnabledSetting input = selectionForCompositeField
                                        "updateIpAllowListEnabledSetting"
                                        (toGraphQLArguments
                                         input)
                                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateIpAllowListEntryInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateIpAllowListEntryInput | r )

type UpdateIpAllowListEntryInput
  = { | UpdateIpAllowListEntryInputRowRequired + () }

updateIpAllowListEntry
  :: forall r
   . UpdateIpAllowListEntryInput
  -> SelectionSet Scope__UpdateIpAllowListEntryPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateIpAllowListEntry input = selectionForCompositeField
                               "updateIpAllowListEntry"
                               (toGraphQLArguments
                                input)
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateIpAllowListForInstalledAppsEnabledSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateIpAllowListForInstalledAppsEnabledSettingInput
    | r
    )

type UpdateIpAllowListForInstalledAppsEnabledSettingInput
  = { | UpdateIpAllowListForInstalledAppsEnabledSettingInputRowRequired + () }

updateIpAllowListForInstalledAppsEnabledSetting
  :: forall r
   . UpdateIpAllowListForInstalledAppsEnabledSettingInput
  -> SelectionSet
        Scope__UpdateIpAllowListForInstalledAppsEnabledSettingPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateIpAllowListForInstalledAppsEnabledSetting input = selectionForCompositeField
                                                        "updateIpAllowListForInstalledAppsEnabledSetting"
                                                        (toGraphQLArguments
                                                         input)
                                                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateIssueInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateIssueInput | r )

type UpdateIssueInput = { | UpdateIssueInputRowRequired + () }

updateIssue
  :: forall r
   . UpdateIssueInput
  -> SelectionSet Scope__UpdateIssuePayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateIssue input = selectionForCompositeField
                    "updateIssue"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateIssueCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateIssueCommentInput | r )

type UpdateIssueCommentInput = { | UpdateIssueCommentInputRowRequired + () }

updateIssueComment
  :: forall r
   . UpdateIssueCommentInput
  -> SelectionSet Scope__UpdateIssueCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateIssueComment input = selectionForCompositeField
                           "updateIssueComment"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateNotificationRestrictionSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateNotificationRestrictionSettingInput
    | r
    )

type UpdateNotificationRestrictionSettingInput
  = { | UpdateNotificationRestrictionSettingInputRowRequired + () }

updateNotificationRestrictionSetting
  :: forall r
   . UpdateNotificationRestrictionSettingInput
  -> SelectionSet Scope__UpdateNotificationRestrictionSettingPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateNotificationRestrictionSetting input = selectionForCompositeField
                                             "updateNotificationRestrictionSetting"
                                             (toGraphQLArguments
                                              input)
                                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateOrganizationAllowPrivateRepositoryForkingSettingInputRowRequired r
  = ( input
      :: Examples.Github.InputObject.UpdateOrganizationAllowPrivateRepositoryForkingSettingInput
    | r
    )

type UpdateOrganizationAllowPrivateRepositoryForkingSettingInput
  = { | UpdateOrganizationAllowPrivateRepositoryForkingSettingInputRowRequired
      + ()
    }

updateOrganizationAllowPrivateRepositoryForkingSetting
  :: forall r
   . UpdateOrganizationAllowPrivateRepositoryForkingSettingInput
  -> SelectionSet
        Scope__UpdateOrganizationAllowPrivateRepositoryForkingSettingPayload
        r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateOrganizationAllowPrivateRepositoryForkingSetting input = selectionForCompositeField
                                                               "updateOrganizationAllowPrivateRepositoryForkingSetting"
                                                               (toGraphQLArguments
                                                                input)
                                                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateProjectInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateProjectInput | r )

type UpdateProjectInput = { | UpdateProjectInputRowRequired + () }

updateProject
  :: forall r
   . UpdateProjectInput
  -> SelectionSet Scope__UpdateProjectPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateProject input = selectionForCompositeField
                      "updateProject"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateProjectCardInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateProjectCardInput | r )

type UpdateProjectCardInput = { | UpdateProjectCardInputRowRequired + () }

updateProjectCard
  :: forall r
   . UpdateProjectCardInput
  -> SelectionSet Scope__UpdateProjectCardPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateProjectCard input = selectionForCompositeField
                          "updateProjectCard"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateProjectColumnInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateProjectColumnInput | r )

type UpdateProjectColumnInput = { | UpdateProjectColumnInputRowRequired + () }

updateProjectColumn
  :: forall r
   . UpdateProjectColumnInput
  -> SelectionSet Scope__UpdateProjectColumnPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateProjectColumn input = selectionForCompositeField
                            "updateProjectColumn"
                            (toGraphQLArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateProjectNextItemFieldInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateProjectNextItemFieldInput | r )

type UpdateProjectNextItemFieldInput
  = { | UpdateProjectNextItemFieldInputRowRequired + () }

updateProjectNextItemField
  :: forall r
   . UpdateProjectNextItemFieldInput
  -> SelectionSet Scope__UpdateProjectNextItemFieldPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateProjectNextItemField input = selectionForCompositeField
                                   "updateProjectNextItemField"
                                   (toGraphQLArguments
                                    input)
                                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdatePullRequestInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdatePullRequestInput | r )

type UpdatePullRequestInput = { | UpdatePullRequestInputRowRequired + () }

updatePullRequest
  :: forall r
   . UpdatePullRequestInput
  -> SelectionSet Scope__UpdatePullRequestPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updatePullRequest input = selectionForCompositeField
                          "updatePullRequest"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdatePullRequestBranchInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdatePullRequestBranchInput | r )

type UpdatePullRequestBranchInput
  = { | UpdatePullRequestBranchInputRowRequired + () }

updatePullRequestBranch
  :: forall r
   . UpdatePullRequestBranchInput
  -> SelectionSet Scope__UpdatePullRequestBranchPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updatePullRequestBranch input = selectionForCompositeField
                                "updatePullRequestBranch"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdatePullRequestReviewInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdatePullRequestReviewInput | r )

type UpdatePullRequestReviewInput
  = { | UpdatePullRequestReviewInputRowRequired + () }

updatePullRequestReview
  :: forall r
   . UpdatePullRequestReviewInput
  -> SelectionSet Scope__UpdatePullRequestReviewPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updatePullRequestReview input = selectionForCompositeField
                                "updatePullRequestReview"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdatePullRequestReviewCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdatePullRequestReviewCommentInput
    | r
    )

type UpdatePullRequestReviewCommentInput
  = { | UpdatePullRequestReviewCommentInputRowRequired + () }

updatePullRequestReviewComment
  :: forall r
   . UpdatePullRequestReviewCommentInput
  -> SelectionSet Scope__UpdatePullRequestReviewCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updatePullRequestReviewComment input = selectionForCompositeField
                                       "updatePullRequestReviewComment"
                                       (toGraphQLArguments
                                        input)
                                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateRefInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateRefInput | r )

type UpdateRefInput = { | UpdateRefInputRowRequired + () }

updateRef
  :: forall r
   . UpdateRefInput
  -> SelectionSet Scope__UpdateRefPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateRef input = selectionForCompositeField
                  "updateRef"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateRepositoryInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateRepositoryInput | r )

type UpdateRepositoryInput = { | UpdateRepositoryInputRowRequired + () }

updateRepository
  :: forall r
   . UpdateRepositoryInput
  -> SelectionSet Scope__UpdateRepositoryPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateRepository input = selectionForCompositeField
                         "updateRepository"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateSponsorshipPreferencesInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateSponsorshipPreferencesInput
    | r
    )

type UpdateSponsorshipPreferencesInput
  = { | UpdateSponsorshipPreferencesInputRowRequired + () }

updateSponsorshipPreferences
  :: forall r
   . UpdateSponsorshipPreferencesInput
  -> SelectionSet Scope__UpdateSponsorshipPreferencesPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateSponsorshipPreferences input = selectionForCompositeField
                                     "updateSponsorshipPreferences"
                                     (toGraphQLArguments
                                      input)
                                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateSubscriptionInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateSubscriptionInput | r )

type UpdateSubscriptionInput = { | UpdateSubscriptionInputRowRequired + () }

updateSubscription
  :: forall r
   . UpdateSubscriptionInput
  -> SelectionSet Scope__UpdateSubscriptionPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateSubscription input = selectionForCompositeField
                           "updateSubscription"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateTeamDiscussionInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateTeamDiscussionInput | r )

type UpdateTeamDiscussionInput = { | UpdateTeamDiscussionInputRowRequired + () }

updateTeamDiscussion
  :: forall r
   . UpdateTeamDiscussionInput
  -> SelectionSet Scope__UpdateTeamDiscussionPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateTeamDiscussion input = selectionForCompositeField
                             "updateTeamDiscussion"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateTeamDiscussionCommentInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateTeamDiscussionCommentInput
    | r
    )

type UpdateTeamDiscussionCommentInput
  = { | UpdateTeamDiscussionCommentInputRowRequired + () }

updateTeamDiscussionComment
  :: forall r
   . UpdateTeamDiscussionCommentInput
  -> SelectionSet Scope__UpdateTeamDiscussionCommentPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateTeamDiscussionComment input = selectionForCompositeField
                                    "updateTeamDiscussionComment"
                                    (toGraphQLArguments
                                     input)
                                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UpdateTopicsInputRowRequired r
  = ( input :: Examples.Github.InputObject.UpdateTopicsInput | r )

type UpdateTopicsInput = { | UpdateTopicsInputRowRequired + () }

updateTopics
  :: forall r
   . UpdateTopicsInput
  -> SelectionSet Scope__UpdateTopicsPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
updateTopics input = selectionForCompositeField
                     "updateTopics"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type VerifyVerifiableDomainInputRowRequired r
  = ( input :: Examples.Github.InputObject.VerifyVerifiableDomainInput | r )

type VerifyVerifiableDomainInput
  = { | VerifyVerifiableDomainInputRowRequired + () }

verifyVerifiableDomain
  :: forall r
   . VerifyVerifiableDomainInput
  -> SelectionSet Scope__VerifyVerifiableDomainPayload r
  -> SelectionSet Scope__RootMutation (Maybe r)
verifyVerifiableDomain input = selectionForCompositeField
                               "verifyVerifiableDomain"
                               (toGraphQLArguments
                                input)
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer
