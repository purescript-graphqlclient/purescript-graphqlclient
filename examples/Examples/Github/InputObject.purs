module Examples.Github.InputObject where

import Examples.Github.Scalars (Id, GitObjectId, Uri, DateTime, Base64String)
import GraphQLClient
  (Optional, class ToGraphQLArgumentValue, toGraphQLArgumentValue)
import Data.Generic.Rep (class Generic)
import Data.Newtype (class Newtype)
import Examples.Github.Enum.PullRequestReviewEvent (PullRequestReviewEvent)
import Data.Maybe (Maybe)
import Examples.Github.Enum.DiffSide (DiffSide)
import Examples.Github.Enum.ReactionContent (ReactionContent)
import Examples.Github.Enum.AuditLogOrderField (AuditLogOrderField)
import Examples.Github.Enum.OrderDirection (OrderDirection)
import Examples.Github.Enum.CheckAnnotationLevel (CheckAnnotationLevel)
import Examples.Github.Enum.CheckRunType (CheckRunType)
import Examples.Github.Enum.CheckStatusState (CheckStatusState)
import Examples.Github.Enum.RepositoryVisibility (RepositoryVisibility)
import Examples.Github.Enum.CommitContributionOrderField
  (CommitContributionOrderField)
import Examples.Github.Enum.RequestableCheckStatusState
  (RequestableCheckStatusState)
import Examples.Github.Enum.CheckConclusionState (CheckConclusionState)
import Examples.Github.Enum.MigrationSourceType (MigrationSourceType)
import Examples.Github.Enum.ProjectTemplate (ProjectTemplate)
import Examples.Github.Enum.SponsorshipPrivacy (SponsorshipPrivacy)
import Examples.Github.Enum.TopicSuggestionDeclineReason
  (TopicSuggestionDeclineReason)
import Examples.Github.Enum.DeploymentOrderField (DeploymentOrderField)
import Examples.Github.Enum.DiscussionOrderField (DiscussionOrderField)
import Examples.Github.Enum.DismissReason (DismissReason)
import Examples.Github.Enum.PullRequestMergeMethod (PullRequestMergeMethod)
import Examples.Github.Enum.EnterpriseAdministratorInvitationOrderField
  (EnterpriseAdministratorInvitationOrderField)
import Examples.Github.Enum.EnterpriseMemberOrderField
  (EnterpriseMemberOrderField)
import Examples.Github.Enum.EnterpriseServerInstallationOrderField
  (EnterpriseServerInstallationOrderField)
import Examples.Github.Enum.EnterpriseServerUserAccountEmailOrderField
  (EnterpriseServerUserAccountEmailOrderField)
import Examples.Github.Enum.EnterpriseServerUserAccountOrderField
  (EnterpriseServerUserAccountOrderField)
import Examples.Github.Enum.EnterpriseServerUserAccountsUploadOrderField
  (EnterpriseServerUserAccountsUploadOrderField)
import Examples.Github.Enum.GistOrderField (GistOrderField)
import Examples.Github.Enum.ActorType (ActorType)
import Examples.Github.Enum.EnterpriseAdministratorRole
  (EnterpriseAdministratorRole)
import Examples.Github.Enum.IpAllowListEntryOrderField
  (IpAllowListEntryOrderField)
import Examples.Github.Enum.IssueCommentOrderField (IssueCommentOrderField)
import Examples.Github.Enum.IssueState (IssueState)
import Examples.Github.Enum.IssueOrderField (IssueOrderField)
import Examples.Github.Enum.LabelOrderField (LabelOrderField)
import Examples.Github.Enum.LanguageOrderField (LanguageOrderField)
import Examples.Github.Enum.LockReason (LockReason)
import Examples.Github.Enum.MilestoneOrderField (MilestoneOrderField)
import Examples.Github.Enum.ReportedContentClassifiers
  (ReportedContentClassifiers)
import Examples.Github.Enum.OrgEnterpriseOwnerOrderField
  (OrgEnterpriseOwnerOrderField)
import Examples.Github.Enum.OrganizationOrderField (OrganizationOrderField)
import Examples.Github.Enum.PackageFileOrderField (PackageFileOrderField)
import Examples.Github.Enum.PackageOrderField (PackageOrderField)
import Examples.Github.Enum.PackageVersionOrderField (PackageVersionOrderField)
import Examples.Github.Enum.ProjectOrderField (ProjectOrderField)
import Examples.Github.Enum.PullRequestOrderField (PullRequestOrderField)
import Examples.Github.Enum.ReactionOrderField (ReactionOrderField)
import Examples.Github.Enum.RefOrderField (RefOrderField)
import Examples.Github.Enum.ReleaseOrderField (ReleaseOrderField)
import Examples.Github.Enum.RepositoryInvitationOrderField
  (RepositoryInvitationOrderField)
import Examples.Github.Enum.RepositoryMigrationOrderField
  (RepositoryMigrationOrderField)
import Examples.Github.Enum.RepositoryMigrationOrderDirection
  (RepositoryMigrationOrderDirection)
import Examples.Github.Enum.RepositoryOrderField (RepositoryOrderField)
import Examples.Github.Enum.SavedReplyOrderField (SavedReplyOrderField)
import Examples.Github.Enum.SecurityAdvisoryIdentifierType
  (SecurityAdvisoryIdentifierType)
import Examples.Github.Enum.SecurityAdvisoryOrderField
  (SecurityAdvisoryOrderField)
import Examples.Github.Enum.SecurityVulnerabilityOrderField
  (SecurityVulnerabilityOrderField)
import Examples.Github.Enum.SamlSignatureAlgorithm (SamlSignatureAlgorithm)
import Examples.Github.Enum.SamlDigestAlgorithm (SamlDigestAlgorithm)
import Examples.Github.Enum.RepositoryInteractionLimit
  (RepositoryInteractionLimit)
import Examples.Github.Enum.RepositoryInteractionLimitExpiry
  (RepositoryInteractionLimitExpiry)
import Examples.Github.Enum.SponsorOrderField (SponsorOrderField)
import Examples.Github.Enum.SponsorableOrderField (SponsorableOrderField)
import Examples.Github.Enum.SponsorsActivityOrderField
  (SponsorsActivityOrderField)
import Examples.Github.Enum.SponsorsTierOrderField (SponsorsTierOrderField)
import Examples.Github.Enum.SponsorshipNewsletterOrderField
  (SponsorshipNewsletterOrderField)
import Examples.Github.Enum.SponsorshipOrderField (SponsorshipOrderField)
import Examples.Github.Enum.StarOrderField (StarOrderField)
import Examples.Github.Enum.TeamDiscussionCommentOrderField
  (TeamDiscussionCommentOrderField)
import Examples.Github.Enum.TeamDiscussionOrderField (TeamDiscussionOrderField)
import Examples.Github.Enum.TeamMemberOrderField (TeamMemberOrderField)
import Examples.Github.Enum.TeamOrderField (TeamOrderField)
import Examples.Github.Enum.TeamRepositoryOrderField (TeamRepositoryOrderField)
import Examples.Github.Enum.EnterpriseEnabledDisabledSettingValue
  (EnterpriseEnabledDisabledSettingValue)
import Examples.Github.Enum.EnterpriseDefaultRepositoryPermissionSettingValue
  (EnterpriseDefaultRepositoryPermissionSettingValue)
import Examples.Github.Enum.EnterpriseMembersCanCreateRepositoriesSettingValue
  (EnterpriseMembersCanCreateRepositoriesSettingValue)
import Examples.Github.Enum.EnterpriseMembersCanMakePurchasesSettingValue
  (EnterpriseMembersCanMakePurchasesSettingValue)
import Examples.Github.Enum.RoleInOrganization (RoleInOrganization)
import Examples.Github.Enum.EnterpriseEnabledSettingValue
  (EnterpriseEnabledSettingValue)
import Examples.Github.Enum.IpAllowListEnabledSettingValue
  (IpAllowListEnabledSettingValue)
import Examples.Github.Enum.IpAllowListForInstalledAppsEnabledSettingValue
  (IpAllowListForInstalledAppsEnabledSettingValue)
import Examples.Github.Enum.NotificationRestrictionSettingValue
  (NotificationRestrictionSettingValue)
import Examples.Github.Enum.ProjectState (ProjectState)
import Examples.Github.Enum.PullRequestUpdateState (PullRequestUpdateState)
import Examples.Github.Enum.SubscriptionState (SubscriptionState)
import Examples.Github.Enum.UserStatusOrderField (UserStatusOrderField)
import Examples.Github.Enum.VerifiableDomainOrderField
  (VerifiableDomainOrderField)

-- | original name - AbortQueuedMigrationsInput
newtype AbortQueuedMigrationsInput
  = AbortQueuedMigrationsInput
    { ownerId :: Id, clientMutationId :: Optional String }

derive instance genericAbortQueuedMigrationsInput
  ::
  Generic AbortQueuedMigrationsInput _

derive instance newtypeAbortQueuedMigrationsInput
  ::
  Newtype AbortQueuedMigrationsInput _

instance toGraphQLArgumentValueAbortQueuedMigrationsInput
  :: ToGraphQLArgumentValue AbortQueuedMigrationsInput where
  toGraphQLArgumentValue (AbortQueuedMigrationsInput x) = toGraphQLArgumentValue
                                                          x

-- | original name - AcceptEnterpriseAdministratorInvitationInput
newtype AcceptEnterpriseAdministratorInvitationInput
  = AcceptEnterpriseAdministratorInvitationInput
    { invitationId :: Id, clientMutationId :: Optional String }

derive instance genericAcceptEnterpriseAdministratorInvitationInput
  ::
  Generic AcceptEnterpriseAdministratorInvitationInput _

derive instance newtypeAcceptEnterpriseAdministratorInvitationInput
  ::
  Newtype AcceptEnterpriseAdministratorInvitationInput _

instance toGraphQLArgumentValueAcceptEnterpriseAdministratorInvitationInput
  :: ToGraphQLArgumentValue AcceptEnterpriseAdministratorInvitationInput where
  toGraphQLArgumentValue (AcceptEnterpriseAdministratorInvitationInput x) = toGraphQLArgumentValue
                                                                            x

-- | original name - AcceptTopicSuggestionInput
newtype AcceptTopicSuggestionInput
  = AcceptTopicSuggestionInput
    { repositoryId :: Id, name :: String, clientMutationId :: Optional String }

derive instance genericAcceptTopicSuggestionInput
  ::
  Generic AcceptTopicSuggestionInput _

derive instance newtypeAcceptTopicSuggestionInput
  ::
  Newtype AcceptTopicSuggestionInput _

instance toGraphQLArgumentValueAcceptTopicSuggestionInput
  :: ToGraphQLArgumentValue AcceptTopicSuggestionInput where
  toGraphQLArgumentValue (AcceptTopicSuggestionInput x) = toGraphQLArgumentValue
                                                          x

-- | original name - AddAssigneesToAssignableInput
newtype AddAssigneesToAssignableInput
  = AddAssigneesToAssignableInput
    { assignableId :: Id
    , assigneeIds :: Array Id
    , clientMutationId :: Optional String
    }

derive instance genericAddAssigneesToAssignableInput
  ::
  Generic AddAssigneesToAssignableInput _

derive instance newtypeAddAssigneesToAssignableInput
  ::
  Newtype AddAssigneesToAssignableInput _

instance toGraphQLArgumentValueAddAssigneesToAssignableInput
  :: ToGraphQLArgumentValue AddAssigneesToAssignableInput where
  toGraphQLArgumentValue (AddAssigneesToAssignableInput x) = toGraphQLArgumentValue
                                                             x

-- | original name - AddCommentInput
newtype AddCommentInput
  = AddCommentInput
    { subjectId :: Id, body :: String, clientMutationId :: Optional String }

derive instance genericAddCommentInput :: Generic AddCommentInput _

derive instance newtypeAddCommentInput :: Newtype AddCommentInput _

instance toGraphQLArgumentValueAddCommentInput
  :: ToGraphQLArgumentValue AddCommentInput where
  toGraphQLArgumentValue (AddCommentInput x) = toGraphQLArgumentValue x

-- | original name - AddDiscussionCommentInput
newtype AddDiscussionCommentInput
  = AddDiscussionCommentInput
    { discussionId :: Id
    , replyToId :: Optional Id
    , body :: String
    , clientMutationId :: Optional String
    }

derive instance genericAddDiscussionCommentInput
  ::
  Generic AddDiscussionCommentInput _

derive instance newtypeAddDiscussionCommentInput
  ::
  Newtype AddDiscussionCommentInput _

instance toGraphQLArgumentValueAddDiscussionCommentInput
  :: ToGraphQLArgumentValue AddDiscussionCommentInput where
  toGraphQLArgumentValue (AddDiscussionCommentInput x) = toGraphQLArgumentValue
                                                         x

-- | original name - AddEnterpriseSupportEntitlementInput
newtype AddEnterpriseSupportEntitlementInput
  = AddEnterpriseSupportEntitlementInput
    { enterpriseId :: Id, login :: String, clientMutationId :: Optional String }

derive instance genericAddEnterpriseSupportEntitlementInput
  ::
  Generic AddEnterpriseSupportEntitlementInput _

derive instance newtypeAddEnterpriseSupportEntitlementInput
  ::
  Newtype AddEnterpriseSupportEntitlementInput _

instance toGraphQLArgumentValueAddEnterpriseSupportEntitlementInput
  :: ToGraphQLArgumentValue AddEnterpriseSupportEntitlementInput where
  toGraphQLArgumentValue (AddEnterpriseSupportEntitlementInput x) = toGraphQLArgumentValue
                                                                    x

-- | original name - AddLabelsToLabelableInput
newtype AddLabelsToLabelableInput
  = AddLabelsToLabelableInput
    { labelableId :: Id
    , labelIds :: Array Id
    , clientMutationId :: Optional String
    }

derive instance genericAddLabelsToLabelableInput
  ::
  Generic AddLabelsToLabelableInput _

derive instance newtypeAddLabelsToLabelableInput
  ::
  Newtype AddLabelsToLabelableInput _

instance toGraphQLArgumentValueAddLabelsToLabelableInput
  :: ToGraphQLArgumentValue AddLabelsToLabelableInput where
  toGraphQLArgumentValue (AddLabelsToLabelableInput x) = toGraphQLArgumentValue
                                                         x

-- | original name - AddProjectCardInput
newtype AddProjectCardInput
  = AddProjectCardInput
    { projectColumnId :: Id
    , contentId :: Optional Id
    , note :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericAddProjectCardInput :: Generic AddProjectCardInput _

derive instance newtypeAddProjectCardInput :: Newtype AddProjectCardInput _

instance toGraphQLArgumentValueAddProjectCardInput
  :: ToGraphQLArgumentValue AddProjectCardInput where
  toGraphQLArgumentValue (AddProjectCardInput x) = toGraphQLArgumentValue x

-- | original name - AddProjectColumnInput
newtype AddProjectColumnInput
  = AddProjectColumnInput
    { projectId :: Id, name :: String, clientMutationId :: Optional String }

derive instance genericAddProjectColumnInput :: Generic AddProjectColumnInput _

derive instance newtypeAddProjectColumnInput :: Newtype AddProjectColumnInput _

instance toGraphQLArgumentValueAddProjectColumnInput
  :: ToGraphQLArgumentValue AddProjectColumnInput where
  toGraphQLArgumentValue (AddProjectColumnInput x) = toGraphQLArgumentValue x

-- | original name - AddProjectNextItemInput
newtype AddProjectNextItemInput
  = AddProjectNextItemInput
    { projectId :: Id, contentId :: Id, clientMutationId :: Optional String }

derive instance genericAddProjectNextItemInput
  ::
  Generic AddProjectNextItemInput _

derive instance newtypeAddProjectNextItemInput
  ::
  Newtype AddProjectNextItemInput _

instance toGraphQLArgumentValueAddProjectNextItemInput
  :: ToGraphQLArgumentValue AddProjectNextItemInput where
  toGraphQLArgumentValue (AddProjectNextItemInput x) = toGraphQLArgumentValue x

-- | original name - AddPullRequestReviewCommentInput
newtype AddPullRequestReviewCommentInput
  = AddPullRequestReviewCommentInput
    { pullRequestId :: Optional Id
    , pullRequestReviewId :: Optional Id
    , commitOID :: Optional GitObjectId
    , body :: String
    , path :: Optional String
    , position :: Optional Int
    , inReplyTo :: Optional Id
    , clientMutationId :: Optional String
    }

derive instance genericAddPullRequestReviewCommentInput
  ::
  Generic AddPullRequestReviewCommentInput _

derive instance newtypeAddPullRequestReviewCommentInput
  ::
  Newtype AddPullRequestReviewCommentInput _

instance toGraphQLArgumentValueAddPullRequestReviewCommentInput
  :: ToGraphQLArgumentValue AddPullRequestReviewCommentInput where
  toGraphQLArgumentValue (AddPullRequestReviewCommentInput x) = toGraphQLArgumentValue
                                                                x

-- | original name - AddPullRequestReviewInput
newtype AddPullRequestReviewInput
  = AddPullRequestReviewInput
    { pullRequestId :: Id
    , commitOID :: Optional GitObjectId
    , body :: Optional String
    , event :: Optional PullRequestReviewEvent
    , comments :: Optional (Array (Maybe DraftPullRequestReviewComment))
    , threads :: Optional (Array (Maybe DraftPullRequestReviewThread))
    , clientMutationId :: Optional String
    }

derive instance genericAddPullRequestReviewInput
  ::
  Generic AddPullRequestReviewInput _

derive instance newtypeAddPullRequestReviewInput
  ::
  Newtype AddPullRequestReviewInput _

instance toGraphQLArgumentValueAddPullRequestReviewInput
  :: ToGraphQLArgumentValue AddPullRequestReviewInput where
  toGraphQLArgumentValue (AddPullRequestReviewInput x) = toGraphQLArgumentValue
                                                         x

-- | original name - AddPullRequestReviewThreadInput
newtype AddPullRequestReviewThreadInput
  = AddPullRequestReviewThreadInput
    { path :: String
    , body :: String
    , pullRequestId :: Optional Id
    , pullRequestReviewId :: Optional Id
    , line :: Int
    , side :: Optional DiffSide
    , startLine :: Optional Int
    , startSide :: Optional DiffSide
    , clientMutationId :: Optional String
    }

derive instance genericAddPullRequestReviewThreadInput
  ::
  Generic AddPullRequestReviewThreadInput _

derive instance newtypeAddPullRequestReviewThreadInput
  ::
  Newtype AddPullRequestReviewThreadInput _

instance toGraphQLArgumentValueAddPullRequestReviewThreadInput
  :: ToGraphQLArgumentValue AddPullRequestReviewThreadInput where
  toGraphQLArgumentValue (AddPullRequestReviewThreadInput x) = toGraphQLArgumentValue
                                                               x

-- | original name - AddReactionInput
newtype AddReactionInput
  = AddReactionInput
    { subjectId :: Id
    , content :: ReactionContent
    , clientMutationId :: Optional String
    }

derive instance genericAddReactionInput :: Generic AddReactionInput _

derive instance newtypeAddReactionInput :: Newtype AddReactionInput _

instance toGraphQLArgumentValueAddReactionInput
  :: ToGraphQLArgumentValue AddReactionInput where
  toGraphQLArgumentValue (AddReactionInput x) = toGraphQLArgumentValue x

-- | original name - AddStarInput
newtype AddStarInput
  = AddStarInput { starrableId :: Id, clientMutationId :: Optional String }

derive instance genericAddStarInput :: Generic AddStarInput _

derive instance newtypeAddStarInput :: Newtype AddStarInput _

instance toGraphQLArgumentValueAddStarInput
  :: ToGraphQLArgumentValue AddStarInput where
  toGraphQLArgumentValue (AddStarInput x) = toGraphQLArgumentValue x

-- | original name - AddUpvoteInput
newtype AddUpvoteInput
  = AddUpvoteInput { subjectId :: Id, clientMutationId :: Optional String }

derive instance genericAddUpvoteInput :: Generic AddUpvoteInput _

derive instance newtypeAddUpvoteInput :: Newtype AddUpvoteInput _

instance toGraphQLArgumentValueAddUpvoteInput
  :: ToGraphQLArgumentValue AddUpvoteInput where
  toGraphQLArgumentValue (AddUpvoteInput x) = toGraphQLArgumentValue x

-- | original name - AddVerifiableDomainInput
newtype AddVerifiableDomainInput
  = AddVerifiableDomainInput
    { ownerId :: Id, domain :: Uri, clientMutationId :: Optional String }

derive instance genericAddVerifiableDomainInput
  ::
  Generic AddVerifiableDomainInput _

derive instance newtypeAddVerifiableDomainInput
  ::
  Newtype AddVerifiableDomainInput _

instance toGraphQLArgumentValueAddVerifiableDomainInput
  :: ToGraphQLArgumentValue AddVerifiableDomainInput where
  toGraphQLArgumentValue (AddVerifiableDomainInput x) = toGraphQLArgumentValue x

-- | original name - ApproveDeploymentsInput
newtype ApproveDeploymentsInput
  = ApproveDeploymentsInput
    { workflowRunId :: Id
    , environmentIds :: Array Id
    , comment :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericApproveDeploymentsInput
  ::
  Generic ApproveDeploymentsInput _

derive instance newtypeApproveDeploymentsInput
  ::
  Newtype ApproveDeploymentsInput _

instance toGraphQLArgumentValueApproveDeploymentsInput
  :: ToGraphQLArgumentValue ApproveDeploymentsInput where
  toGraphQLArgumentValue (ApproveDeploymentsInput x) = toGraphQLArgumentValue x

-- | original name - ApproveVerifiableDomainInput
newtype ApproveVerifiableDomainInput
  = ApproveVerifiableDomainInput
    { id :: Id, clientMutationId :: Optional String }

derive instance genericApproveVerifiableDomainInput
  ::
  Generic ApproveVerifiableDomainInput _

derive instance newtypeApproveVerifiableDomainInput
  ::
  Newtype ApproveVerifiableDomainInput _

instance toGraphQLArgumentValueApproveVerifiableDomainInput
  :: ToGraphQLArgumentValue ApproveVerifiableDomainInput where
  toGraphQLArgumentValue (ApproveVerifiableDomainInput x) = toGraphQLArgumentValue
                                                            x

-- | original name - ArchiveRepositoryInput
newtype ArchiveRepositoryInput
  = ArchiveRepositoryInput
    { repositoryId :: Id, clientMutationId :: Optional String }

derive instance genericArchiveRepositoryInput
  ::
  Generic ArchiveRepositoryInput _

derive instance newtypeArchiveRepositoryInput
  ::
  Newtype ArchiveRepositoryInput _

instance toGraphQLArgumentValueArchiveRepositoryInput
  :: ToGraphQLArgumentValue ArchiveRepositoryInput where
  toGraphQLArgumentValue (ArchiveRepositoryInput x) = toGraphQLArgumentValue x

-- | original name - AuditLogOrder
newtype AuditLogOrder
  = AuditLogOrder
    { field :: Optional AuditLogOrderField
    , direction :: Optional OrderDirection
    }

derive instance genericAuditLogOrder :: Generic AuditLogOrder _

derive instance newtypeAuditLogOrder :: Newtype AuditLogOrder _

instance toGraphQLArgumentValueAuditLogOrder
  :: ToGraphQLArgumentValue AuditLogOrder where
  toGraphQLArgumentValue (AuditLogOrder x) = toGraphQLArgumentValue x

-- | original name - CancelEnterpriseAdminInvitationInput
newtype CancelEnterpriseAdminInvitationInput
  = CancelEnterpriseAdminInvitationInput
    { invitationId :: Id, clientMutationId :: Optional String }

derive instance genericCancelEnterpriseAdminInvitationInput
  ::
  Generic CancelEnterpriseAdminInvitationInput _

derive instance newtypeCancelEnterpriseAdminInvitationInput
  ::
  Newtype CancelEnterpriseAdminInvitationInput _

instance toGraphQLArgumentValueCancelEnterpriseAdminInvitationInput
  :: ToGraphQLArgumentValue CancelEnterpriseAdminInvitationInput where
  toGraphQLArgumentValue (CancelEnterpriseAdminInvitationInput x) = toGraphQLArgumentValue
                                                                    x

-- | original name - CancelSponsorshipInput
newtype CancelSponsorshipInput
  = CancelSponsorshipInput
    { sponsorId :: Optional Id
    , sponsorLogin :: Optional String
    , sponsorableId :: Optional Id
    , sponsorableLogin :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericCancelSponsorshipInput
  ::
  Generic CancelSponsorshipInput _

derive instance newtypeCancelSponsorshipInput
  ::
  Newtype CancelSponsorshipInput _

instance toGraphQLArgumentValueCancelSponsorshipInput
  :: ToGraphQLArgumentValue CancelSponsorshipInput where
  toGraphQLArgumentValue (CancelSponsorshipInput x) = toGraphQLArgumentValue x

-- | original name - ChangeUserStatusInput
newtype ChangeUserStatusInput
  = ChangeUserStatusInput
    { emoji :: Optional String
    , message :: Optional String
    , organizationId :: Optional Id
    , limitedAvailability :: Optional Boolean
    , expiresAt :: Optional DateTime
    , clientMutationId :: Optional String
    }

derive instance genericChangeUserStatusInput :: Generic ChangeUserStatusInput _

derive instance newtypeChangeUserStatusInput :: Newtype ChangeUserStatusInput _

instance toGraphQLArgumentValueChangeUserStatusInput
  :: ToGraphQLArgumentValue ChangeUserStatusInput where
  toGraphQLArgumentValue (ChangeUserStatusInput x) = toGraphQLArgumentValue x

-- | original name - CheckAnnotationData
newtype CheckAnnotationData
  = CheckAnnotationData
    { path :: String
    , location :: CheckAnnotationRange
    , annotationLevel :: CheckAnnotationLevel
    , message :: String
    , title :: Optional String
    , rawDetails :: Optional String
    }

derive instance genericCheckAnnotationData :: Generic CheckAnnotationData _

derive instance newtypeCheckAnnotationData :: Newtype CheckAnnotationData _

instance toGraphQLArgumentValueCheckAnnotationData
  :: ToGraphQLArgumentValue CheckAnnotationData where
  toGraphQLArgumentValue (CheckAnnotationData x) = toGraphQLArgumentValue x

-- | original name - CheckAnnotationRange
newtype CheckAnnotationRange
  = CheckAnnotationRange
    { startLine :: Int
    , startColumn :: Optional Int
    , endLine :: Int
    , endColumn :: Optional Int
    }

derive instance genericCheckAnnotationRange :: Generic CheckAnnotationRange _

derive instance newtypeCheckAnnotationRange :: Newtype CheckAnnotationRange _

instance toGraphQLArgumentValueCheckAnnotationRange
  :: ToGraphQLArgumentValue CheckAnnotationRange where
  toGraphQLArgumentValue (CheckAnnotationRange x) = toGraphQLArgumentValue x

-- | original name - CheckRunAction
newtype CheckRunAction
  = CheckRunAction
    { label :: String, description :: String, identifier :: String }

derive instance genericCheckRunAction :: Generic CheckRunAction _

derive instance newtypeCheckRunAction :: Newtype CheckRunAction _

instance toGraphQLArgumentValueCheckRunAction
  :: ToGraphQLArgumentValue CheckRunAction where
  toGraphQLArgumentValue (CheckRunAction x) = toGraphQLArgumentValue x

-- | original name - CheckRunFilter
newtype CheckRunFilter
  = CheckRunFilter
    { checkType :: Optional CheckRunType
    , appId :: Optional Int
    , checkName :: Optional String
    , status :: Optional CheckStatusState
    }

derive instance genericCheckRunFilter :: Generic CheckRunFilter _

derive instance newtypeCheckRunFilter :: Newtype CheckRunFilter _

instance toGraphQLArgumentValueCheckRunFilter
  :: ToGraphQLArgumentValue CheckRunFilter where
  toGraphQLArgumentValue (CheckRunFilter x) = toGraphQLArgumentValue x

-- | original name - CheckRunOutput
newtype CheckRunOutput
  = CheckRunOutput
    { title :: String
    , summary :: String
    , text :: Optional String
    , annotations :: Optional (Array CheckAnnotationData)
    , images :: Optional (Array CheckRunOutputImage)
    }

derive instance genericCheckRunOutput :: Generic CheckRunOutput _

derive instance newtypeCheckRunOutput :: Newtype CheckRunOutput _

instance toGraphQLArgumentValueCheckRunOutput
  :: ToGraphQLArgumentValue CheckRunOutput where
  toGraphQLArgumentValue (CheckRunOutput x) = toGraphQLArgumentValue x

-- | original name - CheckRunOutputImage
newtype CheckRunOutputImage
  = CheckRunOutputImage
    { alt :: String, imageUrl :: Uri, caption :: Optional String }

derive instance genericCheckRunOutputImage :: Generic CheckRunOutputImage _

derive instance newtypeCheckRunOutputImage :: Newtype CheckRunOutputImage _

instance toGraphQLArgumentValueCheckRunOutputImage
  :: ToGraphQLArgumentValue CheckRunOutputImage where
  toGraphQLArgumentValue (CheckRunOutputImage x) = toGraphQLArgumentValue x

-- | original name - CheckSuiteAutoTriggerPreference
newtype CheckSuiteAutoTriggerPreference
  = CheckSuiteAutoTriggerPreference { appId :: Id, setting :: Boolean }

derive instance genericCheckSuiteAutoTriggerPreference
  ::
  Generic CheckSuiteAutoTriggerPreference _

derive instance newtypeCheckSuiteAutoTriggerPreference
  ::
  Newtype CheckSuiteAutoTriggerPreference _

instance toGraphQLArgumentValueCheckSuiteAutoTriggerPreference
  :: ToGraphQLArgumentValue CheckSuiteAutoTriggerPreference where
  toGraphQLArgumentValue (CheckSuiteAutoTriggerPreference x) = toGraphQLArgumentValue
                                                               x

-- | original name - CheckSuiteFilter
newtype CheckSuiteFilter
  = CheckSuiteFilter { appId :: Optional Int, checkName :: Optional String }

derive instance genericCheckSuiteFilter :: Generic CheckSuiteFilter _

derive instance newtypeCheckSuiteFilter :: Newtype CheckSuiteFilter _

instance toGraphQLArgumentValueCheckSuiteFilter
  :: ToGraphQLArgumentValue CheckSuiteFilter where
  toGraphQLArgumentValue (CheckSuiteFilter x) = toGraphQLArgumentValue x

-- | original name - ClearLabelsFromLabelableInput
newtype ClearLabelsFromLabelableInput
  = ClearLabelsFromLabelableInput
    { labelableId :: Id, clientMutationId :: Optional String }

derive instance genericClearLabelsFromLabelableInput
  ::
  Generic ClearLabelsFromLabelableInput _

derive instance newtypeClearLabelsFromLabelableInput
  ::
  Newtype ClearLabelsFromLabelableInput _

instance toGraphQLArgumentValueClearLabelsFromLabelableInput
  :: ToGraphQLArgumentValue ClearLabelsFromLabelableInput where
  toGraphQLArgumentValue (ClearLabelsFromLabelableInput x) = toGraphQLArgumentValue
                                                             x

-- | original name - CloneProjectInput
newtype CloneProjectInput
  = CloneProjectInput
    { targetOwnerId :: Id
    , sourceId :: Id
    , includeWorkflows :: Boolean
    , name :: String
    , body :: Optional String
    , public :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericCloneProjectInput :: Generic CloneProjectInput _

derive instance newtypeCloneProjectInput :: Newtype CloneProjectInput _

instance toGraphQLArgumentValueCloneProjectInput
  :: ToGraphQLArgumentValue CloneProjectInput where
  toGraphQLArgumentValue (CloneProjectInput x) = toGraphQLArgumentValue x

-- | original name - CloneTemplateRepositoryInput
newtype CloneTemplateRepositoryInput
  = CloneTemplateRepositoryInput
    { repositoryId :: Id
    , name :: String
    , ownerId :: Id
    , description :: Optional String
    , visibility :: RepositoryVisibility
    , includeAllBranches :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericCloneTemplateRepositoryInput
  ::
  Generic CloneTemplateRepositoryInput _

derive instance newtypeCloneTemplateRepositoryInput
  ::
  Newtype CloneTemplateRepositoryInput _

instance toGraphQLArgumentValueCloneTemplateRepositoryInput
  :: ToGraphQLArgumentValue CloneTemplateRepositoryInput where
  toGraphQLArgumentValue (CloneTemplateRepositoryInput x) = toGraphQLArgumentValue
                                                            x

-- | original name - CloseIssueInput
newtype CloseIssueInput
  = CloseIssueInput { issueId :: Id, clientMutationId :: Optional String }

derive instance genericCloseIssueInput :: Generic CloseIssueInput _

derive instance newtypeCloseIssueInput :: Newtype CloseIssueInput _

instance toGraphQLArgumentValueCloseIssueInput
  :: ToGraphQLArgumentValue CloseIssueInput where
  toGraphQLArgumentValue (CloseIssueInput x) = toGraphQLArgumentValue x

-- | original name - ClosePullRequestInput
newtype ClosePullRequestInput
  = ClosePullRequestInput
    { pullRequestId :: Id, clientMutationId :: Optional String }

derive instance genericClosePullRequestInput :: Generic ClosePullRequestInput _

derive instance newtypeClosePullRequestInput :: Newtype ClosePullRequestInput _

instance toGraphQLArgumentValueClosePullRequestInput
  :: ToGraphQLArgumentValue ClosePullRequestInput where
  toGraphQLArgumentValue (ClosePullRequestInput x) = toGraphQLArgumentValue x

-- | original name - CommitAuthor
newtype CommitAuthor
  = CommitAuthor { id :: Optional Id, emails :: Optional (Array String) }

derive instance genericCommitAuthor :: Generic CommitAuthor _

derive instance newtypeCommitAuthor :: Newtype CommitAuthor _

instance toGraphQLArgumentValueCommitAuthor
  :: ToGraphQLArgumentValue CommitAuthor where
  toGraphQLArgumentValue (CommitAuthor x) = toGraphQLArgumentValue x

-- | original name - CommitContributionOrder
newtype CommitContributionOrder
  = CommitContributionOrder
    { field :: CommitContributionOrderField, direction :: OrderDirection }

derive instance genericCommitContributionOrder
  ::
  Generic CommitContributionOrder _

derive instance newtypeCommitContributionOrder
  ::
  Newtype CommitContributionOrder _

instance toGraphQLArgumentValueCommitContributionOrder
  :: ToGraphQLArgumentValue CommitContributionOrder where
  toGraphQLArgumentValue (CommitContributionOrder x) = toGraphQLArgumentValue x

-- | original name - CommitMessage
newtype CommitMessage
  = CommitMessage { headline :: String, body :: Optional String }

derive instance genericCommitMessage :: Generic CommitMessage _

derive instance newtypeCommitMessage :: Newtype CommitMessage _

instance toGraphQLArgumentValueCommitMessage
  :: ToGraphQLArgumentValue CommitMessage where
  toGraphQLArgumentValue (CommitMessage x) = toGraphQLArgumentValue x

-- | original name - CommittableBranch
newtype CommittableBranch
  = CommittableBranch
    { id :: Optional Id
    , repositoryNameWithOwner :: Optional String
    , branchName :: Optional String
    }

derive instance genericCommittableBranch :: Generic CommittableBranch _

derive instance newtypeCommittableBranch :: Newtype CommittableBranch _

instance toGraphQLArgumentValueCommittableBranch
  :: ToGraphQLArgumentValue CommittableBranch where
  toGraphQLArgumentValue (CommittableBranch x) = toGraphQLArgumentValue x

-- | original name - ContributionOrder
newtype ContributionOrder = ContributionOrder { direction :: OrderDirection }

derive instance genericContributionOrder :: Generic ContributionOrder _

derive instance newtypeContributionOrder :: Newtype ContributionOrder _

instance toGraphQLArgumentValueContributionOrder
  :: ToGraphQLArgumentValue ContributionOrder where
  toGraphQLArgumentValue (ContributionOrder x) = toGraphQLArgumentValue x

-- | original name - ConvertProjectCardNoteToIssueInput
newtype ConvertProjectCardNoteToIssueInput
  = ConvertProjectCardNoteToIssueInput
    { projectCardId :: Id
    , repositoryId :: Id
    , title :: Optional String
    , body :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericConvertProjectCardNoteToIssueInput
  ::
  Generic ConvertProjectCardNoteToIssueInput _

derive instance newtypeConvertProjectCardNoteToIssueInput
  ::
  Newtype ConvertProjectCardNoteToIssueInput _

instance toGraphQLArgumentValueConvertProjectCardNoteToIssueInput
  :: ToGraphQLArgumentValue ConvertProjectCardNoteToIssueInput where
  toGraphQLArgumentValue (ConvertProjectCardNoteToIssueInput x) = toGraphQLArgumentValue
                                                                  x

-- | original name - ConvertPullRequestToDraftInput
newtype ConvertPullRequestToDraftInput
  = ConvertPullRequestToDraftInput
    { pullRequestId :: Id, clientMutationId :: Optional String }

derive instance genericConvertPullRequestToDraftInput
  ::
  Generic ConvertPullRequestToDraftInput _

derive instance newtypeConvertPullRequestToDraftInput
  ::
  Newtype ConvertPullRequestToDraftInput _

instance toGraphQLArgumentValueConvertPullRequestToDraftInput
  :: ToGraphQLArgumentValue ConvertPullRequestToDraftInput where
  toGraphQLArgumentValue (ConvertPullRequestToDraftInput x) = toGraphQLArgumentValue
                                                              x

-- | original name - CreateBranchProtectionRuleInput
newtype CreateBranchProtectionRuleInput
  = CreateBranchProtectionRuleInput
    { repositoryId :: Id
    , pattern :: String
    , requiresApprovingReviews :: Optional Boolean
    , requiredApprovingReviewCount :: Optional Int
    , requiresCommitSignatures :: Optional Boolean
    , requiresLinearHistory :: Optional Boolean
    , allowsForcePushes :: Optional Boolean
    , allowsDeletions :: Optional Boolean
    , isAdminEnforced :: Optional Boolean
    , requiresStatusChecks :: Optional Boolean
    , requiresStrictStatusChecks :: Optional Boolean
    , requiresCodeOwnerReviews :: Optional Boolean
    , dismissesStaleReviews :: Optional Boolean
    , restrictsReviewDismissals :: Optional Boolean
    , reviewDismissalActorIds :: Optional (Array Id)
    , bypassPullRequestActorIds :: Optional (Array Id)
    , bypassForcePushActorIds :: Optional (Array Id)
    , restrictsPushes :: Optional Boolean
    , pushActorIds :: Optional (Array Id)
    , requiredStatusCheckContexts :: Optional (Array String)
    , requiredStatusChecks :: Optional (Array RequiredStatusCheckInput)
    , requiresConversationResolution :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericCreateBranchProtectionRuleInput
  ::
  Generic CreateBranchProtectionRuleInput _

derive instance newtypeCreateBranchProtectionRuleInput
  ::
  Newtype CreateBranchProtectionRuleInput _

instance toGraphQLArgumentValueCreateBranchProtectionRuleInput
  :: ToGraphQLArgumentValue CreateBranchProtectionRuleInput where
  toGraphQLArgumentValue (CreateBranchProtectionRuleInput x) = toGraphQLArgumentValue
                                                               x

-- | original name - CreateCheckRunInput
newtype CreateCheckRunInput
  = CreateCheckRunInput
    { repositoryId :: Id
    , name :: String
    , headSha :: GitObjectId
    , detailsUrl :: Optional Uri
    , externalId :: Optional String
    , status :: Optional RequestableCheckStatusState
    , startedAt :: Optional DateTime
    , conclusion :: Optional CheckConclusionState
    , completedAt :: Optional DateTime
    , output :: Optional CheckRunOutput
    , actions :: Optional (Array CheckRunAction)
    , clientMutationId :: Optional String
    }

derive instance genericCreateCheckRunInput :: Generic CreateCheckRunInput _

derive instance newtypeCreateCheckRunInput :: Newtype CreateCheckRunInput _

instance toGraphQLArgumentValueCreateCheckRunInput
  :: ToGraphQLArgumentValue CreateCheckRunInput where
  toGraphQLArgumentValue (CreateCheckRunInput x) = toGraphQLArgumentValue x

-- | original name - CreateCheckSuiteInput
newtype CreateCheckSuiteInput
  = CreateCheckSuiteInput
    { repositoryId :: Id
    , headSha :: GitObjectId
    , clientMutationId :: Optional String
    }

derive instance genericCreateCheckSuiteInput :: Generic CreateCheckSuiteInput _

derive instance newtypeCreateCheckSuiteInput :: Newtype CreateCheckSuiteInput _

instance toGraphQLArgumentValueCreateCheckSuiteInput
  :: ToGraphQLArgumentValue CreateCheckSuiteInput where
  toGraphQLArgumentValue (CreateCheckSuiteInput x) = toGraphQLArgumentValue x

-- | original name - CreateCommitOnBranchInput
newtype CreateCommitOnBranchInput
  = CreateCommitOnBranchInput
    { branch :: CommittableBranch
    , fileChanges :: Optional FileChanges
    , message :: CommitMessage
    , expectedHeadOid :: GitObjectId
    , clientMutationId :: Optional String
    }

derive instance genericCreateCommitOnBranchInput
  ::
  Generic CreateCommitOnBranchInput _

derive instance newtypeCreateCommitOnBranchInput
  ::
  Newtype CreateCommitOnBranchInput _

instance toGraphQLArgumentValueCreateCommitOnBranchInput
  :: ToGraphQLArgumentValue CreateCommitOnBranchInput where
  toGraphQLArgumentValue (CreateCommitOnBranchInput x) = toGraphQLArgumentValue
                                                         x

-- | original name - CreateDiscussionInput
newtype CreateDiscussionInput
  = CreateDiscussionInput
    { repositoryId :: Id
    , title :: String
    , body :: String
    , categoryId :: Id
    , clientMutationId :: Optional String
    }

derive instance genericCreateDiscussionInput :: Generic CreateDiscussionInput _

derive instance newtypeCreateDiscussionInput :: Newtype CreateDiscussionInput _

instance toGraphQLArgumentValueCreateDiscussionInput
  :: ToGraphQLArgumentValue CreateDiscussionInput where
  toGraphQLArgumentValue (CreateDiscussionInput x) = toGraphQLArgumentValue x

-- | original name - CreateEnterpriseOrganizationInput
newtype CreateEnterpriseOrganizationInput
  = CreateEnterpriseOrganizationInput
    { enterpriseId :: Id
    , login :: String
    , profileName :: String
    , billingEmail :: String
    , adminLogins :: Array String
    , clientMutationId :: Optional String
    }

derive instance genericCreateEnterpriseOrganizationInput
  ::
  Generic CreateEnterpriseOrganizationInput _

derive instance newtypeCreateEnterpriseOrganizationInput
  ::
  Newtype CreateEnterpriseOrganizationInput _

instance toGraphQLArgumentValueCreateEnterpriseOrganizationInput
  :: ToGraphQLArgumentValue CreateEnterpriseOrganizationInput where
  toGraphQLArgumentValue (CreateEnterpriseOrganizationInput x) = toGraphQLArgumentValue
                                                                 x

-- | original name - CreateEnvironmentInput
newtype CreateEnvironmentInput
  = CreateEnvironmentInput
    { repositoryId :: Id, name :: String, clientMutationId :: Optional String }

derive instance genericCreateEnvironmentInput
  ::
  Generic CreateEnvironmentInput _

derive instance newtypeCreateEnvironmentInput
  ::
  Newtype CreateEnvironmentInput _

instance toGraphQLArgumentValueCreateEnvironmentInput
  :: ToGraphQLArgumentValue CreateEnvironmentInput where
  toGraphQLArgumentValue (CreateEnvironmentInput x) = toGraphQLArgumentValue x

-- | original name - CreateIpAllowListEntryInput
newtype CreateIpAllowListEntryInput
  = CreateIpAllowListEntryInput
    { ownerId :: Id
    , allowListValue :: String
    , name :: Optional String
    , isActive :: Boolean
    , clientMutationId :: Optional String
    }

derive instance genericCreateIpAllowListEntryInput
  ::
  Generic CreateIpAllowListEntryInput _

derive instance newtypeCreateIpAllowListEntryInput
  ::
  Newtype CreateIpAllowListEntryInput _

instance toGraphQLArgumentValueCreateIpAllowListEntryInput
  :: ToGraphQLArgumentValue CreateIpAllowListEntryInput where
  toGraphQLArgumentValue (CreateIpAllowListEntryInput x) = toGraphQLArgumentValue
                                                           x

-- | original name - CreateIssueInput
newtype CreateIssueInput
  = CreateIssueInput
    { repositoryId :: Id
    , title :: String
    , body :: Optional String
    , assigneeIds :: Optional (Array Id)
    , milestoneId :: Optional Id
    , labelIds :: Optional (Array Id)
    , projectIds :: Optional (Array Id)
    , issueTemplate :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericCreateIssueInput :: Generic CreateIssueInput _

derive instance newtypeCreateIssueInput :: Newtype CreateIssueInput _

instance toGraphQLArgumentValueCreateIssueInput
  :: ToGraphQLArgumentValue CreateIssueInput where
  toGraphQLArgumentValue (CreateIssueInput x) = toGraphQLArgumentValue x

-- | original name - CreateMigrationSourceInput
newtype CreateMigrationSourceInput
  = CreateMigrationSourceInput
    { name :: String
    , url :: String
    , accessToken :: String
    , "type" :: MigrationSourceType
    , ownerId :: Id
    , githubPat :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericCreateMigrationSourceInput
  ::
  Generic CreateMigrationSourceInput _

derive instance newtypeCreateMigrationSourceInput
  ::
  Newtype CreateMigrationSourceInput _

instance toGraphQLArgumentValueCreateMigrationSourceInput
  :: ToGraphQLArgumentValue CreateMigrationSourceInput where
  toGraphQLArgumentValue (CreateMigrationSourceInput x) = toGraphQLArgumentValue
                                                          x

-- | original name - CreateProjectInput
newtype CreateProjectInput
  = CreateProjectInput
    { ownerId :: Id
    , name :: String
    , body :: Optional String
    , template :: Optional ProjectTemplate
    , repositoryIds :: Optional (Array Id)
    , clientMutationId :: Optional String
    }

derive instance genericCreateProjectInput :: Generic CreateProjectInput _

derive instance newtypeCreateProjectInput :: Newtype CreateProjectInput _

instance toGraphQLArgumentValueCreateProjectInput
  :: ToGraphQLArgumentValue CreateProjectInput where
  toGraphQLArgumentValue (CreateProjectInput x) = toGraphQLArgumentValue x

-- | original name - CreatePullRequestInput
newtype CreatePullRequestInput
  = CreatePullRequestInput
    { repositoryId :: Id
    , baseRefName :: String
    , headRefName :: String
    , title :: String
    , body :: Optional String
    , maintainerCanModify :: Optional Boolean
    , draft :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericCreatePullRequestInput
  ::
  Generic CreatePullRequestInput _

derive instance newtypeCreatePullRequestInput
  ::
  Newtype CreatePullRequestInput _

instance toGraphQLArgumentValueCreatePullRequestInput
  :: ToGraphQLArgumentValue CreatePullRequestInput where
  toGraphQLArgumentValue (CreatePullRequestInput x) = toGraphQLArgumentValue x

-- | original name - CreateRefInput
newtype CreateRefInput
  = CreateRefInput
    { repositoryId :: Id
    , name :: String
    , oid :: GitObjectId
    , clientMutationId :: Optional String
    }

derive instance genericCreateRefInput :: Generic CreateRefInput _

derive instance newtypeCreateRefInput :: Newtype CreateRefInput _

instance toGraphQLArgumentValueCreateRefInput
  :: ToGraphQLArgumentValue CreateRefInput where
  toGraphQLArgumentValue (CreateRefInput x) = toGraphQLArgumentValue x

-- | original name - CreateRepositoryInput
newtype CreateRepositoryInput
  = CreateRepositoryInput
    { name :: String
    , ownerId :: Optional Id
    , description :: Optional String
    , visibility :: RepositoryVisibility
    , template :: Optional Boolean
    , homepageUrl :: Optional Uri
    , hasWikiEnabled :: Optional Boolean
    , hasIssuesEnabled :: Optional Boolean
    , teamId :: Optional Id
    , clientMutationId :: Optional String
    }

derive instance genericCreateRepositoryInput :: Generic CreateRepositoryInput _

derive instance newtypeCreateRepositoryInput :: Newtype CreateRepositoryInput _

instance toGraphQLArgumentValueCreateRepositoryInput
  :: ToGraphQLArgumentValue CreateRepositoryInput where
  toGraphQLArgumentValue (CreateRepositoryInput x) = toGraphQLArgumentValue x

-- | original name - CreateSponsorshipInput
newtype CreateSponsorshipInput
  = CreateSponsorshipInput
    { sponsorId :: Optional Id
    , sponsorLogin :: Optional String
    , sponsorableId :: Optional Id
    , sponsorableLogin :: Optional String
    , tierId :: Optional Id
    , amount :: Optional Int
    , isRecurring :: Optional Boolean
    , receiveEmails :: Optional Boolean
    , privacyLevel :: Optional SponsorshipPrivacy
    , clientMutationId :: Optional String
    }

derive instance genericCreateSponsorshipInput
  ::
  Generic CreateSponsorshipInput _

derive instance newtypeCreateSponsorshipInput
  ::
  Newtype CreateSponsorshipInput _

instance toGraphQLArgumentValueCreateSponsorshipInput
  :: ToGraphQLArgumentValue CreateSponsorshipInput where
  toGraphQLArgumentValue (CreateSponsorshipInput x) = toGraphQLArgumentValue x

-- | original name - CreateTeamDiscussionCommentInput
newtype CreateTeamDiscussionCommentInput
  = CreateTeamDiscussionCommentInput
    { discussionId :: Id, body :: String, clientMutationId :: Optional String }

derive instance genericCreateTeamDiscussionCommentInput
  ::
  Generic CreateTeamDiscussionCommentInput _

derive instance newtypeCreateTeamDiscussionCommentInput
  ::
  Newtype CreateTeamDiscussionCommentInput _

instance toGraphQLArgumentValueCreateTeamDiscussionCommentInput
  :: ToGraphQLArgumentValue CreateTeamDiscussionCommentInput where
  toGraphQLArgumentValue (CreateTeamDiscussionCommentInput x) = toGraphQLArgumentValue
                                                                x

-- | original name - CreateTeamDiscussionInput
newtype CreateTeamDiscussionInput
  = CreateTeamDiscussionInput
    { teamId :: Id
    , title :: String
    , body :: String
    , private :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericCreateTeamDiscussionInput
  ::
  Generic CreateTeamDiscussionInput _

derive instance newtypeCreateTeamDiscussionInput
  ::
  Newtype CreateTeamDiscussionInput _

instance toGraphQLArgumentValueCreateTeamDiscussionInput
  :: ToGraphQLArgumentValue CreateTeamDiscussionInput where
  toGraphQLArgumentValue (CreateTeamDiscussionInput x) = toGraphQLArgumentValue
                                                         x

-- | original name - DeclineTopicSuggestionInput
newtype DeclineTopicSuggestionInput
  = DeclineTopicSuggestionInput
    { repositoryId :: Id
    , name :: String
    , reason :: TopicSuggestionDeclineReason
    , clientMutationId :: Optional String
    }

derive instance genericDeclineTopicSuggestionInput
  ::
  Generic DeclineTopicSuggestionInput _

derive instance newtypeDeclineTopicSuggestionInput
  ::
  Newtype DeclineTopicSuggestionInput _

instance toGraphQLArgumentValueDeclineTopicSuggestionInput
  :: ToGraphQLArgumentValue DeclineTopicSuggestionInput where
  toGraphQLArgumentValue (DeclineTopicSuggestionInput x) = toGraphQLArgumentValue
                                                           x

-- | original name - DeleteBranchProtectionRuleInput
newtype DeleteBranchProtectionRuleInput
  = DeleteBranchProtectionRuleInput
    { branchProtectionRuleId :: Id, clientMutationId :: Optional String }

derive instance genericDeleteBranchProtectionRuleInput
  ::
  Generic DeleteBranchProtectionRuleInput _

derive instance newtypeDeleteBranchProtectionRuleInput
  ::
  Newtype DeleteBranchProtectionRuleInput _

instance toGraphQLArgumentValueDeleteBranchProtectionRuleInput
  :: ToGraphQLArgumentValue DeleteBranchProtectionRuleInput where
  toGraphQLArgumentValue (DeleteBranchProtectionRuleInput x) = toGraphQLArgumentValue
                                                               x

-- | original name - DeleteDeploymentInput
newtype DeleteDeploymentInput
  = DeleteDeploymentInput { id :: Id, clientMutationId :: Optional String }

derive instance genericDeleteDeploymentInput :: Generic DeleteDeploymentInput _

derive instance newtypeDeleteDeploymentInput :: Newtype DeleteDeploymentInput _

instance toGraphQLArgumentValueDeleteDeploymentInput
  :: ToGraphQLArgumentValue DeleteDeploymentInput where
  toGraphQLArgumentValue (DeleteDeploymentInput x) = toGraphQLArgumentValue x

-- | original name - DeleteDiscussionCommentInput
newtype DeleteDiscussionCommentInput
  = DeleteDiscussionCommentInput
    { id :: Id, clientMutationId :: Optional String }

derive instance genericDeleteDiscussionCommentInput
  ::
  Generic DeleteDiscussionCommentInput _

derive instance newtypeDeleteDiscussionCommentInput
  ::
  Newtype DeleteDiscussionCommentInput _

instance toGraphQLArgumentValueDeleteDiscussionCommentInput
  :: ToGraphQLArgumentValue DeleteDiscussionCommentInput where
  toGraphQLArgumentValue (DeleteDiscussionCommentInput x) = toGraphQLArgumentValue
                                                            x

-- | original name - DeleteDiscussionInput
newtype DeleteDiscussionInput
  = DeleteDiscussionInput { id :: Id, clientMutationId :: Optional String }

derive instance genericDeleteDiscussionInput :: Generic DeleteDiscussionInput _

derive instance newtypeDeleteDiscussionInput :: Newtype DeleteDiscussionInput _

instance toGraphQLArgumentValueDeleteDiscussionInput
  :: ToGraphQLArgumentValue DeleteDiscussionInput where
  toGraphQLArgumentValue (DeleteDiscussionInput x) = toGraphQLArgumentValue x

-- | original name - DeleteEnvironmentInput
newtype DeleteEnvironmentInput
  = DeleteEnvironmentInput { id :: Id, clientMutationId :: Optional String }

derive instance genericDeleteEnvironmentInput
  ::
  Generic DeleteEnvironmentInput _

derive instance newtypeDeleteEnvironmentInput
  ::
  Newtype DeleteEnvironmentInput _

instance toGraphQLArgumentValueDeleteEnvironmentInput
  :: ToGraphQLArgumentValue DeleteEnvironmentInput where
  toGraphQLArgumentValue (DeleteEnvironmentInput x) = toGraphQLArgumentValue x

-- | original name - DeleteIpAllowListEntryInput
newtype DeleteIpAllowListEntryInput
  = DeleteIpAllowListEntryInput
    { ipAllowListEntryId :: Id, clientMutationId :: Optional String }

derive instance genericDeleteIpAllowListEntryInput
  ::
  Generic DeleteIpAllowListEntryInput _

derive instance newtypeDeleteIpAllowListEntryInput
  ::
  Newtype DeleteIpAllowListEntryInput _

instance toGraphQLArgumentValueDeleteIpAllowListEntryInput
  :: ToGraphQLArgumentValue DeleteIpAllowListEntryInput where
  toGraphQLArgumentValue (DeleteIpAllowListEntryInput x) = toGraphQLArgumentValue
                                                           x

-- | original name - DeleteIssueCommentInput
newtype DeleteIssueCommentInput
  = DeleteIssueCommentInput { id :: Id, clientMutationId :: Optional String }

derive instance genericDeleteIssueCommentInput
  ::
  Generic DeleteIssueCommentInput _

derive instance newtypeDeleteIssueCommentInput
  ::
  Newtype DeleteIssueCommentInput _

instance toGraphQLArgumentValueDeleteIssueCommentInput
  :: ToGraphQLArgumentValue DeleteIssueCommentInput where
  toGraphQLArgumentValue (DeleteIssueCommentInput x) = toGraphQLArgumentValue x

-- | original name - DeleteIssueInput
newtype DeleteIssueInput
  = DeleteIssueInput { issueId :: Id, clientMutationId :: Optional String }

derive instance genericDeleteIssueInput :: Generic DeleteIssueInput _

derive instance newtypeDeleteIssueInput :: Newtype DeleteIssueInput _

instance toGraphQLArgumentValueDeleteIssueInput
  :: ToGraphQLArgumentValue DeleteIssueInput where
  toGraphQLArgumentValue (DeleteIssueInput x) = toGraphQLArgumentValue x

-- | original name - DeleteProjectCardInput
newtype DeleteProjectCardInput
  = DeleteProjectCardInput { cardId :: Id, clientMutationId :: Optional String }

derive instance genericDeleteProjectCardInput
  ::
  Generic DeleteProjectCardInput _

derive instance newtypeDeleteProjectCardInput
  ::
  Newtype DeleteProjectCardInput _

instance toGraphQLArgumentValueDeleteProjectCardInput
  :: ToGraphQLArgumentValue DeleteProjectCardInput where
  toGraphQLArgumentValue (DeleteProjectCardInput x) = toGraphQLArgumentValue x

-- | original name - DeleteProjectColumnInput
newtype DeleteProjectColumnInput
  = DeleteProjectColumnInput
    { columnId :: Id, clientMutationId :: Optional String }

derive instance genericDeleteProjectColumnInput
  ::
  Generic DeleteProjectColumnInput _

derive instance newtypeDeleteProjectColumnInput
  ::
  Newtype DeleteProjectColumnInput _

instance toGraphQLArgumentValueDeleteProjectColumnInput
  :: ToGraphQLArgumentValue DeleteProjectColumnInput where
  toGraphQLArgumentValue (DeleteProjectColumnInput x) = toGraphQLArgumentValue x

-- | original name - DeleteProjectInput
newtype DeleteProjectInput
  = DeleteProjectInput { projectId :: Id, clientMutationId :: Optional String }

derive instance genericDeleteProjectInput :: Generic DeleteProjectInput _

derive instance newtypeDeleteProjectInput :: Newtype DeleteProjectInput _

instance toGraphQLArgumentValueDeleteProjectInput
  :: ToGraphQLArgumentValue DeleteProjectInput where
  toGraphQLArgumentValue (DeleteProjectInput x) = toGraphQLArgumentValue x

-- | original name - DeleteProjectNextItemInput
newtype DeleteProjectNextItemInput
  = DeleteProjectNextItemInput
    { projectId :: Id, itemId :: Id, clientMutationId :: Optional String }

derive instance genericDeleteProjectNextItemInput
  ::
  Generic DeleteProjectNextItemInput _

derive instance newtypeDeleteProjectNextItemInput
  ::
  Newtype DeleteProjectNextItemInput _

instance toGraphQLArgumentValueDeleteProjectNextItemInput
  :: ToGraphQLArgumentValue DeleteProjectNextItemInput where
  toGraphQLArgumentValue (DeleteProjectNextItemInput x) = toGraphQLArgumentValue
                                                          x

-- | original name - DeletePullRequestReviewCommentInput
newtype DeletePullRequestReviewCommentInput
  = DeletePullRequestReviewCommentInput
    { id :: Id, clientMutationId :: Optional String }

derive instance genericDeletePullRequestReviewCommentInput
  ::
  Generic DeletePullRequestReviewCommentInput _

derive instance newtypeDeletePullRequestReviewCommentInput
  ::
  Newtype DeletePullRequestReviewCommentInput _

instance toGraphQLArgumentValueDeletePullRequestReviewCommentInput
  :: ToGraphQLArgumentValue DeletePullRequestReviewCommentInput where
  toGraphQLArgumentValue (DeletePullRequestReviewCommentInput x) = toGraphQLArgumentValue
                                                                   x

-- | original name - DeletePullRequestReviewInput
newtype DeletePullRequestReviewInput
  = DeletePullRequestReviewInput
    { pullRequestReviewId :: Id, clientMutationId :: Optional String }

derive instance genericDeletePullRequestReviewInput
  ::
  Generic DeletePullRequestReviewInput _

derive instance newtypeDeletePullRequestReviewInput
  ::
  Newtype DeletePullRequestReviewInput _

instance toGraphQLArgumentValueDeletePullRequestReviewInput
  :: ToGraphQLArgumentValue DeletePullRequestReviewInput where
  toGraphQLArgumentValue (DeletePullRequestReviewInput x) = toGraphQLArgumentValue
                                                            x

-- | original name - DeleteRefInput
newtype DeleteRefInput
  = DeleteRefInput { refId :: Id, clientMutationId :: Optional String }

derive instance genericDeleteRefInput :: Generic DeleteRefInput _

derive instance newtypeDeleteRefInput :: Newtype DeleteRefInput _

instance toGraphQLArgumentValueDeleteRefInput
  :: ToGraphQLArgumentValue DeleteRefInput where
  toGraphQLArgumentValue (DeleteRefInput x) = toGraphQLArgumentValue x

-- | original name - DeleteTeamDiscussionCommentInput
newtype DeleteTeamDiscussionCommentInput
  = DeleteTeamDiscussionCommentInput
    { id :: Id, clientMutationId :: Optional String }

derive instance genericDeleteTeamDiscussionCommentInput
  ::
  Generic DeleteTeamDiscussionCommentInput _

derive instance newtypeDeleteTeamDiscussionCommentInput
  ::
  Newtype DeleteTeamDiscussionCommentInput _

instance toGraphQLArgumentValueDeleteTeamDiscussionCommentInput
  :: ToGraphQLArgumentValue DeleteTeamDiscussionCommentInput where
  toGraphQLArgumentValue (DeleteTeamDiscussionCommentInput x) = toGraphQLArgumentValue
                                                                x

-- | original name - DeleteTeamDiscussionInput
newtype DeleteTeamDiscussionInput
  = DeleteTeamDiscussionInput { id :: Id, clientMutationId :: Optional String }

derive instance genericDeleteTeamDiscussionInput
  ::
  Generic DeleteTeamDiscussionInput _

derive instance newtypeDeleteTeamDiscussionInput
  ::
  Newtype DeleteTeamDiscussionInput _

instance toGraphQLArgumentValueDeleteTeamDiscussionInput
  :: ToGraphQLArgumentValue DeleteTeamDiscussionInput where
  toGraphQLArgumentValue (DeleteTeamDiscussionInput x) = toGraphQLArgumentValue
                                                         x

-- | original name - DeleteVerifiableDomainInput
newtype DeleteVerifiableDomainInput
  = DeleteVerifiableDomainInput
    { id :: Id, clientMutationId :: Optional String }

derive instance genericDeleteVerifiableDomainInput
  ::
  Generic DeleteVerifiableDomainInput _

derive instance newtypeDeleteVerifiableDomainInput
  ::
  Newtype DeleteVerifiableDomainInput _

instance toGraphQLArgumentValueDeleteVerifiableDomainInput
  :: ToGraphQLArgumentValue DeleteVerifiableDomainInput where
  toGraphQLArgumentValue (DeleteVerifiableDomainInput x) = toGraphQLArgumentValue
                                                           x

-- | original name - DeploymentOrder
newtype DeploymentOrder
  = DeploymentOrder
    { field :: DeploymentOrderField, direction :: OrderDirection }

derive instance genericDeploymentOrder :: Generic DeploymentOrder _

derive instance newtypeDeploymentOrder :: Newtype DeploymentOrder _

instance toGraphQLArgumentValueDeploymentOrder
  :: ToGraphQLArgumentValue DeploymentOrder where
  toGraphQLArgumentValue (DeploymentOrder x) = toGraphQLArgumentValue x

-- | original name - DisablePullRequestAutoMergeInput
newtype DisablePullRequestAutoMergeInput
  = DisablePullRequestAutoMergeInput
    { pullRequestId :: Id, clientMutationId :: Optional String }

derive instance genericDisablePullRequestAutoMergeInput
  ::
  Generic DisablePullRequestAutoMergeInput _

derive instance newtypeDisablePullRequestAutoMergeInput
  ::
  Newtype DisablePullRequestAutoMergeInput _

instance toGraphQLArgumentValueDisablePullRequestAutoMergeInput
  :: ToGraphQLArgumentValue DisablePullRequestAutoMergeInput where
  toGraphQLArgumentValue (DisablePullRequestAutoMergeInput x) = toGraphQLArgumentValue
                                                                x

-- | original name - DiscussionOrder
newtype DiscussionOrder
  = DiscussionOrder
    { field :: DiscussionOrderField, direction :: OrderDirection }

derive instance genericDiscussionOrder :: Generic DiscussionOrder _

derive instance newtypeDiscussionOrder :: Newtype DiscussionOrder _

instance toGraphQLArgumentValueDiscussionOrder
  :: ToGraphQLArgumentValue DiscussionOrder where
  toGraphQLArgumentValue (DiscussionOrder x) = toGraphQLArgumentValue x

-- | original name - DismissPullRequestReviewInput
newtype DismissPullRequestReviewInput
  = DismissPullRequestReviewInput
    { pullRequestReviewId :: Id
    , message :: String
    , clientMutationId :: Optional String
    }

derive instance genericDismissPullRequestReviewInput
  ::
  Generic DismissPullRequestReviewInput _

derive instance newtypeDismissPullRequestReviewInput
  ::
  Newtype DismissPullRequestReviewInput _

instance toGraphQLArgumentValueDismissPullRequestReviewInput
  :: ToGraphQLArgumentValue DismissPullRequestReviewInput where
  toGraphQLArgumentValue (DismissPullRequestReviewInput x) = toGraphQLArgumentValue
                                                             x

-- | original name - DismissRepositoryVulnerabilityAlertInput
newtype DismissRepositoryVulnerabilityAlertInput
  = DismissRepositoryVulnerabilityAlertInput
    { repositoryVulnerabilityAlertId :: Id
    , dismissReason :: DismissReason
    , clientMutationId :: Optional String
    }

derive instance genericDismissRepositoryVulnerabilityAlertInput
  ::
  Generic DismissRepositoryVulnerabilityAlertInput _

derive instance newtypeDismissRepositoryVulnerabilityAlertInput
  ::
  Newtype DismissRepositoryVulnerabilityAlertInput _

instance toGraphQLArgumentValueDismissRepositoryVulnerabilityAlertInput
  :: ToGraphQLArgumentValue DismissRepositoryVulnerabilityAlertInput where
  toGraphQLArgumentValue (DismissRepositoryVulnerabilityAlertInput x) = toGraphQLArgumentValue
                                                                        x

-- | original name - DraftPullRequestReviewComment
newtype DraftPullRequestReviewComment
  = DraftPullRequestReviewComment
    { path :: String, position :: Int, body :: String }

derive instance genericDraftPullRequestReviewComment
  ::
  Generic DraftPullRequestReviewComment _

derive instance newtypeDraftPullRequestReviewComment
  ::
  Newtype DraftPullRequestReviewComment _

instance toGraphQLArgumentValueDraftPullRequestReviewComment
  :: ToGraphQLArgumentValue DraftPullRequestReviewComment where
  toGraphQLArgumentValue (DraftPullRequestReviewComment x) = toGraphQLArgumentValue
                                                             x

-- | original name - DraftPullRequestReviewThread
newtype DraftPullRequestReviewThread
  = DraftPullRequestReviewThread
    { path :: String
    , line :: Int
    , side :: Optional DiffSide
    , startLine :: Optional Int
    , startSide :: Optional DiffSide
    , body :: String
    }

derive instance genericDraftPullRequestReviewThread
  ::
  Generic DraftPullRequestReviewThread _

derive instance newtypeDraftPullRequestReviewThread
  ::
  Newtype DraftPullRequestReviewThread _

instance toGraphQLArgumentValueDraftPullRequestReviewThread
  :: ToGraphQLArgumentValue DraftPullRequestReviewThread where
  toGraphQLArgumentValue (DraftPullRequestReviewThread x) = toGraphQLArgumentValue
                                                            x

-- | original name - EnablePullRequestAutoMergeInput
newtype EnablePullRequestAutoMergeInput
  = EnablePullRequestAutoMergeInput
    { pullRequestId :: Id
    , commitHeadline :: Optional String
    , commitBody :: Optional String
    , mergeMethod :: Optional PullRequestMergeMethod
    , authorEmail :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericEnablePullRequestAutoMergeInput
  ::
  Generic EnablePullRequestAutoMergeInput _

derive instance newtypeEnablePullRequestAutoMergeInput
  ::
  Newtype EnablePullRequestAutoMergeInput _

instance toGraphQLArgumentValueEnablePullRequestAutoMergeInput
  :: ToGraphQLArgumentValue EnablePullRequestAutoMergeInput where
  toGraphQLArgumentValue (EnablePullRequestAutoMergeInput x) = toGraphQLArgumentValue
                                                               x

-- | original name - EnterpriseAdministratorInvitationOrder
newtype EnterpriseAdministratorInvitationOrder
  = EnterpriseAdministratorInvitationOrder
    { field :: EnterpriseAdministratorInvitationOrderField
    , direction :: OrderDirection
    }

derive instance genericEnterpriseAdministratorInvitationOrder
  ::
  Generic EnterpriseAdministratorInvitationOrder _

derive instance newtypeEnterpriseAdministratorInvitationOrder
  ::
  Newtype EnterpriseAdministratorInvitationOrder _

instance toGraphQLArgumentValueEnterpriseAdministratorInvitationOrder
  :: ToGraphQLArgumentValue EnterpriseAdministratorInvitationOrder where
  toGraphQLArgumentValue (EnterpriseAdministratorInvitationOrder x) = toGraphQLArgumentValue
                                                                      x

-- | original name - EnterpriseMemberOrder
newtype EnterpriseMemberOrder
  = EnterpriseMemberOrder
    { field :: EnterpriseMemberOrderField, direction :: OrderDirection }

derive instance genericEnterpriseMemberOrder :: Generic EnterpriseMemberOrder _

derive instance newtypeEnterpriseMemberOrder :: Newtype EnterpriseMemberOrder _

instance toGraphQLArgumentValueEnterpriseMemberOrder
  :: ToGraphQLArgumentValue EnterpriseMemberOrder where
  toGraphQLArgumentValue (EnterpriseMemberOrder x) = toGraphQLArgumentValue x

-- | original name - EnterpriseServerInstallationOrder
newtype EnterpriseServerInstallationOrder
  = EnterpriseServerInstallationOrder
    { field :: EnterpriseServerInstallationOrderField
    , direction :: OrderDirection
    }

derive instance genericEnterpriseServerInstallationOrder
  ::
  Generic EnterpriseServerInstallationOrder _

derive instance newtypeEnterpriseServerInstallationOrder
  ::
  Newtype EnterpriseServerInstallationOrder _

instance toGraphQLArgumentValueEnterpriseServerInstallationOrder
  :: ToGraphQLArgumentValue EnterpriseServerInstallationOrder where
  toGraphQLArgumentValue (EnterpriseServerInstallationOrder x) = toGraphQLArgumentValue
                                                                 x

-- | original name - EnterpriseServerUserAccountEmailOrder
newtype EnterpriseServerUserAccountEmailOrder
  = EnterpriseServerUserAccountEmailOrder
    { field :: EnterpriseServerUserAccountEmailOrderField
    , direction :: OrderDirection
    }

derive instance genericEnterpriseServerUserAccountEmailOrder
  ::
  Generic EnterpriseServerUserAccountEmailOrder _

derive instance newtypeEnterpriseServerUserAccountEmailOrder
  ::
  Newtype EnterpriseServerUserAccountEmailOrder _

instance toGraphQLArgumentValueEnterpriseServerUserAccountEmailOrder
  :: ToGraphQLArgumentValue EnterpriseServerUserAccountEmailOrder where
  toGraphQLArgumentValue (EnterpriseServerUserAccountEmailOrder x) = toGraphQLArgumentValue
                                                                     x

-- | original name - EnterpriseServerUserAccountOrder
newtype EnterpriseServerUserAccountOrder
  = EnterpriseServerUserAccountOrder
    { field :: EnterpriseServerUserAccountOrderField
    , direction :: OrderDirection
    }

derive instance genericEnterpriseServerUserAccountOrder
  ::
  Generic EnterpriseServerUserAccountOrder _

derive instance newtypeEnterpriseServerUserAccountOrder
  ::
  Newtype EnterpriseServerUserAccountOrder _

instance toGraphQLArgumentValueEnterpriseServerUserAccountOrder
  :: ToGraphQLArgumentValue EnterpriseServerUserAccountOrder where
  toGraphQLArgumentValue (EnterpriseServerUserAccountOrder x) = toGraphQLArgumentValue
                                                                x

-- | original name - EnterpriseServerUserAccountsUploadOrder
newtype EnterpriseServerUserAccountsUploadOrder
  = EnterpriseServerUserAccountsUploadOrder
    { field :: EnterpriseServerUserAccountsUploadOrderField
    , direction :: OrderDirection
    }

derive instance genericEnterpriseServerUserAccountsUploadOrder
  ::
  Generic EnterpriseServerUserAccountsUploadOrder _

derive instance newtypeEnterpriseServerUserAccountsUploadOrder
  ::
  Newtype EnterpriseServerUserAccountsUploadOrder _

instance toGraphQLArgumentValueEnterpriseServerUserAccountsUploadOrder
  :: ToGraphQLArgumentValue EnterpriseServerUserAccountsUploadOrder where
  toGraphQLArgumentValue (EnterpriseServerUserAccountsUploadOrder x) = toGraphQLArgumentValue
                                                                       x

-- | original name - FileAddition
newtype FileAddition = FileAddition { path :: String, contents :: Base64String }

derive instance genericFileAddition :: Generic FileAddition _

derive instance newtypeFileAddition :: Newtype FileAddition _

instance toGraphQLArgumentValueFileAddition
  :: ToGraphQLArgumentValue FileAddition where
  toGraphQLArgumentValue (FileAddition x) = toGraphQLArgumentValue x

-- | original name - FileChanges
newtype FileChanges
  = FileChanges
    { deletions :: Optional (Array FileDeletion)
    , additions :: Optional (Array FileAddition)
    }

derive instance genericFileChanges :: Generic FileChanges _

derive instance newtypeFileChanges :: Newtype FileChanges _

instance toGraphQLArgumentValueFileChanges
  :: ToGraphQLArgumentValue FileChanges where
  toGraphQLArgumentValue (FileChanges x) = toGraphQLArgumentValue x

-- | original name - FileDeletion
newtype FileDeletion = FileDeletion { path :: String }

derive instance genericFileDeletion :: Generic FileDeletion _

derive instance newtypeFileDeletion :: Newtype FileDeletion _

instance toGraphQLArgumentValueFileDeletion
  :: ToGraphQLArgumentValue FileDeletion where
  toGraphQLArgumentValue (FileDeletion x) = toGraphQLArgumentValue x

-- | original name - FollowUserInput
newtype FollowUserInput
  = FollowUserInput { userId :: Id, clientMutationId :: Optional String }

derive instance genericFollowUserInput :: Generic FollowUserInput _

derive instance newtypeFollowUserInput :: Newtype FollowUserInput _

instance toGraphQLArgumentValueFollowUserInput
  :: ToGraphQLArgumentValue FollowUserInput where
  toGraphQLArgumentValue (FollowUserInput x) = toGraphQLArgumentValue x

-- | original name - GistOrder
newtype GistOrder
  = GistOrder { field :: GistOrderField, direction :: OrderDirection }

derive instance genericGistOrder :: Generic GistOrder _

derive instance newtypeGistOrder :: Newtype GistOrder _

instance toGraphQLArgumentValueGistOrder
  :: ToGraphQLArgumentValue GistOrder where
  toGraphQLArgumentValue (GistOrder x) = toGraphQLArgumentValue x

-- | original name - GrantEnterpriseOrganizationsMigratorRoleInput
newtype GrantEnterpriseOrganizationsMigratorRoleInput
  = GrantEnterpriseOrganizationsMigratorRoleInput
    { enterpriseId :: Id, login :: String, clientMutationId :: Optional String }

derive instance genericGrantEnterpriseOrganizationsMigratorRoleInput
  ::
  Generic GrantEnterpriseOrganizationsMigratorRoleInput _

derive instance newtypeGrantEnterpriseOrganizationsMigratorRoleInput
  ::
  Newtype GrantEnterpriseOrganizationsMigratorRoleInput _

instance toGraphQLArgumentValueGrantEnterpriseOrganizationsMigratorRoleInput
  :: ToGraphQLArgumentValue GrantEnterpriseOrganizationsMigratorRoleInput where
  toGraphQLArgumentValue (GrantEnterpriseOrganizationsMigratorRoleInput x) = toGraphQLArgumentValue
                                                                             x

-- | original name - GrantMigratorRoleInput
newtype GrantMigratorRoleInput
  = GrantMigratorRoleInput
    { organizationId :: Id
    , actor :: String
    , actorType :: ActorType
    , clientMutationId :: Optional String
    }

derive instance genericGrantMigratorRoleInput
  ::
  Generic GrantMigratorRoleInput _

derive instance newtypeGrantMigratorRoleInput
  ::
  Newtype GrantMigratorRoleInput _

instance toGraphQLArgumentValueGrantMigratorRoleInput
  :: ToGraphQLArgumentValue GrantMigratorRoleInput where
  toGraphQLArgumentValue (GrantMigratorRoleInput x) = toGraphQLArgumentValue x

-- | original name - InviteEnterpriseAdminInput
newtype InviteEnterpriseAdminInput
  = InviteEnterpriseAdminInput
    { enterpriseId :: Id
    , invitee :: Optional String
    , email :: Optional String
    , role :: Optional EnterpriseAdministratorRole
    , clientMutationId :: Optional String
    }

derive instance genericInviteEnterpriseAdminInput
  ::
  Generic InviteEnterpriseAdminInput _

derive instance newtypeInviteEnterpriseAdminInput
  ::
  Newtype InviteEnterpriseAdminInput _

instance toGraphQLArgumentValueInviteEnterpriseAdminInput
  :: ToGraphQLArgumentValue InviteEnterpriseAdminInput where
  toGraphQLArgumentValue (InviteEnterpriseAdminInput x) = toGraphQLArgumentValue
                                                          x

-- | original name - IpAllowListEntryOrder
newtype IpAllowListEntryOrder
  = IpAllowListEntryOrder
    { field :: IpAllowListEntryOrderField, direction :: OrderDirection }

derive instance genericIpAllowListEntryOrder :: Generic IpAllowListEntryOrder _

derive instance newtypeIpAllowListEntryOrder :: Newtype IpAllowListEntryOrder _

instance toGraphQLArgumentValueIpAllowListEntryOrder
  :: ToGraphQLArgumentValue IpAllowListEntryOrder where
  toGraphQLArgumentValue (IpAllowListEntryOrder x) = toGraphQLArgumentValue x

-- | original name - IssueCommentOrder
newtype IssueCommentOrder
  = IssueCommentOrder
    { field :: IssueCommentOrderField, direction :: OrderDirection }

derive instance genericIssueCommentOrder :: Generic IssueCommentOrder _

derive instance newtypeIssueCommentOrder :: Newtype IssueCommentOrder _

instance toGraphQLArgumentValueIssueCommentOrder
  :: ToGraphQLArgumentValue IssueCommentOrder where
  toGraphQLArgumentValue (IssueCommentOrder x) = toGraphQLArgumentValue x

-- | original name - IssueFilters
newtype IssueFilters
  = IssueFilters
    { assignee :: Optional String
    , createdBy :: Optional String
    , labels :: Optional (Array String)
    , mentioned :: Optional String
    , milestone :: Optional String
    , since :: Optional DateTime
    , states :: Optional (Array IssueState)
    , viewerSubscribed :: Optional Boolean
    }

derive instance genericIssueFilters :: Generic IssueFilters _

derive instance newtypeIssueFilters :: Newtype IssueFilters _

instance toGraphQLArgumentValueIssueFilters
  :: ToGraphQLArgumentValue IssueFilters where
  toGraphQLArgumentValue (IssueFilters x) = toGraphQLArgumentValue x

-- | original name - IssueOrder
newtype IssueOrder
  = IssueOrder { field :: IssueOrderField, direction :: OrderDirection }

derive instance genericIssueOrder :: Generic IssueOrder _

derive instance newtypeIssueOrder :: Newtype IssueOrder _

instance toGraphQLArgumentValueIssueOrder
  :: ToGraphQLArgumentValue IssueOrder where
  toGraphQLArgumentValue (IssueOrder x) = toGraphQLArgumentValue x

-- | original name - LabelOrder
newtype LabelOrder
  = LabelOrder { field :: LabelOrderField, direction :: OrderDirection }

derive instance genericLabelOrder :: Generic LabelOrder _

derive instance newtypeLabelOrder :: Newtype LabelOrder _

instance toGraphQLArgumentValueLabelOrder
  :: ToGraphQLArgumentValue LabelOrder where
  toGraphQLArgumentValue (LabelOrder x) = toGraphQLArgumentValue x

-- | original name - LanguageOrder
newtype LanguageOrder
  = LanguageOrder { field :: LanguageOrderField, direction :: OrderDirection }

derive instance genericLanguageOrder :: Generic LanguageOrder _

derive instance newtypeLanguageOrder :: Newtype LanguageOrder _

instance toGraphQLArgumentValueLanguageOrder
  :: ToGraphQLArgumentValue LanguageOrder where
  toGraphQLArgumentValue (LanguageOrder x) = toGraphQLArgumentValue x

-- | original name - LinkRepositoryToProjectInput
newtype LinkRepositoryToProjectInput
  = LinkRepositoryToProjectInput
    { projectId :: Id, repositoryId :: Id, clientMutationId :: Optional String }

derive instance genericLinkRepositoryToProjectInput
  ::
  Generic LinkRepositoryToProjectInput _

derive instance newtypeLinkRepositoryToProjectInput
  ::
  Newtype LinkRepositoryToProjectInput _

instance toGraphQLArgumentValueLinkRepositoryToProjectInput
  :: ToGraphQLArgumentValue LinkRepositoryToProjectInput where
  toGraphQLArgumentValue (LinkRepositoryToProjectInput x) = toGraphQLArgumentValue
                                                            x

-- | original name - LockLockableInput
newtype LockLockableInput
  = LockLockableInput
    { lockableId :: Id
    , lockReason :: Optional LockReason
    , clientMutationId :: Optional String
    }

derive instance genericLockLockableInput :: Generic LockLockableInput _

derive instance newtypeLockLockableInput :: Newtype LockLockableInput _

instance toGraphQLArgumentValueLockLockableInput
  :: ToGraphQLArgumentValue LockLockableInput where
  toGraphQLArgumentValue (LockLockableInput x) = toGraphQLArgumentValue x

-- | original name - MarkDiscussionCommentAsAnswerInput
newtype MarkDiscussionCommentAsAnswerInput
  = MarkDiscussionCommentAsAnswerInput
    { id :: Id, clientMutationId :: Optional String }

derive instance genericMarkDiscussionCommentAsAnswerInput
  ::
  Generic MarkDiscussionCommentAsAnswerInput _

derive instance newtypeMarkDiscussionCommentAsAnswerInput
  ::
  Newtype MarkDiscussionCommentAsAnswerInput _

instance toGraphQLArgumentValueMarkDiscussionCommentAsAnswerInput
  :: ToGraphQLArgumentValue MarkDiscussionCommentAsAnswerInput where
  toGraphQLArgumentValue (MarkDiscussionCommentAsAnswerInput x) = toGraphQLArgumentValue
                                                                  x

-- | original name - MarkFileAsViewedInput
newtype MarkFileAsViewedInput
  = MarkFileAsViewedInput
    { pullRequestId :: Id, path :: String, clientMutationId :: Optional String }

derive instance genericMarkFileAsViewedInput :: Generic MarkFileAsViewedInput _

derive instance newtypeMarkFileAsViewedInput :: Newtype MarkFileAsViewedInput _

instance toGraphQLArgumentValueMarkFileAsViewedInput
  :: ToGraphQLArgumentValue MarkFileAsViewedInput where
  toGraphQLArgumentValue (MarkFileAsViewedInput x) = toGraphQLArgumentValue x

-- | original name - MarkPullRequestReadyForReviewInput
newtype MarkPullRequestReadyForReviewInput
  = MarkPullRequestReadyForReviewInput
    { pullRequestId :: Id, clientMutationId :: Optional String }

derive instance genericMarkPullRequestReadyForReviewInput
  ::
  Generic MarkPullRequestReadyForReviewInput _

derive instance newtypeMarkPullRequestReadyForReviewInput
  ::
  Newtype MarkPullRequestReadyForReviewInput _

instance toGraphQLArgumentValueMarkPullRequestReadyForReviewInput
  :: ToGraphQLArgumentValue MarkPullRequestReadyForReviewInput where
  toGraphQLArgumentValue (MarkPullRequestReadyForReviewInput x) = toGraphQLArgumentValue
                                                                  x

-- | original name - MergeBranchInput
newtype MergeBranchInput
  = MergeBranchInput
    { repositoryId :: Id
    , base :: String
    , head :: String
    , commitMessage :: Optional String
    , authorEmail :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericMergeBranchInput :: Generic MergeBranchInput _

derive instance newtypeMergeBranchInput :: Newtype MergeBranchInput _

instance toGraphQLArgumentValueMergeBranchInput
  :: ToGraphQLArgumentValue MergeBranchInput where
  toGraphQLArgumentValue (MergeBranchInput x) = toGraphQLArgumentValue x

-- | original name - MergePullRequestInput
newtype MergePullRequestInput
  = MergePullRequestInput
    { pullRequestId :: Id
    , commitHeadline :: Optional String
    , commitBody :: Optional String
    , expectedHeadOid :: Optional GitObjectId
    , mergeMethod :: Optional PullRequestMergeMethod
    , authorEmail :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericMergePullRequestInput :: Generic MergePullRequestInput _

derive instance newtypeMergePullRequestInput :: Newtype MergePullRequestInput _

instance toGraphQLArgumentValueMergePullRequestInput
  :: ToGraphQLArgumentValue MergePullRequestInput where
  toGraphQLArgumentValue (MergePullRequestInput x) = toGraphQLArgumentValue x

-- | original name - MilestoneOrder
newtype MilestoneOrder
  = MilestoneOrder { field :: MilestoneOrderField, direction :: OrderDirection }

derive instance genericMilestoneOrder :: Generic MilestoneOrder _

derive instance newtypeMilestoneOrder :: Newtype MilestoneOrder _

instance toGraphQLArgumentValueMilestoneOrder
  :: ToGraphQLArgumentValue MilestoneOrder where
  toGraphQLArgumentValue (MilestoneOrder x) = toGraphQLArgumentValue x

-- | original name - MinimizeCommentInput
newtype MinimizeCommentInput
  = MinimizeCommentInput
    { subjectId :: Id
    , classifier :: ReportedContentClassifiers
    , clientMutationId :: Optional String
    }

derive instance genericMinimizeCommentInput :: Generic MinimizeCommentInput _

derive instance newtypeMinimizeCommentInput :: Newtype MinimizeCommentInput _

instance toGraphQLArgumentValueMinimizeCommentInput
  :: ToGraphQLArgumentValue MinimizeCommentInput where
  toGraphQLArgumentValue (MinimizeCommentInput x) = toGraphQLArgumentValue x

-- | original name - MoveProjectCardInput
newtype MoveProjectCardInput
  = MoveProjectCardInput
    { cardId :: Id
    , columnId :: Id
    , afterCardId :: Optional Id
    , clientMutationId :: Optional String
    }

derive instance genericMoveProjectCardInput :: Generic MoveProjectCardInput _

derive instance newtypeMoveProjectCardInput :: Newtype MoveProjectCardInput _

instance toGraphQLArgumentValueMoveProjectCardInput
  :: ToGraphQLArgumentValue MoveProjectCardInput where
  toGraphQLArgumentValue (MoveProjectCardInput x) = toGraphQLArgumentValue x

-- | original name - MoveProjectColumnInput
newtype MoveProjectColumnInput
  = MoveProjectColumnInput
    { columnId :: Id
    , afterColumnId :: Optional Id
    , clientMutationId :: Optional String
    }

derive instance genericMoveProjectColumnInput
  ::
  Generic MoveProjectColumnInput _

derive instance newtypeMoveProjectColumnInput
  ::
  Newtype MoveProjectColumnInput _

instance toGraphQLArgumentValueMoveProjectColumnInput
  :: ToGraphQLArgumentValue MoveProjectColumnInput where
  toGraphQLArgumentValue (MoveProjectColumnInput x) = toGraphQLArgumentValue x

-- | original name - OrgEnterpriseOwnerOrder
newtype OrgEnterpriseOwnerOrder
  = OrgEnterpriseOwnerOrder
    { field :: OrgEnterpriseOwnerOrderField, direction :: OrderDirection }

derive instance genericOrgEnterpriseOwnerOrder
  ::
  Generic OrgEnterpriseOwnerOrder _

derive instance newtypeOrgEnterpriseOwnerOrder
  ::
  Newtype OrgEnterpriseOwnerOrder _

instance toGraphQLArgumentValueOrgEnterpriseOwnerOrder
  :: ToGraphQLArgumentValue OrgEnterpriseOwnerOrder where
  toGraphQLArgumentValue (OrgEnterpriseOwnerOrder x) = toGraphQLArgumentValue x

-- | original name - OrganizationOrder
newtype OrganizationOrder
  = OrganizationOrder
    { field :: OrganizationOrderField, direction :: OrderDirection }

derive instance genericOrganizationOrder :: Generic OrganizationOrder _

derive instance newtypeOrganizationOrder :: Newtype OrganizationOrder _

instance toGraphQLArgumentValueOrganizationOrder
  :: ToGraphQLArgumentValue OrganizationOrder where
  toGraphQLArgumentValue (OrganizationOrder x) = toGraphQLArgumentValue x

-- | original name - PackageFileOrder
newtype PackageFileOrder
  = PackageFileOrder
    { field :: Optional PackageFileOrderField
    , direction :: Optional OrderDirection
    }

derive instance genericPackageFileOrder :: Generic PackageFileOrder _

derive instance newtypePackageFileOrder :: Newtype PackageFileOrder _

instance toGraphQLArgumentValuePackageFileOrder
  :: ToGraphQLArgumentValue PackageFileOrder where
  toGraphQLArgumentValue (PackageFileOrder x) = toGraphQLArgumentValue x

-- | original name - PackageOrder
newtype PackageOrder
  = PackageOrder
    { field :: Optional PackageOrderField
    , direction :: Optional OrderDirection
    }

derive instance genericPackageOrder :: Generic PackageOrder _

derive instance newtypePackageOrder :: Newtype PackageOrder _

instance toGraphQLArgumentValuePackageOrder
  :: ToGraphQLArgumentValue PackageOrder where
  toGraphQLArgumentValue (PackageOrder x) = toGraphQLArgumentValue x

-- | original name - PackageVersionOrder
newtype PackageVersionOrder
  = PackageVersionOrder
    { field :: Optional PackageVersionOrderField
    , direction :: Optional OrderDirection
    }

derive instance genericPackageVersionOrder :: Generic PackageVersionOrder _

derive instance newtypePackageVersionOrder :: Newtype PackageVersionOrder _

instance toGraphQLArgumentValuePackageVersionOrder
  :: ToGraphQLArgumentValue PackageVersionOrder where
  toGraphQLArgumentValue (PackageVersionOrder x) = toGraphQLArgumentValue x

-- | original name - PinIssueInput
newtype PinIssueInput
  = PinIssueInput { issueId :: Id, clientMutationId :: Optional String }

derive instance genericPinIssueInput :: Generic PinIssueInput _

derive instance newtypePinIssueInput :: Newtype PinIssueInput _

instance toGraphQLArgumentValuePinIssueInput
  :: ToGraphQLArgumentValue PinIssueInput where
  toGraphQLArgumentValue (PinIssueInput x) = toGraphQLArgumentValue x

-- | original name - ProjectOrder
newtype ProjectOrder
  = ProjectOrder { field :: ProjectOrderField, direction :: OrderDirection }

derive instance genericProjectOrder :: Generic ProjectOrder _

derive instance newtypeProjectOrder :: Newtype ProjectOrder _

instance toGraphQLArgumentValueProjectOrder
  :: ToGraphQLArgumentValue ProjectOrder where
  toGraphQLArgumentValue (ProjectOrder x) = toGraphQLArgumentValue x

-- | original name - PullRequestOrder
newtype PullRequestOrder
  = PullRequestOrder
    { field :: PullRequestOrderField, direction :: OrderDirection }

derive instance genericPullRequestOrder :: Generic PullRequestOrder _

derive instance newtypePullRequestOrder :: Newtype PullRequestOrder _

instance toGraphQLArgumentValuePullRequestOrder
  :: ToGraphQLArgumentValue PullRequestOrder where
  toGraphQLArgumentValue (PullRequestOrder x) = toGraphQLArgumentValue x

-- | original name - ReactionOrder
newtype ReactionOrder
  = ReactionOrder { field :: ReactionOrderField, direction :: OrderDirection }

derive instance genericReactionOrder :: Generic ReactionOrder _

derive instance newtypeReactionOrder :: Newtype ReactionOrder _

instance toGraphQLArgumentValueReactionOrder
  :: ToGraphQLArgumentValue ReactionOrder where
  toGraphQLArgumentValue (ReactionOrder x) = toGraphQLArgumentValue x

-- | original name - RefOrder
newtype RefOrder
  = RefOrder { field :: RefOrderField, direction :: OrderDirection }

derive instance genericRefOrder :: Generic RefOrder _

derive instance newtypeRefOrder :: Newtype RefOrder _

instance toGraphQLArgumentValueRefOrder :: ToGraphQLArgumentValue RefOrder where
  toGraphQLArgumentValue (RefOrder x) = toGraphQLArgumentValue x

-- | original name - RegenerateEnterpriseIdentityProviderRecoveryCodesInput
newtype RegenerateEnterpriseIdentityProviderRecoveryCodesInput
  = RegenerateEnterpriseIdentityProviderRecoveryCodesInput
    { enterpriseId :: Id, clientMutationId :: Optional String }

derive instance genericRegenerateEnterpriseIdentityProviderRecoveryCodesInput
  ::
  Generic RegenerateEnterpriseIdentityProviderRecoveryCodesInput _

derive instance newtypeRegenerateEnterpriseIdentityProviderRecoveryCodesInput
  ::
  Newtype RegenerateEnterpriseIdentityProviderRecoveryCodesInput _

instance toGraphQLArgumentValueRegenerateEnterpriseIdentityProviderRecoveryCodesInput
  :: ToGraphQLArgumentValue
     RegenerateEnterpriseIdentityProviderRecoveryCodesInput where
  toGraphQLArgumentValue (RegenerateEnterpriseIdentityProviderRecoveryCodesInput x) = toGraphQLArgumentValue
                                                                                      x

-- | original name - RegenerateVerifiableDomainTokenInput
newtype RegenerateVerifiableDomainTokenInput
  = RegenerateVerifiableDomainTokenInput
    { id :: Id, clientMutationId :: Optional String }

derive instance genericRegenerateVerifiableDomainTokenInput
  ::
  Generic RegenerateVerifiableDomainTokenInput _

derive instance newtypeRegenerateVerifiableDomainTokenInput
  ::
  Newtype RegenerateVerifiableDomainTokenInput _

instance toGraphQLArgumentValueRegenerateVerifiableDomainTokenInput
  :: ToGraphQLArgumentValue RegenerateVerifiableDomainTokenInput where
  toGraphQLArgumentValue (RegenerateVerifiableDomainTokenInput x) = toGraphQLArgumentValue
                                                                    x

-- | original name - RejectDeploymentsInput
newtype RejectDeploymentsInput
  = RejectDeploymentsInput
    { workflowRunId :: Id
    , environmentIds :: Array Id
    , comment :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericRejectDeploymentsInput
  ::
  Generic RejectDeploymentsInput _

derive instance newtypeRejectDeploymentsInput
  ::
  Newtype RejectDeploymentsInput _

instance toGraphQLArgumentValueRejectDeploymentsInput
  :: ToGraphQLArgumentValue RejectDeploymentsInput where
  toGraphQLArgumentValue (RejectDeploymentsInput x) = toGraphQLArgumentValue x

-- | original name - ReleaseOrder
newtype ReleaseOrder
  = ReleaseOrder { field :: ReleaseOrderField, direction :: OrderDirection }

derive instance genericReleaseOrder :: Generic ReleaseOrder _

derive instance newtypeReleaseOrder :: Newtype ReleaseOrder _

instance toGraphQLArgumentValueReleaseOrder
  :: ToGraphQLArgumentValue ReleaseOrder where
  toGraphQLArgumentValue (ReleaseOrder x) = toGraphQLArgumentValue x

-- | original name - RemoveAssigneesFromAssignableInput
newtype RemoveAssigneesFromAssignableInput
  = RemoveAssigneesFromAssignableInput
    { assignableId :: Id
    , assigneeIds :: Array Id
    , clientMutationId :: Optional String
    }

derive instance genericRemoveAssigneesFromAssignableInput
  ::
  Generic RemoveAssigneesFromAssignableInput _

derive instance newtypeRemoveAssigneesFromAssignableInput
  ::
  Newtype RemoveAssigneesFromAssignableInput _

instance toGraphQLArgumentValueRemoveAssigneesFromAssignableInput
  :: ToGraphQLArgumentValue RemoveAssigneesFromAssignableInput where
  toGraphQLArgumentValue (RemoveAssigneesFromAssignableInput x) = toGraphQLArgumentValue
                                                                  x

-- | original name - RemoveEnterpriseAdminInput
newtype RemoveEnterpriseAdminInput
  = RemoveEnterpriseAdminInput
    { enterpriseId :: Id, login :: String, clientMutationId :: Optional String }

derive instance genericRemoveEnterpriseAdminInput
  ::
  Generic RemoveEnterpriseAdminInput _

derive instance newtypeRemoveEnterpriseAdminInput
  ::
  Newtype RemoveEnterpriseAdminInput _

instance toGraphQLArgumentValueRemoveEnterpriseAdminInput
  :: ToGraphQLArgumentValue RemoveEnterpriseAdminInput where
  toGraphQLArgumentValue (RemoveEnterpriseAdminInput x) = toGraphQLArgumentValue
                                                          x

-- | original name - RemoveEnterpriseIdentityProviderInput
newtype RemoveEnterpriseIdentityProviderInput
  = RemoveEnterpriseIdentityProviderInput
    { enterpriseId :: Id, clientMutationId :: Optional String }

derive instance genericRemoveEnterpriseIdentityProviderInput
  ::
  Generic RemoveEnterpriseIdentityProviderInput _

derive instance newtypeRemoveEnterpriseIdentityProviderInput
  ::
  Newtype RemoveEnterpriseIdentityProviderInput _

instance toGraphQLArgumentValueRemoveEnterpriseIdentityProviderInput
  :: ToGraphQLArgumentValue RemoveEnterpriseIdentityProviderInput where
  toGraphQLArgumentValue (RemoveEnterpriseIdentityProviderInput x) = toGraphQLArgumentValue
                                                                     x

-- | original name - RemoveEnterpriseOrganizationInput
newtype RemoveEnterpriseOrganizationInput
  = RemoveEnterpriseOrganizationInput
    { enterpriseId :: Id
    , organizationId :: Id
    , clientMutationId :: Optional String
    }

derive instance genericRemoveEnterpriseOrganizationInput
  ::
  Generic RemoveEnterpriseOrganizationInput _

derive instance newtypeRemoveEnterpriseOrganizationInput
  ::
  Newtype RemoveEnterpriseOrganizationInput _

instance toGraphQLArgumentValueRemoveEnterpriseOrganizationInput
  :: ToGraphQLArgumentValue RemoveEnterpriseOrganizationInput where
  toGraphQLArgumentValue (RemoveEnterpriseOrganizationInput x) = toGraphQLArgumentValue
                                                                 x

-- | original name - RemoveEnterpriseSupportEntitlementInput
newtype RemoveEnterpriseSupportEntitlementInput
  = RemoveEnterpriseSupportEntitlementInput
    { enterpriseId :: Id, login :: String, clientMutationId :: Optional String }

derive instance genericRemoveEnterpriseSupportEntitlementInput
  ::
  Generic RemoveEnterpriseSupportEntitlementInput _

derive instance newtypeRemoveEnterpriseSupportEntitlementInput
  ::
  Newtype RemoveEnterpriseSupportEntitlementInput _

instance toGraphQLArgumentValueRemoveEnterpriseSupportEntitlementInput
  :: ToGraphQLArgumentValue RemoveEnterpriseSupportEntitlementInput where
  toGraphQLArgumentValue (RemoveEnterpriseSupportEntitlementInput x) = toGraphQLArgumentValue
                                                                       x

-- | original name - RemoveLabelsFromLabelableInput
newtype RemoveLabelsFromLabelableInput
  = RemoveLabelsFromLabelableInput
    { labelableId :: Id
    , labelIds :: Array Id
    , clientMutationId :: Optional String
    }

derive instance genericRemoveLabelsFromLabelableInput
  ::
  Generic RemoveLabelsFromLabelableInput _

derive instance newtypeRemoveLabelsFromLabelableInput
  ::
  Newtype RemoveLabelsFromLabelableInput _

instance toGraphQLArgumentValueRemoveLabelsFromLabelableInput
  :: ToGraphQLArgumentValue RemoveLabelsFromLabelableInput where
  toGraphQLArgumentValue (RemoveLabelsFromLabelableInput x) = toGraphQLArgumentValue
                                                              x

-- | original name - RemoveOutsideCollaboratorInput
newtype RemoveOutsideCollaboratorInput
  = RemoveOutsideCollaboratorInput
    { userId :: Id, organizationId :: Id, clientMutationId :: Optional String }

derive instance genericRemoveOutsideCollaboratorInput
  ::
  Generic RemoveOutsideCollaboratorInput _

derive instance newtypeRemoveOutsideCollaboratorInput
  ::
  Newtype RemoveOutsideCollaboratorInput _

instance toGraphQLArgumentValueRemoveOutsideCollaboratorInput
  :: ToGraphQLArgumentValue RemoveOutsideCollaboratorInput where
  toGraphQLArgumentValue (RemoveOutsideCollaboratorInput x) = toGraphQLArgumentValue
                                                              x

-- | original name - RemoveReactionInput
newtype RemoveReactionInput
  = RemoveReactionInput
    { subjectId :: Id
    , content :: ReactionContent
    , clientMutationId :: Optional String
    }

derive instance genericRemoveReactionInput :: Generic RemoveReactionInput _

derive instance newtypeRemoveReactionInput :: Newtype RemoveReactionInput _

instance toGraphQLArgumentValueRemoveReactionInput
  :: ToGraphQLArgumentValue RemoveReactionInput where
  toGraphQLArgumentValue (RemoveReactionInput x) = toGraphQLArgumentValue x

-- | original name - RemoveStarInput
newtype RemoveStarInput
  = RemoveStarInput { starrableId :: Id, clientMutationId :: Optional String }

derive instance genericRemoveStarInput :: Generic RemoveStarInput _

derive instance newtypeRemoveStarInput :: Newtype RemoveStarInput _

instance toGraphQLArgumentValueRemoveStarInput
  :: ToGraphQLArgumentValue RemoveStarInput where
  toGraphQLArgumentValue (RemoveStarInput x) = toGraphQLArgumentValue x

-- | original name - RemoveUpvoteInput
newtype RemoveUpvoteInput
  = RemoveUpvoteInput { subjectId :: Id, clientMutationId :: Optional String }

derive instance genericRemoveUpvoteInput :: Generic RemoveUpvoteInput _

derive instance newtypeRemoveUpvoteInput :: Newtype RemoveUpvoteInput _

instance toGraphQLArgumentValueRemoveUpvoteInput
  :: ToGraphQLArgumentValue RemoveUpvoteInput where
  toGraphQLArgumentValue (RemoveUpvoteInput x) = toGraphQLArgumentValue x

-- | original name - ReopenIssueInput
newtype ReopenIssueInput
  = ReopenIssueInput { issueId :: Id, clientMutationId :: Optional String }

derive instance genericReopenIssueInput :: Generic ReopenIssueInput _

derive instance newtypeReopenIssueInput :: Newtype ReopenIssueInput _

instance toGraphQLArgumentValueReopenIssueInput
  :: ToGraphQLArgumentValue ReopenIssueInput where
  toGraphQLArgumentValue (ReopenIssueInput x) = toGraphQLArgumentValue x

-- | original name - ReopenPullRequestInput
newtype ReopenPullRequestInput
  = ReopenPullRequestInput
    { pullRequestId :: Id, clientMutationId :: Optional String }

derive instance genericReopenPullRequestInput
  ::
  Generic ReopenPullRequestInput _

derive instance newtypeReopenPullRequestInput
  ::
  Newtype ReopenPullRequestInput _

instance toGraphQLArgumentValueReopenPullRequestInput
  :: ToGraphQLArgumentValue ReopenPullRequestInput where
  toGraphQLArgumentValue (ReopenPullRequestInput x) = toGraphQLArgumentValue x

-- | original name - RepositoryInvitationOrder
newtype RepositoryInvitationOrder
  = RepositoryInvitationOrder
    { field :: RepositoryInvitationOrderField, direction :: OrderDirection }

derive instance genericRepositoryInvitationOrder
  ::
  Generic RepositoryInvitationOrder _

derive instance newtypeRepositoryInvitationOrder
  ::
  Newtype RepositoryInvitationOrder _

instance toGraphQLArgumentValueRepositoryInvitationOrder
  :: ToGraphQLArgumentValue RepositoryInvitationOrder where
  toGraphQLArgumentValue (RepositoryInvitationOrder x) = toGraphQLArgumentValue
                                                         x

-- | original name - RepositoryMigrationOrder
newtype RepositoryMigrationOrder
  = RepositoryMigrationOrder
    { field :: RepositoryMigrationOrderField
    , direction :: RepositoryMigrationOrderDirection
    }

derive instance genericRepositoryMigrationOrder
  ::
  Generic RepositoryMigrationOrder _

derive instance newtypeRepositoryMigrationOrder
  ::
  Newtype RepositoryMigrationOrder _

instance toGraphQLArgumentValueRepositoryMigrationOrder
  :: ToGraphQLArgumentValue RepositoryMigrationOrder where
  toGraphQLArgumentValue (RepositoryMigrationOrder x) = toGraphQLArgumentValue x

-- | original name - RepositoryOrder
newtype RepositoryOrder
  = RepositoryOrder
    { field :: RepositoryOrderField, direction :: OrderDirection }

derive instance genericRepositoryOrder :: Generic RepositoryOrder _

derive instance newtypeRepositoryOrder :: Newtype RepositoryOrder _

instance toGraphQLArgumentValueRepositoryOrder
  :: ToGraphQLArgumentValue RepositoryOrder where
  toGraphQLArgumentValue (RepositoryOrder x) = toGraphQLArgumentValue x

-- | original name - RequestReviewsInput
newtype RequestReviewsInput
  = RequestReviewsInput
    { pullRequestId :: Id
    , userIds :: Optional (Array Id)
    , teamIds :: Optional (Array Id)
    , union :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericRequestReviewsInput :: Generic RequestReviewsInput _

derive instance newtypeRequestReviewsInput :: Newtype RequestReviewsInput _

instance toGraphQLArgumentValueRequestReviewsInput
  :: ToGraphQLArgumentValue RequestReviewsInput where
  toGraphQLArgumentValue (RequestReviewsInput x) = toGraphQLArgumentValue x

-- | original name - RequiredStatusCheckInput
newtype RequiredStatusCheckInput
  = RequiredStatusCheckInput { context :: String, appId :: Optional Id }

derive instance genericRequiredStatusCheckInput
  ::
  Generic RequiredStatusCheckInput _

derive instance newtypeRequiredStatusCheckInput
  ::
  Newtype RequiredStatusCheckInput _

instance toGraphQLArgumentValueRequiredStatusCheckInput
  :: ToGraphQLArgumentValue RequiredStatusCheckInput where
  toGraphQLArgumentValue (RequiredStatusCheckInput x) = toGraphQLArgumentValue x

-- | original name - RerequestCheckSuiteInput
newtype RerequestCheckSuiteInput
  = RerequestCheckSuiteInput
    { repositoryId :: Id
    , checkSuiteId :: Id
    , clientMutationId :: Optional String
    }

derive instance genericRerequestCheckSuiteInput
  ::
  Generic RerequestCheckSuiteInput _

derive instance newtypeRerequestCheckSuiteInput
  ::
  Newtype RerequestCheckSuiteInput _

instance toGraphQLArgumentValueRerequestCheckSuiteInput
  :: ToGraphQLArgumentValue RerequestCheckSuiteInput where
  toGraphQLArgumentValue (RerequestCheckSuiteInput x) = toGraphQLArgumentValue x

-- | original name - ResolveReviewThreadInput
newtype ResolveReviewThreadInput
  = ResolveReviewThreadInput
    { threadId :: Id, clientMutationId :: Optional String }

derive instance genericResolveReviewThreadInput
  ::
  Generic ResolveReviewThreadInput _

derive instance newtypeResolveReviewThreadInput
  ::
  Newtype ResolveReviewThreadInput _

instance toGraphQLArgumentValueResolveReviewThreadInput
  :: ToGraphQLArgumentValue ResolveReviewThreadInput where
  toGraphQLArgumentValue (ResolveReviewThreadInput x) = toGraphQLArgumentValue x

-- | original name - RevokeEnterpriseOrganizationsMigratorRoleInput
newtype RevokeEnterpriseOrganizationsMigratorRoleInput
  = RevokeEnterpriseOrganizationsMigratorRoleInput
    { enterpriseId :: Id, login :: String, clientMutationId :: Optional String }

derive instance genericRevokeEnterpriseOrganizationsMigratorRoleInput
  ::
  Generic RevokeEnterpriseOrganizationsMigratorRoleInput _

derive instance newtypeRevokeEnterpriseOrganizationsMigratorRoleInput
  ::
  Newtype RevokeEnterpriseOrganizationsMigratorRoleInput _

instance toGraphQLArgumentValueRevokeEnterpriseOrganizationsMigratorRoleInput
  :: ToGraphQLArgumentValue RevokeEnterpriseOrganizationsMigratorRoleInput where
  toGraphQLArgumentValue (RevokeEnterpriseOrganizationsMigratorRoleInput x) = toGraphQLArgumentValue
                                                                              x

-- | original name - RevokeMigratorRoleInput
newtype RevokeMigratorRoleInput
  = RevokeMigratorRoleInput
    { organizationId :: Id
    , actor :: String
    , actorType :: ActorType
    , clientMutationId :: Optional String
    }

derive instance genericRevokeMigratorRoleInput
  ::
  Generic RevokeMigratorRoleInput _

derive instance newtypeRevokeMigratorRoleInput
  ::
  Newtype RevokeMigratorRoleInput _

instance toGraphQLArgumentValueRevokeMigratorRoleInput
  :: ToGraphQLArgumentValue RevokeMigratorRoleInput where
  toGraphQLArgumentValue (RevokeMigratorRoleInput x) = toGraphQLArgumentValue x

-- | original name - SavedReplyOrder
newtype SavedReplyOrder
  = SavedReplyOrder
    { field :: SavedReplyOrderField, direction :: OrderDirection }

derive instance genericSavedReplyOrder :: Generic SavedReplyOrder _

derive instance newtypeSavedReplyOrder :: Newtype SavedReplyOrder _

instance toGraphQLArgumentValueSavedReplyOrder
  :: ToGraphQLArgumentValue SavedReplyOrder where
  toGraphQLArgumentValue (SavedReplyOrder x) = toGraphQLArgumentValue x

-- | original name - SecurityAdvisoryIdentifierFilter
newtype SecurityAdvisoryIdentifierFilter
  = SecurityAdvisoryIdentifierFilter
    { "type" :: SecurityAdvisoryIdentifierType, value :: String }

derive instance genericSecurityAdvisoryIdentifierFilter
  ::
  Generic SecurityAdvisoryIdentifierFilter _

derive instance newtypeSecurityAdvisoryIdentifierFilter
  ::
  Newtype SecurityAdvisoryIdentifierFilter _

instance toGraphQLArgumentValueSecurityAdvisoryIdentifierFilter
  :: ToGraphQLArgumentValue SecurityAdvisoryIdentifierFilter where
  toGraphQLArgumentValue (SecurityAdvisoryIdentifierFilter x) = toGraphQLArgumentValue
                                                                x

-- | original name - SecurityAdvisoryOrder
newtype SecurityAdvisoryOrder
  = SecurityAdvisoryOrder
    { field :: SecurityAdvisoryOrderField, direction :: OrderDirection }

derive instance genericSecurityAdvisoryOrder :: Generic SecurityAdvisoryOrder _

derive instance newtypeSecurityAdvisoryOrder :: Newtype SecurityAdvisoryOrder _

instance toGraphQLArgumentValueSecurityAdvisoryOrder
  :: ToGraphQLArgumentValue SecurityAdvisoryOrder where
  toGraphQLArgumentValue (SecurityAdvisoryOrder x) = toGraphQLArgumentValue x

-- | original name - SecurityVulnerabilityOrder
newtype SecurityVulnerabilityOrder
  = SecurityVulnerabilityOrder
    { field :: SecurityVulnerabilityOrderField, direction :: OrderDirection }

derive instance genericSecurityVulnerabilityOrder
  ::
  Generic SecurityVulnerabilityOrder _

derive instance newtypeSecurityVulnerabilityOrder
  ::
  Newtype SecurityVulnerabilityOrder _

instance toGraphQLArgumentValueSecurityVulnerabilityOrder
  :: ToGraphQLArgumentValue SecurityVulnerabilityOrder where
  toGraphQLArgumentValue (SecurityVulnerabilityOrder x) = toGraphQLArgumentValue
                                                          x

-- | original name - SetEnterpriseIdentityProviderInput
newtype SetEnterpriseIdentityProviderInput
  = SetEnterpriseIdentityProviderInput
    { enterpriseId :: Id
    , ssoUrl :: Uri
    , issuer :: Optional String
    , idpCertificate :: String
    , signatureMethod :: SamlSignatureAlgorithm
    , digestMethod :: SamlDigestAlgorithm
    , clientMutationId :: Optional String
    }

derive instance genericSetEnterpriseIdentityProviderInput
  ::
  Generic SetEnterpriseIdentityProviderInput _

derive instance newtypeSetEnterpriseIdentityProviderInput
  ::
  Newtype SetEnterpriseIdentityProviderInput _

instance toGraphQLArgumentValueSetEnterpriseIdentityProviderInput
  :: ToGraphQLArgumentValue SetEnterpriseIdentityProviderInput where
  toGraphQLArgumentValue (SetEnterpriseIdentityProviderInput x) = toGraphQLArgumentValue
                                                                  x

-- | original name - SetOrganizationInteractionLimitInput
newtype SetOrganizationInteractionLimitInput
  = SetOrganizationInteractionLimitInput
    { organizationId :: Id
    , limit :: RepositoryInteractionLimit
    , expiry :: Optional RepositoryInteractionLimitExpiry
    , clientMutationId :: Optional String
    }

derive instance genericSetOrganizationInteractionLimitInput
  ::
  Generic SetOrganizationInteractionLimitInput _

derive instance newtypeSetOrganizationInteractionLimitInput
  ::
  Newtype SetOrganizationInteractionLimitInput _

instance toGraphQLArgumentValueSetOrganizationInteractionLimitInput
  :: ToGraphQLArgumentValue SetOrganizationInteractionLimitInput where
  toGraphQLArgumentValue (SetOrganizationInteractionLimitInput x) = toGraphQLArgumentValue
                                                                    x

-- | original name - SetRepositoryInteractionLimitInput
newtype SetRepositoryInteractionLimitInput
  = SetRepositoryInteractionLimitInput
    { repositoryId :: Id
    , limit :: RepositoryInteractionLimit
    , expiry :: Optional RepositoryInteractionLimitExpiry
    , clientMutationId :: Optional String
    }

derive instance genericSetRepositoryInteractionLimitInput
  ::
  Generic SetRepositoryInteractionLimitInput _

derive instance newtypeSetRepositoryInteractionLimitInput
  ::
  Newtype SetRepositoryInteractionLimitInput _

instance toGraphQLArgumentValueSetRepositoryInteractionLimitInput
  :: ToGraphQLArgumentValue SetRepositoryInteractionLimitInput where
  toGraphQLArgumentValue (SetRepositoryInteractionLimitInput x) = toGraphQLArgumentValue
                                                                  x

-- | original name - SetUserInteractionLimitInput
newtype SetUserInteractionLimitInput
  = SetUserInteractionLimitInput
    { userId :: Id
    , limit :: RepositoryInteractionLimit
    , expiry :: Optional RepositoryInteractionLimitExpiry
    , clientMutationId :: Optional String
    }

derive instance genericSetUserInteractionLimitInput
  ::
  Generic SetUserInteractionLimitInput _

derive instance newtypeSetUserInteractionLimitInput
  ::
  Newtype SetUserInteractionLimitInput _

instance toGraphQLArgumentValueSetUserInteractionLimitInput
  :: ToGraphQLArgumentValue SetUserInteractionLimitInput where
  toGraphQLArgumentValue (SetUserInteractionLimitInput x) = toGraphQLArgumentValue
                                                            x

-- | original name - SponsorOrder
newtype SponsorOrder
  = SponsorOrder { field :: SponsorOrderField, direction :: OrderDirection }

derive instance genericSponsorOrder :: Generic SponsorOrder _

derive instance newtypeSponsorOrder :: Newtype SponsorOrder _

instance toGraphQLArgumentValueSponsorOrder
  :: ToGraphQLArgumentValue SponsorOrder where
  toGraphQLArgumentValue (SponsorOrder x) = toGraphQLArgumentValue x

-- | original name - SponsorableOrder
newtype SponsorableOrder
  = SponsorableOrder
    { field :: SponsorableOrderField, direction :: OrderDirection }

derive instance genericSponsorableOrder :: Generic SponsorableOrder _

derive instance newtypeSponsorableOrder :: Newtype SponsorableOrder _

instance toGraphQLArgumentValueSponsorableOrder
  :: ToGraphQLArgumentValue SponsorableOrder where
  toGraphQLArgumentValue (SponsorableOrder x) = toGraphQLArgumentValue x

-- | original name - SponsorsActivityOrder
newtype SponsorsActivityOrder
  = SponsorsActivityOrder
    { field :: SponsorsActivityOrderField, direction :: OrderDirection }

derive instance genericSponsorsActivityOrder :: Generic SponsorsActivityOrder _

derive instance newtypeSponsorsActivityOrder :: Newtype SponsorsActivityOrder _

instance toGraphQLArgumentValueSponsorsActivityOrder
  :: ToGraphQLArgumentValue SponsorsActivityOrder where
  toGraphQLArgumentValue (SponsorsActivityOrder x) = toGraphQLArgumentValue x

-- | original name - SponsorsTierOrder
newtype SponsorsTierOrder
  = SponsorsTierOrder
    { field :: SponsorsTierOrderField, direction :: OrderDirection }

derive instance genericSponsorsTierOrder :: Generic SponsorsTierOrder _

derive instance newtypeSponsorsTierOrder :: Newtype SponsorsTierOrder _

instance toGraphQLArgumentValueSponsorsTierOrder
  :: ToGraphQLArgumentValue SponsorsTierOrder where
  toGraphQLArgumentValue (SponsorsTierOrder x) = toGraphQLArgumentValue x

-- | original name - SponsorshipNewsletterOrder
newtype SponsorshipNewsletterOrder
  = SponsorshipNewsletterOrder
    { field :: SponsorshipNewsletterOrderField, direction :: OrderDirection }

derive instance genericSponsorshipNewsletterOrder
  ::
  Generic SponsorshipNewsletterOrder _

derive instance newtypeSponsorshipNewsletterOrder
  ::
  Newtype SponsorshipNewsletterOrder _

instance toGraphQLArgumentValueSponsorshipNewsletterOrder
  :: ToGraphQLArgumentValue SponsorshipNewsletterOrder where
  toGraphQLArgumentValue (SponsorshipNewsletterOrder x) = toGraphQLArgumentValue
                                                          x

-- | original name - SponsorshipOrder
newtype SponsorshipOrder
  = SponsorshipOrder
    { field :: SponsorshipOrderField, direction :: OrderDirection }

derive instance genericSponsorshipOrder :: Generic SponsorshipOrder _

derive instance newtypeSponsorshipOrder :: Newtype SponsorshipOrder _

instance toGraphQLArgumentValueSponsorshipOrder
  :: ToGraphQLArgumentValue SponsorshipOrder where
  toGraphQLArgumentValue (SponsorshipOrder x) = toGraphQLArgumentValue x

-- | original name - StarOrder
newtype StarOrder
  = StarOrder { field :: StarOrderField, direction :: OrderDirection }

derive instance genericStarOrder :: Generic StarOrder _

derive instance newtypeStarOrder :: Newtype StarOrder _

instance toGraphQLArgumentValueStarOrder
  :: ToGraphQLArgumentValue StarOrder where
  toGraphQLArgumentValue (StarOrder x) = toGraphQLArgumentValue x

-- | original name - StartRepositoryMigrationInput
newtype StartRepositoryMigrationInput
  = StartRepositoryMigrationInput
    { sourceId :: Id
    , ownerId :: Id
    , sourceRepositoryUrl :: Uri
    , repositoryName :: String
    , continueOnError :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericStartRepositoryMigrationInput
  ::
  Generic StartRepositoryMigrationInput _

derive instance newtypeStartRepositoryMigrationInput
  ::
  Newtype StartRepositoryMigrationInput _

instance toGraphQLArgumentValueStartRepositoryMigrationInput
  :: ToGraphQLArgumentValue StartRepositoryMigrationInput where
  toGraphQLArgumentValue (StartRepositoryMigrationInput x) = toGraphQLArgumentValue
                                                             x

-- | original name - SubmitPullRequestReviewInput
newtype SubmitPullRequestReviewInput
  = SubmitPullRequestReviewInput
    { pullRequestId :: Optional Id
    , pullRequestReviewId :: Optional Id
    , event :: PullRequestReviewEvent
    , body :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericSubmitPullRequestReviewInput
  ::
  Generic SubmitPullRequestReviewInput _

derive instance newtypeSubmitPullRequestReviewInput
  ::
  Newtype SubmitPullRequestReviewInput _

instance toGraphQLArgumentValueSubmitPullRequestReviewInput
  :: ToGraphQLArgumentValue SubmitPullRequestReviewInput where
  toGraphQLArgumentValue (SubmitPullRequestReviewInput x) = toGraphQLArgumentValue
                                                            x

-- | original name - TeamDiscussionCommentOrder
newtype TeamDiscussionCommentOrder
  = TeamDiscussionCommentOrder
    { field :: TeamDiscussionCommentOrderField, direction :: OrderDirection }

derive instance genericTeamDiscussionCommentOrder
  ::
  Generic TeamDiscussionCommentOrder _

derive instance newtypeTeamDiscussionCommentOrder
  ::
  Newtype TeamDiscussionCommentOrder _

instance toGraphQLArgumentValueTeamDiscussionCommentOrder
  :: ToGraphQLArgumentValue TeamDiscussionCommentOrder where
  toGraphQLArgumentValue (TeamDiscussionCommentOrder x) = toGraphQLArgumentValue
                                                          x

-- | original name - TeamDiscussionOrder
newtype TeamDiscussionOrder
  = TeamDiscussionOrder
    { field :: TeamDiscussionOrderField, direction :: OrderDirection }

derive instance genericTeamDiscussionOrder :: Generic TeamDiscussionOrder _

derive instance newtypeTeamDiscussionOrder :: Newtype TeamDiscussionOrder _

instance toGraphQLArgumentValueTeamDiscussionOrder
  :: ToGraphQLArgumentValue TeamDiscussionOrder where
  toGraphQLArgumentValue (TeamDiscussionOrder x) = toGraphQLArgumentValue x

-- | original name - TeamMemberOrder
newtype TeamMemberOrder
  = TeamMemberOrder
    { field :: TeamMemberOrderField, direction :: OrderDirection }

derive instance genericTeamMemberOrder :: Generic TeamMemberOrder _

derive instance newtypeTeamMemberOrder :: Newtype TeamMemberOrder _

instance toGraphQLArgumentValueTeamMemberOrder
  :: ToGraphQLArgumentValue TeamMemberOrder where
  toGraphQLArgumentValue (TeamMemberOrder x) = toGraphQLArgumentValue x

-- | original name - TeamOrder
newtype TeamOrder
  = TeamOrder { field :: TeamOrderField, direction :: OrderDirection }

derive instance genericTeamOrder :: Generic TeamOrder _

derive instance newtypeTeamOrder :: Newtype TeamOrder _

instance toGraphQLArgumentValueTeamOrder
  :: ToGraphQLArgumentValue TeamOrder where
  toGraphQLArgumentValue (TeamOrder x) = toGraphQLArgumentValue x

-- | original name - TeamRepositoryOrder
newtype TeamRepositoryOrder
  = TeamRepositoryOrder
    { field :: TeamRepositoryOrderField, direction :: OrderDirection }

derive instance genericTeamRepositoryOrder :: Generic TeamRepositoryOrder _

derive instance newtypeTeamRepositoryOrder :: Newtype TeamRepositoryOrder _

instance toGraphQLArgumentValueTeamRepositoryOrder
  :: ToGraphQLArgumentValue TeamRepositoryOrder where
  toGraphQLArgumentValue (TeamRepositoryOrder x) = toGraphQLArgumentValue x

-- | original name - TransferIssueInput
newtype TransferIssueInput
  = TransferIssueInput
    { issueId :: Id, repositoryId :: Id, clientMutationId :: Optional String }

derive instance genericTransferIssueInput :: Generic TransferIssueInput _

derive instance newtypeTransferIssueInput :: Newtype TransferIssueInput _

instance toGraphQLArgumentValueTransferIssueInput
  :: ToGraphQLArgumentValue TransferIssueInput where
  toGraphQLArgumentValue (TransferIssueInput x) = toGraphQLArgumentValue x

-- | original name - UnarchiveRepositoryInput
newtype UnarchiveRepositoryInput
  = UnarchiveRepositoryInput
    { repositoryId :: Id, clientMutationId :: Optional String }

derive instance genericUnarchiveRepositoryInput
  ::
  Generic UnarchiveRepositoryInput _

derive instance newtypeUnarchiveRepositoryInput
  ::
  Newtype UnarchiveRepositoryInput _

instance toGraphQLArgumentValueUnarchiveRepositoryInput
  :: ToGraphQLArgumentValue UnarchiveRepositoryInput where
  toGraphQLArgumentValue (UnarchiveRepositoryInput x) = toGraphQLArgumentValue x

-- | original name - UnfollowUserInput
newtype UnfollowUserInput
  = UnfollowUserInput { userId :: Id, clientMutationId :: Optional String }

derive instance genericUnfollowUserInput :: Generic UnfollowUserInput _

derive instance newtypeUnfollowUserInput :: Newtype UnfollowUserInput _

instance toGraphQLArgumentValueUnfollowUserInput
  :: ToGraphQLArgumentValue UnfollowUserInput where
  toGraphQLArgumentValue (UnfollowUserInput x) = toGraphQLArgumentValue x

-- | original name - UnlinkRepositoryFromProjectInput
newtype UnlinkRepositoryFromProjectInput
  = UnlinkRepositoryFromProjectInput
    { projectId :: Id, repositoryId :: Id, clientMutationId :: Optional String }

derive instance genericUnlinkRepositoryFromProjectInput
  ::
  Generic UnlinkRepositoryFromProjectInput _

derive instance newtypeUnlinkRepositoryFromProjectInput
  ::
  Newtype UnlinkRepositoryFromProjectInput _

instance toGraphQLArgumentValueUnlinkRepositoryFromProjectInput
  :: ToGraphQLArgumentValue UnlinkRepositoryFromProjectInput where
  toGraphQLArgumentValue (UnlinkRepositoryFromProjectInput x) = toGraphQLArgumentValue
                                                                x

-- | original name - UnlockLockableInput
newtype UnlockLockableInput
  = UnlockLockableInput
    { lockableId :: Id, clientMutationId :: Optional String }

derive instance genericUnlockLockableInput :: Generic UnlockLockableInput _

derive instance newtypeUnlockLockableInput :: Newtype UnlockLockableInput _

instance toGraphQLArgumentValueUnlockLockableInput
  :: ToGraphQLArgumentValue UnlockLockableInput where
  toGraphQLArgumentValue (UnlockLockableInput x) = toGraphQLArgumentValue x

-- | original name - UnmarkDiscussionCommentAsAnswerInput
newtype UnmarkDiscussionCommentAsAnswerInput
  = UnmarkDiscussionCommentAsAnswerInput
    { id :: Id, clientMutationId :: Optional String }

derive instance genericUnmarkDiscussionCommentAsAnswerInput
  ::
  Generic UnmarkDiscussionCommentAsAnswerInput _

derive instance newtypeUnmarkDiscussionCommentAsAnswerInput
  ::
  Newtype UnmarkDiscussionCommentAsAnswerInput _

instance toGraphQLArgumentValueUnmarkDiscussionCommentAsAnswerInput
  :: ToGraphQLArgumentValue UnmarkDiscussionCommentAsAnswerInput where
  toGraphQLArgumentValue (UnmarkDiscussionCommentAsAnswerInput x) = toGraphQLArgumentValue
                                                                    x

-- | original name - UnmarkFileAsViewedInput
newtype UnmarkFileAsViewedInput
  = UnmarkFileAsViewedInput
    { pullRequestId :: Id, path :: String, clientMutationId :: Optional String }

derive instance genericUnmarkFileAsViewedInput
  ::
  Generic UnmarkFileAsViewedInput _

derive instance newtypeUnmarkFileAsViewedInput
  ::
  Newtype UnmarkFileAsViewedInput _

instance toGraphQLArgumentValueUnmarkFileAsViewedInput
  :: ToGraphQLArgumentValue UnmarkFileAsViewedInput where
  toGraphQLArgumentValue (UnmarkFileAsViewedInput x) = toGraphQLArgumentValue x

-- | original name - UnmarkIssueAsDuplicateInput
newtype UnmarkIssueAsDuplicateInput
  = UnmarkIssueAsDuplicateInput
    { duplicateId :: Id
    , canonicalId :: Id
    , clientMutationId :: Optional String
    }

derive instance genericUnmarkIssueAsDuplicateInput
  ::
  Generic UnmarkIssueAsDuplicateInput _

derive instance newtypeUnmarkIssueAsDuplicateInput
  ::
  Newtype UnmarkIssueAsDuplicateInput _

instance toGraphQLArgumentValueUnmarkIssueAsDuplicateInput
  :: ToGraphQLArgumentValue UnmarkIssueAsDuplicateInput where
  toGraphQLArgumentValue (UnmarkIssueAsDuplicateInput x) = toGraphQLArgumentValue
                                                           x

-- | original name - UnminimizeCommentInput
newtype UnminimizeCommentInput
  = UnminimizeCommentInput
    { subjectId :: Id, clientMutationId :: Optional String }

derive instance genericUnminimizeCommentInput
  ::
  Generic UnminimizeCommentInput _

derive instance newtypeUnminimizeCommentInput
  ::
  Newtype UnminimizeCommentInput _

instance toGraphQLArgumentValueUnminimizeCommentInput
  :: ToGraphQLArgumentValue UnminimizeCommentInput where
  toGraphQLArgumentValue (UnminimizeCommentInput x) = toGraphQLArgumentValue x

-- | original name - UnpinIssueInput
newtype UnpinIssueInput
  = UnpinIssueInput { issueId :: Id, clientMutationId :: Optional String }

derive instance genericUnpinIssueInput :: Generic UnpinIssueInput _

derive instance newtypeUnpinIssueInput :: Newtype UnpinIssueInput _

instance toGraphQLArgumentValueUnpinIssueInput
  :: ToGraphQLArgumentValue UnpinIssueInput where
  toGraphQLArgumentValue (UnpinIssueInput x) = toGraphQLArgumentValue x

-- | original name - UnresolveReviewThreadInput
newtype UnresolveReviewThreadInput
  = UnresolveReviewThreadInput
    { threadId :: Id, clientMutationId :: Optional String }

derive instance genericUnresolveReviewThreadInput
  ::
  Generic UnresolveReviewThreadInput _

derive instance newtypeUnresolveReviewThreadInput
  ::
  Newtype UnresolveReviewThreadInput _

instance toGraphQLArgumentValueUnresolveReviewThreadInput
  :: ToGraphQLArgumentValue UnresolveReviewThreadInput where
  toGraphQLArgumentValue (UnresolveReviewThreadInput x) = toGraphQLArgumentValue
                                                          x

-- | original name - UpdateBranchProtectionRuleInput
newtype UpdateBranchProtectionRuleInput
  = UpdateBranchProtectionRuleInput
    { branchProtectionRuleId :: Id
    , pattern :: Optional String
    , requiresApprovingReviews :: Optional Boolean
    , requiredApprovingReviewCount :: Optional Int
    , requiresCommitSignatures :: Optional Boolean
    , requiresLinearHistory :: Optional Boolean
    , allowsForcePushes :: Optional Boolean
    , allowsDeletions :: Optional Boolean
    , isAdminEnforced :: Optional Boolean
    , requiresStatusChecks :: Optional Boolean
    , requiresStrictStatusChecks :: Optional Boolean
    , requiresCodeOwnerReviews :: Optional Boolean
    , dismissesStaleReviews :: Optional Boolean
    , restrictsReviewDismissals :: Optional Boolean
    , reviewDismissalActorIds :: Optional (Array Id)
    , bypassPullRequestActorIds :: Optional (Array Id)
    , bypassForcePushActorIds :: Optional (Array Id)
    , restrictsPushes :: Optional Boolean
    , pushActorIds :: Optional (Array Id)
    , requiredStatusCheckContexts :: Optional (Array String)
    , requiredStatusChecks :: Optional (Array RequiredStatusCheckInput)
    , requiresConversationResolution :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericUpdateBranchProtectionRuleInput
  ::
  Generic UpdateBranchProtectionRuleInput _

derive instance newtypeUpdateBranchProtectionRuleInput
  ::
  Newtype UpdateBranchProtectionRuleInput _

instance toGraphQLArgumentValueUpdateBranchProtectionRuleInput
  :: ToGraphQLArgumentValue UpdateBranchProtectionRuleInput where
  toGraphQLArgumentValue (UpdateBranchProtectionRuleInput x) = toGraphQLArgumentValue
                                                               x

-- | original name - UpdateCheckRunInput
newtype UpdateCheckRunInput
  = UpdateCheckRunInput
    { repositoryId :: Id
    , checkRunId :: Id
    , name :: Optional String
    , detailsUrl :: Optional Uri
    , externalId :: Optional String
    , status :: Optional RequestableCheckStatusState
    , startedAt :: Optional DateTime
    , conclusion :: Optional CheckConclusionState
    , completedAt :: Optional DateTime
    , output :: Optional CheckRunOutput
    , actions :: Optional (Array CheckRunAction)
    , clientMutationId :: Optional String
    }

derive instance genericUpdateCheckRunInput :: Generic UpdateCheckRunInput _

derive instance newtypeUpdateCheckRunInput :: Newtype UpdateCheckRunInput _

instance toGraphQLArgumentValueUpdateCheckRunInput
  :: ToGraphQLArgumentValue UpdateCheckRunInput where
  toGraphQLArgumentValue (UpdateCheckRunInput x) = toGraphQLArgumentValue x

-- | original name - UpdateCheckSuitePreferencesInput
newtype UpdateCheckSuitePreferencesInput
  = UpdateCheckSuitePreferencesInput
    { repositoryId :: Id
    , autoTriggerPreferences :: Array CheckSuiteAutoTriggerPreference
    , clientMutationId :: Optional String
    }

derive instance genericUpdateCheckSuitePreferencesInput
  ::
  Generic UpdateCheckSuitePreferencesInput _

derive instance newtypeUpdateCheckSuitePreferencesInput
  ::
  Newtype UpdateCheckSuitePreferencesInput _

instance toGraphQLArgumentValueUpdateCheckSuitePreferencesInput
  :: ToGraphQLArgumentValue UpdateCheckSuitePreferencesInput where
  toGraphQLArgumentValue (UpdateCheckSuitePreferencesInput x) = toGraphQLArgumentValue
                                                                x

-- | original name - UpdateDiscussionCommentInput
newtype UpdateDiscussionCommentInput
  = UpdateDiscussionCommentInput
    { commentId :: Id, body :: String, clientMutationId :: Optional String }

derive instance genericUpdateDiscussionCommentInput
  ::
  Generic UpdateDiscussionCommentInput _

derive instance newtypeUpdateDiscussionCommentInput
  ::
  Newtype UpdateDiscussionCommentInput _

instance toGraphQLArgumentValueUpdateDiscussionCommentInput
  :: ToGraphQLArgumentValue UpdateDiscussionCommentInput where
  toGraphQLArgumentValue (UpdateDiscussionCommentInput x) = toGraphQLArgumentValue
                                                            x

-- | original name - UpdateDiscussionInput
newtype UpdateDiscussionInput
  = UpdateDiscussionInput
    { discussionId :: Id
    , title :: Optional String
    , body :: Optional String
    , categoryId :: Optional Id
    , clientMutationId :: Optional String
    }

derive instance genericUpdateDiscussionInput :: Generic UpdateDiscussionInput _

derive instance newtypeUpdateDiscussionInput :: Newtype UpdateDiscussionInput _

instance toGraphQLArgumentValueUpdateDiscussionInput
  :: ToGraphQLArgumentValue UpdateDiscussionInput where
  toGraphQLArgumentValue (UpdateDiscussionInput x) = toGraphQLArgumentValue x

-- | original name - UpdateEnterpriseAdministratorRoleInput
newtype UpdateEnterpriseAdministratorRoleInput
  = UpdateEnterpriseAdministratorRoleInput
    { enterpriseId :: Id
    , login :: String
    , role :: EnterpriseAdministratorRole
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseAdministratorRoleInput
  ::
  Generic UpdateEnterpriseAdministratorRoleInput _

derive instance newtypeUpdateEnterpriseAdministratorRoleInput
  ::
  Newtype UpdateEnterpriseAdministratorRoleInput _

instance toGraphQLArgumentValueUpdateEnterpriseAdministratorRoleInput
  :: ToGraphQLArgumentValue UpdateEnterpriseAdministratorRoleInput where
  toGraphQLArgumentValue (UpdateEnterpriseAdministratorRoleInput x) = toGraphQLArgumentValue
                                                                      x

-- | original name - UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
newtype UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
  = UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseEnabledDisabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
  ::
  Generic UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput _

derive instance newtypeUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
  ::
  Newtype UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput x) = toGraphQLArgumentValue
                                                                                         x

-- | original name - UpdateEnterpriseDefaultRepositoryPermissionSettingInput
newtype UpdateEnterpriseDefaultRepositoryPermissionSettingInput
  = UpdateEnterpriseDefaultRepositoryPermissionSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseDefaultRepositoryPermissionSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseDefaultRepositoryPermissionSettingInput
  ::
  Generic UpdateEnterpriseDefaultRepositoryPermissionSettingInput _

derive instance newtypeUpdateEnterpriseDefaultRepositoryPermissionSettingInput
  ::
  Newtype UpdateEnterpriseDefaultRepositoryPermissionSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseDefaultRepositoryPermissionSettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseDefaultRepositoryPermissionSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseDefaultRepositoryPermissionSettingInput x) = toGraphQLArgumentValue
                                                                                       x

-- | original name - UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
newtype UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
  = UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseEnabledDisabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
  ::
  Generic UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput _

derive instance newtypeUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
  ::
  Newtype UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput x) = toGraphQLArgumentValue
                                                                                                x

-- | original name - UpdateEnterpriseMembersCanCreateRepositoriesSettingInput
newtype UpdateEnterpriseMembersCanCreateRepositoriesSettingInput
  = UpdateEnterpriseMembersCanCreateRepositoriesSettingInput
    { enterpriseId :: Id
    , settingValue
      :: Optional
         EnterpriseMembersCanCreateRepositoriesSettingValue
    , membersCanCreateRepositoriesPolicyEnabled :: Optional Boolean
    , membersCanCreatePublicRepositories :: Optional Boolean
    , membersCanCreatePrivateRepositories :: Optional Boolean
    , membersCanCreateInternalRepositories :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseMembersCanCreateRepositoriesSettingInput
  ::
  Generic UpdateEnterpriseMembersCanCreateRepositoriesSettingInput _

derive instance newtypeUpdateEnterpriseMembersCanCreateRepositoriesSettingInput
  ::
  Newtype UpdateEnterpriseMembersCanCreateRepositoriesSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseMembersCanCreateRepositoriesSettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseMembersCanCreateRepositoriesSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseMembersCanCreateRepositoriesSettingInput x) = toGraphQLArgumentValue
                                                                                        x

-- | original name - UpdateEnterpriseMembersCanDeleteIssuesSettingInput
newtype UpdateEnterpriseMembersCanDeleteIssuesSettingInput
  = UpdateEnterpriseMembersCanDeleteIssuesSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseEnabledDisabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseMembersCanDeleteIssuesSettingInput
  ::
  Generic UpdateEnterpriseMembersCanDeleteIssuesSettingInput _

derive instance newtypeUpdateEnterpriseMembersCanDeleteIssuesSettingInput
  ::
  Newtype UpdateEnterpriseMembersCanDeleteIssuesSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseMembersCanDeleteIssuesSettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseMembersCanDeleteIssuesSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseMembersCanDeleteIssuesSettingInput x) = toGraphQLArgumentValue
                                                                                  x

-- | original name - UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
newtype UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
  = UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseEnabledDisabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
  ::
  Generic UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput _

derive instance newtypeUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
  ::
  Newtype UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput x) = toGraphQLArgumentValue
                                                                                        x

-- | original name - UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
newtype UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
  = UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseEnabledDisabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
  ::
  Generic UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput _

derive instance newtypeUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
  ::
  Newtype UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput x) = toGraphQLArgumentValue
                                                                                         x

-- | original name - UpdateEnterpriseMembersCanMakePurchasesSettingInput
newtype UpdateEnterpriseMembersCanMakePurchasesSettingInput
  = UpdateEnterpriseMembersCanMakePurchasesSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseMembersCanMakePurchasesSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseMembersCanMakePurchasesSettingInput
  ::
  Generic UpdateEnterpriseMembersCanMakePurchasesSettingInput _

derive instance newtypeUpdateEnterpriseMembersCanMakePurchasesSettingInput
  ::
  Newtype UpdateEnterpriseMembersCanMakePurchasesSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseMembersCanMakePurchasesSettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseMembersCanMakePurchasesSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseMembersCanMakePurchasesSettingInput x) = toGraphQLArgumentValue
                                                                                   x

-- | original name - UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
newtype UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
  = UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseEnabledDisabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
  ::
  Generic UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput _

derive instance newtypeUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
  ::
  Newtype UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput x) = toGraphQLArgumentValue
                                                                                             x

-- | original name - UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
newtype UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
  = UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseEnabledDisabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
  ::
  Generic UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput _

derive instance newtypeUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
  ::
  Newtype UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput x) = toGraphQLArgumentValue
                                                                                            x

-- | original name - UpdateEnterpriseOrganizationProjectsSettingInput
newtype UpdateEnterpriseOrganizationProjectsSettingInput
  = UpdateEnterpriseOrganizationProjectsSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseEnabledDisabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseOrganizationProjectsSettingInput
  ::
  Generic UpdateEnterpriseOrganizationProjectsSettingInput _

derive instance newtypeUpdateEnterpriseOrganizationProjectsSettingInput
  ::
  Newtype UpdateEnterpriseOrganizationProjectsSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseOrganizationProjectsSettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseOrganizationProjectsSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseOrganizationProjectsSettingInput x) = toGraphQLArgumentValue
                                                                                x

-- | original name - UpdateEnterpriseOwnerOrganizationRoleInput
newtype UpdateEnterpriseOwnerOrganizationRoleInput
  = UpdateEnterpriseOwnerOrganizationRoleInput
    { enterpriseId :: Id
    , organizationId :: Id
    , organizationRole :: RoleInOrganization
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseOwnerOrganizationRoleInput
  ::
  Generic UpdateEnterpriseOwnerOrganizationRoleInput _

derive instance newtypeUpdateEnterpriseOwnerOrganizationRoleInput
  ::
  Newtype UpdateEnterpriseOwnerOrganizationRoleInput _

instance toGraphQLArgumentValueUpdateEnterpriseOwnerOrganizationRoleInput
  :: ToGraphQLArgumentValue UpdateEnterpriseOwnerOrganizationRoleInput where
  toGraphQLArgumentValue (UpdateEnterpriseOwnerOrganizationRoleInput x) = toGraphQLArgumentValue
                                                                          x

-- | original name - UpdateEnterpriseProfileInput
newtype UpdateEnterpriseProfileInput
  = UpdateEnterpriseProfileInput
    { enterpriseId :: Id
    , name :: Optional String
    , description :: Optional String
    , websiteUrl :: Optional String
    , location :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseProfileInput
  ::
  Generic UpdateEnterpriseProfileInput _

derive instance newtypeUpdateEnterpriseProfileInput
  ::
  Newtype UpdateEnterpriseProfileInput _

instance toGraphQLArgumentValueUpdateEnterpriseProfileInput
  :: ToGraphQLArgumentValue UpdateEnterpriseProfileInput where
  toGraphQLArgumentValue (UpdateEnterpriseProfileInput x) = toGraphQLArgumentValue
                                                            x

-- | original name - UpdateEnterpriseRepositoryProjectsSettingInput
newtype UpdateEnterpriseRepositoryProjectsSettingInput
  = UpdateEnterpriseRepositoryProjectsSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseEnabledDisabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseRepositoryProjectsSettingInput
  ::
  Generic UpdateEnterpriseRepositoryProjectsSettingInput _

derive instance newtypeUpdateEnterpriseRepositoryProjectsSettingInput
  ::
  Newtype UpdateEnterpriseRepositoryProjectsSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseRepositoryProjectsSettingInput
  :: ToGraphQLArgumentValue UpdateEnterpriseRepositoryProjectsSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseRepositoryProjectsSettingInput x) = toGraphQLArgumentValue
                                                                              x

-- | original name - UpdateEnterpriseTeamDiscussionsSettingInput
newtype UpdateEnterpriseTeamDiscussionsSettingInput
  = UpdateEnterpriseTeamDiscussionsSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseEnabledDisabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseTeamDiscussionsSettingInput
  ::
  Generic UpdateEnterpriseTeamDiscussionsSettingInput _

derive instance newtypeUpdateEnterpriseTeamDiscussionsSettingInput
  ::
  Newtype UpdateEnterpriseTeamDiscussionsSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseTeamDiscussionsSettingInput
  :: ToGraphQLArgumentValue UpdateEnterpriseTeamDiscussionsSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseTeamDiscussionsSettingInput x) = toGraphQLArgumentValue
                                                                           x

-- | original name - UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
newtype UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
  = UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
    { enterpriseId :: Id
    , settingValue :: EnterpriseEnabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
  ::
  Generic UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput _

derive instance newtypeUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
  ::
  Newtype UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput _

instance toGraphQLArgumentValueUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
  :: ToGraphQLArgumentValue
     UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput where
  toGraphQLArgumentValue (UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput x) = toGraphQLArgumentValue
                                                                                           x

-- | original name - UpdateEnvironmentInput
newtype UpdateEnvironmentInput
  = UpdateEnvironmentInput
    { environmentId :: Id
    , waitTimer :: Optional Int
    , reviewers :: Optional (Array Id)
    , clientMutationId :: Optional String
    }

derive instance genericUpdateEnvironmentInput
  ::
  Generic UpdateEnvironmentInput _

derive instance newtypeUpdateEnvironmentInput
  ::
  Newtype UpdateEnvironmentInput _

instance toGraphQLArgumentValueUpdateEnvironmentInput
  :: ToGraphQLArgumentValue UpdateEnvironmentInput where
  toGraphQLArgumentValue (UpdateEnvironmentInput x) = toGraphQLArgumentValue x

-- | original name - UpdateIpAllowListEnabledSettingInput
newtype UpdateIpAllowListEnabledSettingInput
  = UpdateIpAllowListEnabledSettingInput
    { ownerId :: Id
    , settingValue :: IpAllowListEnabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateIpAllowListEnabledSettingInput
  ::
  Generic UpdateIpAllowListEnabledSettingInput _

derive instance newtypeUpdateIpAllowListEnabledSettingInput
  ::
  Newtype UpdateIpAllowListEnabledSettingInput _

instance toGraphQLArgumentValueUpdateIpAllowListEnabledSettingInput
  :: ToGraphQLArgumentValue UpdateIpAllowListEnabledSettingInput where
  toGraphQLArgumentValue (UpdateIpAllowListEnabledSettingInput x) = toGraphQLArgumentValue
                                                                    x

-- | original name - UpdateIpAllowListEntryInput
newtype UpdateIpAllowListEntryInput
  = UpdateIpAllowListEntryInput
    { ipAllowListEntryId :: Id
    , allowListValue :: String
    , name :: Optional String
    , isActive :: Boolean
    , clientMutationId :: Optional String
    }

derive instance genericUpdateIpAllowListEntryInput
  ::
  Generic UpdateIpAllowListEntryInput _

derive instance newtypeUpdateIpAllowListEntryInput
  ::
  Newtype UpdateIpAllowListEntryInput _

instance toGraphQLArgumentValueUpdateIpAllowListEntryInput
  :: ToGraphQLArgumentValue UpdateIpAllowListEntryInput where
  toGraphQLArgumentValue (UpdateIpAllowListEntryInput x) = toGraphQLArgumentValue
                                                           x

-- | original name - UpdateIpAllowListForInstalledAppsEnabledSettingInput
newtype UpdateIpAllowListForInstalledAppsEnabledSettingInput
  = UpdateIpAllowListForInstalledAppsEnabledSettingInput
    { ownerId :: Id
    , settingValue :: IpAllowListForInstalledAppsEnabledSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateIpAllowListForInstalledAppsEnabledSettingInput
  ::
  Generic UpdateIpAllowListForInstalledAppsEnabledSettingInput _

derive instance newtypeUpdateIpAllowListForInstalledAppsEnabledSettingInput
  ::
  Newtype UpdateIpAllowListForInstalledAppsEnabledSettingInput _

instance toGraphQLArgumentValueUpdateIpAllowListForInstalledAppsEnabledSettingInput
  :: ToGraphQLArgumentValue
     UpdateIpAllowListForInstalledAppsEnabledSettingInput where
  toGraphQLArgumentValue (UpdateIpAllowListForInstalledAppsEnabledSettingInput x) = toGraphQLArgumentValue
                                                                                    x

-- | original name - UpdateIssueCommentInput
newtype UpdateIssueCommentInput
  = UpdateIssueCommentInput
    { id :: Id, body :: String, clientMutationId :: Optional String }

derive instance genericUpdateIssueCommentInput
  ::
  Generic UpdateIssueCommentInput _

derive instance newtypeUpdateIssueCommentInput
  ::
  Newtype UpdateIssueCommentInput _

instance toGraphQLArgumentValueUpdateIssueCommentInput
  :: ToGraphQLArgumentValue UpdateIssueCommentInput where
  toGraphQLArgumentValue (UpdateIssueCommentInput x) = toGraphQLArgumentValue x

-- | original name - UpdateIssueInput
newtype UpdateIssueInput
  = UpdateIssueInput
    { id :: Id
    , title :: Optional String
    , body :: Optional String
    , assigneeIds :: Optional (Array Id)
    , milestoneId :: Optional Id
    , labelIds :: Optional (Array Id)
    , state :: Optional IssueState
    , projectIds :: Optional (Array Id)
    , clientMutationId :: Optional String
    }

derive instance genericUpdateIssueInput :: Generic UpdateIssueInput _

derive instance newtypeUpdateIssueInput :: Newtype UpdateIssueInput _

instance toGraphQLArgumentValueUpdateIssueInput
  :: ToGraphQLArgumentValue UpdateIssueInput where
  toGraphQLArgumentValue (UpdateIssueInput x) = toGraphQLArgumentValue x

-- | original name - UpdateNotificationRestrictionSettingInput
newtype UpdateNotificationRestrictionSettingInput
  = UpdateNotificationRestrictionSettingInput
    { ownerId :: Id
    , settingValue :: NotificationRestrictionSettingValue
    , clientMutationId :: Optional String
    }

derive instance genericUpdateNotificationRestrictionSettingInput
  ::
  Generic UpdateNotificationRestrictionSettingInput _

derive instance newtypeUpdateNotificationRestrictionSettingInput
  ::
  Newtype UpdateNotificationRestrictionSettingInput _

instance toGraphQLArgumentValueUpdateNotificationRestrictionSettingInput
  :: ToGraphQLArgumentValue UpdateNotificationRestrictionSettingInput where
  toGraphQLArgumentValue (UpdateNotificationRestrictionSettingInput x) = toGraphQLArgumentValue
                                                                         x

-- | original name - UpdateOrganizationAllowPrivateRepositoryForkingSettingInput
newtype UpdateOrganizationAllowPrivateRepositoryForkingSettingInput
  = UpdateOrganizationAllowPrivateRepositoryForkingSettingInput
    { organizationId :: Id
    , forkingEnabled :: Boolean
    , clientMutationId :: Optional String
    }

derive instance genericUpdateOrganizationAllowPrivateRepositoryForkingSettingInput
  ::
  Generic UpdateOrganizationAllowPrivateRepositoryForkingSettingInput _

derive instance newtypeUpdateOrganizationAllowPrivateRepositoryForkingSettingInput
  ::
  Newtype UpdateOrganizationAllowPrivateRepositoryForkingSettingInput _

instance toGraphQLArgumentValueUpdateOrganizationAllowPrivateRepositoryForkingSettingInput
  :: ToGraphQLArgumentValue
     UpdateOrganizationAllowPrivateRepositoryForkingSettingInput where
  toGraphQLArgumentValue (UpdateOrganizationAllowPrivateRepositoryForkingSettingInput x) = toGraphQLArgumentValue
                                                                                           x

-- | original name - UpdateProjectCardInput
newtype UpdateProjectCardInput
  = UpdateProjectCardInput
    { projectCardId :: Id
    , isArchived :: Optional Boolean
    , note :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericUpdateProjectCardInput
  ::
  Generic UpdateProjectCardInput _

derive instance newtypeUpdateProjectCardInput
  ::
  Newtype UpdateProjectCardInput _

instance toGraphQLArgumentValueUpdateProjectCardInput
  :: ToGraphQLArgumentValue UpdateProjectCardInput where
  toGraphQLArgumentValue (UpdateProjectCardInput x) = toGraphQLArgumentValue x

-- | original name - UpdateProjectColumnInput
newtype UpdateProjectColumnInput
  = UpdateProjectColumnInput
    { projectColumnId :: Id
    , name :: String
    , clientMutationId :: Optional String
    }

derive instance genericUpdateProjectColumnInput
  ::
  Generic UpdateProjectColumnInput _

derive instance newtypeUpdateProjectColumnInput
  ::
  Newtype UpdateProjectColumnInput _

instance toGraphQLArgumentValueUpdateProjectColumnInput
  :: ToGraphQLArgumentValue UpdateProjectColumnInput where
  toGraphQLArgumentValue (UpdateProjectColumnInput x) = toGraphQLArgumentValue x

-- | original name - UpdateProjectInput
newtype UpdateProjectInput
  = UpdateProjectInput
    { projectId :: Id
    , name :: Optional String
    , body :: Optional String
    , state :: Optional ProjectState
    , public :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericUpdateProjectInput :: Generic UpdateProjectInput _

derive instance newtypeUpdateProjectInput :: Newtype UpdateProjectInput _

instance toGraphQLArgumentValueUpdateProjectInput
  :: ToGraphQLArgumentValue UpdateProjectInput where
  toGraphQLArgumentValue (UpdateProjectInput x) = toGraphQLArgumentValue x

-- | original name - UpdateProjectNextItemFieldInput
newtype UpdateProjectNextItemFieldInput
  = UpdateProjectNextItemFieldInput
    { projectId :: Id
    , itemId :: Id
    , fieldId :: Id
    , value :: String
    , clientMutationId :: Optional String
    }

derive instance genericUpdateProjectNextItemFieldInput
  ::
  Generic UpdateProjectNextItemFieldInput _

derive instance newtypeUpdateProjectNextItemFieldInput
  ::
  Newtype UpdateProjectNextItemFieldInput _

instance toGraphQLArgumentValueUpdateProjectNextItemFieldInput
  :: ToGraphQLArgumentValue UpdateProjectNextItemFieldInput where
  toGraphQLArgumentValue (UpdateProjectNextItemFieldInput x) = toGraphQLArgumentValue
                                                               x

-- | original name - UpdatePullRequestBranchInput
newtype UpdatePullRequestBranchInput
  = UpdatePullRequestBranchInput
    { pullRequestId :: Id
    , expectedHeadOid :: Optional GitObjectId
    , clientMutationId :: Optional String
    }

derive instance genericUpdatePullRequestBranchInput
  ::
  Generic UpdatePullRequestBranchInput _

derive instance newtypeUpdatePullRequestBranchInput
  ::
  Newtype UpdatePullRequestBranchInput _

instance toGraphQLArgumentValueUpdatePullRequestBranchInput
  :: ToGraphQLArgumentValue UpdatePullRequestBranchInput where
  toGraphQLArgumentValue (UpdatePullRequestBranchInput x) = toGraphQLArgumentValue
                                                            x

-- | original name - UpdatePullRequestInput
newtype UpdatePullRequestInput
  = UpdatePullRequestInput
    { pullRequestId :: Id
    , baseRefName :: Optional String
    , title :: Optional String
    , body :: Optional String
    , state :: Optional PullRequestUpdateState
    , maintainerCanModify :: Optional Boolean
    , assigneeIds :: Optional (Array Id)
    , milestoneId :: Optional Id
    , labelIds :: Optional (Array Id)
    , projectIds :: Optional (Array Id)
    , clientMutationId :: Optional String
    }

derive instance genericUpdatePullRequestInput
  ::
  Generic UpdatePullRequestInput _

derive instance newtypeUpdatePullRequestInput
  ::
  Newtype UpdatePullRequestInput _

instance toGraphQLArgumentValueUpdatePullRequestInput
  :: ToGraphQLArgumentValue UpdatePullRequestInput where
  toGraphQLArgumentValue (UpdatePullRequestInput x) = toGraphQLArgumentValue x

-- | original name - UpdatePullRequestReviewCommentInput
newtype UpdatePullRequestReviewCommentInput
  = UpdatePullRequestReviewCommentInput
    { pullRequestReviewCommentId :: Id
    , body :: String
    , clientMutationId :: Optional String
    }

derive instance genericUpdatePullRequestReviewCommentInput
  ::
  Generic UpdatePullRequestReviewCommentInput _

derive instance newtypeUpdatePullRequestReviewCommentInput
  ::
  Newtype UpdatePullRequestReviewCommentInput _

instance toGraphQLArgumentValueUpdatePullRequestReviewCommentInput
  :: ToGraphQLArgumentValue UpdatePullRequestReviewCommentInput where
  toGraphQLArgumentValue (UpdatePullRequestReviewCommentInput x) = toGraphQLArgumentValue
                                                                   x

-- | original name - UpdatePullRequestReviewInput
newtype UpdatePullRequestReviewInput
  = UpdatePullRequestReviewInput
    { pullRequestReviewId :: Id
    , body :: String
    , clientMutationId :: Optional String
    }

derive instance genericUpdatePullRequestReviewInput
  ::
  Generic UpdatePullRequestReviewInput _

derive instance newtypeUpdatePullRequestReviewInput
  ::
  Newtype UpdatePullRequestReviewInput _

instance toGraphQLArgumentValueUpdatePullRequestReviewInput
  :: ToGraphQLArgumentValue UpdatePullRequestReviewInput where
  toGraphQLArgumentValue (UpdatePullRequestReviewInput x) = toGraphQLArgumentValue
                                                            x

-- | original name - UpdateRefInput
newtype UpdateRefInput
  = UpdateRefInput
    { refId :: Id
    , oid :: GitObjectId
    , force :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericUpdateRefInput :: Generic UpdateRefInput _

derive instance newtypeUpdateRefInput :: Newtype UpdateRefInput _

instance toGraphQLArgumentValueUpdateRefInput
  :: ToGraphQLArgumentValue UpdateRefInput where
  toGraphQLArgumentValue (UpdateRefInput x) = toGraphQLArgumentValue x

-- | original name - UpdateRepositoryInput
newtype UpdateRepositoryInput
  = UpdateRepositoryInput
    { repositoryId :: Id
    , name :: Optional String
    , description :: Optional String
    , template :: Optional Boolean
    , homepageUrl :: Optional Uri
    , hasWikiEnabled :: Optional Boolean
    , hasIssuesEnabled :: Optional Boolean
    , hasProjectsEnabled :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericUpdateRepositoryInput :: Generic UpdateRepositoryInput _

derive instance newtypeUpdateRepositoryInput :: Newtype UpdateRepositoryInput _

instance toGraphQLArgumentValueUpdateRepositoryInput
  :: ToGraphQLArgumentValue UpdateRepositoryInput where
  toGraphQLArgumentValue (UpdateRepositoryInput x) = toGraphQLArgumentValue x

-- | original name - UpdateSponsorshipPreferencesInput
newtype UpdateSponsorshipPreferencesInput
  = UpdateSponsorshipPreferencesInput
    { sponsorId :: Optional Id
    , sponsorLogin :: Optional String
    , sponsorableId :: Optional Id
    , sponsorableLogin :: Optional String
    , receiveEmails :: Optional Boolean
    , privacyLevel :: Optional SponsorshipPrivacy
    , clientMutationId :: Optional String
    }

derive instance genericUpdateSponsorshipPreferencesInput
  ::
  Generic UpdateSponsorshipPreferencesInput _

derive instance newtypeUpdateSponsorshipPreferencesInput
  ::
  Newtype UpdateSponsorshipPreferencesInput _

instance toGraphQLArgumentValueUpdateSponsorshipPreferencesInput
  :: ToGraphQLArgumentValue UpdateSponsorshipPreferencesInput where
  toGraphQLArgumentValue (UpdateSponsorshipPreferencesInput x) = toGraphQLArgumentValue
                                                                 x

-- | original name - UpdateSubscriptionInput
newtype UpdateSubscriptionInput
  = UpdateSubscriptionInput
    { subscribableId :: Id
    , state :: SubscriptionState
    , clientMutationId :: Optional String
    }

derive instance genericUpdateSubscriptionInput
  ::
  Generic UpdateSubscriptionInput _

derive instance newtypeUpdateSubscriptionInput
  ::
  Newtype UpdateSubscriptionInput _

instance toGraphQLArgumentValueUpdateSubscriptionInput
  :: ToGraphQLArgumentValue UpdateSubscriptionInput where
  toGraphQLArgumentValue (UpdateSubscriptionInput x) = toGraphQLArgumentValue x

-- | original name - UpdateTeamDiscussionCommentInput
newtype UpdateTeamDiscussionCommentInput
  = UpdateTeamDiscussionCommentInput
    { id :: Id
    , body :: String
    , bodyVersion :: Optional String
    , clientMutationId :: Optional String
    }

derive instance genericUpdateTeamDiscussionCommentInput
  ::
  Generic UpdateTeamDiscussionCommentInput _

derive instance newtypeUpdateTeamDiscussionCommentInput
  ::
  Newtype UpdateTeamDiscussionCommentInput _

instance toGraphQLArgumentValueUpdateTeamDiscussionCommentInput
  :: ToGraphQLArgumentValue UpdateTeamDiscussionCommentInput where
  toGraphQLArgumentValue (UpdateTeamDiscussionCommentInput x) = toGraphQLArgumentValue
                                                                x

-- | original name - UpdateTeamDiscussionInput
newtype UpdateTeamDiscussionInput
  = UpdateTeamDiscussionInput
    { id :: Id
    , title :: Optional String
    , body :: Optional String
    , bodyVersion :: Optional String
    , pinned :: Optional Boolean
    , clientMutationId :: Optional String
    }

derive instance genericUpdateTeamDiscussionInput
  ::
  Generic UpdateTeamDiscussionInput _

derive instance newtypeUpdateTeamDiscussionInput
  ::
  Newtype UpdateTeamDiscussionInput _

instance toGraphQLArgumentValueUpdateTeamDiscussionInput
  :: ToGraphQLArgumentValue UpdateTeamDiscussionInput where
  toGraphQLArgumentValue (UpdateTeamDiscussionInput x) = toGraphQLArgumentValue
                                                         x

-- | original name - UpdateTopicsInput
newtype UpdateTopicsInput
  = UpdateTopicsInput
    { repositoryId :: Id
    , topicNames :: Array String
    , clientMutationId :: Optional String
    }

derive instance genericUpdateTopicsInput :: Generic UpdateTopicsInput _

derive instance newtypeUpdateTopicsInput :: Newtype UpdateTopicsInput _

instance toGraphQLArgumentValueUpdateTopicsInput
  :: ToGraphQLArgumentValue UpdateTopicsInput where
  toGraphQLArgumentValue (UpdateTopicsInput x) = toGraphQLArgumentValue x

-- | original name - UserStatusOrder
newtype UserStatusOrder
  = UserStatusOrder
    { field :: UserStatusOrderField, direction :: OrderDirection }

derive instance genericUserStatusOrder :: Generic UserStatusOrder _

derive instance newtypeUserStatusOrder :: Newtype UserStatusOrder _

instance toGraphQLArgumentValueUserStatusOrder
  :: ToGraphQLArgumentValue UserStatusOrder where
  toGraphQLArgumentValue (UserStatusOrder x) = toGraphQLArgumentValue x

-- | original name - VerifiableDomainOrder
newtype VerifiableDomainOrder
  = VerifiableDomainOrder
    { field :: VerifiableDomainOrderField, direction :: OrderDirection }

derive instance genericVerifiableDomainOrder :: Generic VerifiableDomainOrder _

derive instance newtypeVerifiableDomainOrder :: Newtype VerifiableDomainOrder _

instance toGraphQLArgumentValueVerifiableDomainOrder
  :: ToGraphQLArgumentValue VerifiableDomainOrder where
  toGraphQLArgumentValue (VerifiableDomainOrder x) = toGraphQLArgumentValue x

-- | original name - VerifyVerifiableDomainInput
newtype VerifyVerifiableDomainInput
  = VerifyVerifiableDomainInput
    { id :: Id, clientMutationId :: Optional String }

derive instance genericVerifyVerifiableDomainInput
  ::
  Generic VerifyVerifiableDomainInput _

derive instance newtypeVerifyVerifiableDomainInput
  ::
  Newtype VerifyVerifiableDomainInput _

instance toGraphQLArgumentValueVerifyVerifiableDomainInput
  :: ToGraphQLArgumentValue VerifyVerifiableDomainInput where
  toGraphQLArgumentValue (VerifyVerifiableDomainInput x) = toGraphQLArgumentValue
                                                           x
