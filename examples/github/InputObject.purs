module Examples.Github.InputObject where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Github.Scopes
import Examples.Github.Scalars
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

-- | original name - AcceptEnterpriseAdministratorInvitationInput
type AcceptEnterpriseAdministratorInvitationInput = { invitationId :: Id
                                                    , clientMutationId :: Optional String
                                                    }

-- | original name - AcceptTopicSuggestionInput
type AcceptTopicSuggestionInput = { repositoryId :: Id
                                  , name :: String
                                  , clientMutationId :: Optional String
                                  }

-- | original name - AddAssigneesToAssignableInput
type AddAssigneesToAssignableInput = { assignableId :: Id
                                     , assigneeIds :: Array Id
                                     , clientMutationId :: Optional String
                                     }

-- | original name - AddCommentInput
type AddCommentInput = { subjectId :: Id
                       , body :: String
                       , clientMutationId :: Optional String
                       }

-- | original name - AddLabelsToLabelableInput
type AddLabelsToLabelableInput = { labelableId :: Id
                                 , labelIds :: Array Id
                                 , clientMutationId :: Optional String
                                 }

-- | original name - AddProjectCardInput
type AddProjectCardInput = { projectColumnId :: Id
                           , contentId :: Optional Id
                           , note :: Optional String
                           , clientMutationId :: Optional String
                           }

-- | original name - AddProjectColumnInput
type AddProjectColumnInput = { projectId :: Id
                             , name :: String
                             , clientMutationId :: Optional String
                             }

-- | original name - AddPullRequestReviewCommentInput
type AddPullRequestReviewCommentInput = { pullRequestId :: Optional Id
                                        , pullRequestReviewId :: Optional Id
                                        , commitOID :: Optional GitObjectId
                                        , body :: String
                                        , path :: Optional String
                                        , position :: Optional Int
                                        , inReplyTo :: Optional Id
                                        , clientMutationId :: Optional String
                                        }

-- | original name - AddPullRequestReviewInput
type AddPullRequestReviewInput = { pullRequestId :: Id
                                 , commitOID :: Optional GitObjectId
                                 , body :: Optional String
                                 , event :: Optional PullRequestReviewEvent
                                 , comments :: Array (Optional DraftPullRequestReviewComment)
                                 , threads :: Array (Optional DraftPullRequestReviewThread)
                                 , clientMutationId :: Optional String
                                 }

-- | original name - AddPullRequestReviewThreadInput
type AddPullRequestReviewThreadInput = { path :: String
                                       , body :: String
                                       , pullRequestReviewId :: Id
                                       , line :: Int
                                       , side :: Optional DiffSide
                                       , startLine :: Optional Int
                                       , startSide :: Optional DiffSide
                                       , clientMutationId :: Optional String
                                       }

-- | original name - AddReactionInput
type AddReactionInput = { subjectId :: Id
                        , content :: ReactionContent
                        , clientMutationId :: Optional String
                        }

-- | original name - AddStarInput
type AddStarInput = { starrableId :: Id
                    , clientMutationId :: Optional String
                    }

-- | original name - ArchiveRepositoryInput
type ArchiveRepositoryInput = { repositoryId :: Id
                              , clientMutationId :: Optional String
                              }

-- | original name - AuditLogOrder
type AuditLogOrder = { field :: Optional AuditLogOrderField
                     , direction :: Optional OrderDirection
                     }

-- | original name - CancelEnterpriseAdminInvitationInput
type CancelEnterpriseAdminInvitationInput = { invitationId :: Id
                                            , clientMutationId :: Optional String
                                            }

-- | original name - ChangeUserStatusInput
type ChangeUserStatusInput = { emoji :: Optional String
                             , message :: Optional String
                             , organizationId :: Optional Id
                             , limitedAvailability :: Optional Boolean
                             , expiresAt :: Optional DateTime
                             , clientMutationId :: Optional String
                             }

-- | original name - ClearLabelsFromLabelableInput
type ClearLabelsFromLabelableInput = { labelableId :: Id
                                     , clientMutationId :: Optional String
                                     }

-- | original name - CloneProjectInput
type CloneProjectInput = { targetOwnerId :: Id
                         , sourceId :: Id
                         , includeWorkflows :: Boolean
                         , name :: String
                         , body :: Optional String
                         , public :: Optional Boolean
                         , clientMutationId :: Optional String
                         }

-- | original name - CloneTemplateRepositoryInput
type CloneTemplateRepositoryInput = { repositoryId :: Id
                                    , name :: String
                                    , ownerId :: Id
                                    , description :: Optional String
                                    , visibility :: RepositoryVisibility
                                    , includeAllBranches :: Optional Boolean
                                    , clientMutationId :: Optional String
                                    }

-- | original name - CloseIssueInput
type CloseIssueInput = { issueId :: Id
                       , clientMutationId :: Optional String
                       }

-- | original name - ClosePullRequestInput
type ClosePullRequestInput = { pullRequestId :: Id
                             , clientMutationId :: Optional String
                             }

-- | original name - CommitAuthor
type CommitAuthor = { id :: Optional Id
                    , emails :: Array String
                    }

-- | original name - CommitContributionOrder
type CommitContributionOrder = { field :: CommitContributionOrderField
                               , direction :: OrderDirection
                               }

-- | original name - ContributionOrder
type ContributionOrder = { direction :: OrderDirection
                         }

-- | original name - ConvertProjectCardNoteToIssueInput
type ConvertProjectCardNoteToIssueInput = { projectCardId :: Id
                                          , repositoryId :: Id
                                          , title :: Optional String
                                          , body :: Optional String
                                          , clientMutationId :: Optional String
                                          }

-- | original name - CreateBranchProtectionRuleInput
type CreateBranchProtectionRuleInput = { repositoryId :: Id
                                       , pattern :: String
                                       , requiresApprovingReviews :: Optional Boolean
                                       , requiredApprovingReviewCount :: Optional Int
                                       , requiresCommitSignatures :: Optional Boolean
                                       , isAdminEnforced :: Optional Boolean
                                       , requiresStatusChecks :: Optional Boolean
                                       , requiresStrictStatusChecks :: Optional Boolean
                                       , requiresCodeOwnerReviews :: Optional Boolean
                                       , dismissesStaleReviews :: Optional Boolean
                                       , restrictsReviewDismissals :: Optional Boolean
                                       , reviewDismissalActorIds :: Array Id
                                       , restrictsPushes :: Optional Boolean
                                       , pushActorIds :: Array Id
                                       , requiredStatusCheckContexts :: Array String
                                       , clientMutationId :: Optional String
                                       }

-- | original name - CreateEnterpriseOrganizationInput
type CreateEnterpriseOrganizationInput = { enterpriseId :: Id
                                         , login :: String
                                         , profileName :: String
                                         , billingEmail :: String
                                         , adminLogins :: Array String
                                         , clientMutationId :: Optional String
                                         }

-- | original name - CreateIpAllowListEntryInput
type CreateIpAllowListEntryInput = { ownerId :: Id
                                   , allowListValue :: String
                                   , name :: Optional String
                                   , isActive :: Boolean
                                   , clientMutationId :: Optional String
                                   }

-- | original name - CreateIssueInput
type CreateIssueInput = { repositoryId :: Id
                        , title :: String
                        , body :: Optional String
                        , assigneeIds :: Array Id
                        , milestoneId :: Optional Id
                        , labelIds :: Array Id
                        , projectIds :: Array Id
                        , clientMutationId :: Optional String
                        }

-- | original name - CreateProjectInput
type CreateProjectInput = { ownerId :: Id
                          , name :: String
                          , body :: Optional String
                          , template :: Optional ProjectTemplate
                          , repositoryIds :: Array Id
                          , clientMutationId :: Optional String
                          }

-- | original name - CreatePullRequestInput
type CreatePullRequestInput = { repositoryId :: Id
                              , baseRefName :: String
                              , headRefName :: String
                              , title :: String
                              , body :: Optional String
                              , maintainerCanModify :: Optional Boolean
                              , draft :: Optional Boolean
                              , clientMutationId :: Optional String
                              }

-- | original name - CreateRefInput
type CreateRefInput = { repositoryId :: Id
                      , name :: String
                      , oid :: GitObjectId
                      , clientMutationId :: Optional String
                      }

-- | original name - CreateRepositoryInput
type CreateRepositoryInput = { name :: String
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

-- | original name - CreateTeamDiscussionCommentInput
type CreateTeamDiscussionCommentInput = { discussionId :: Id
                                        , body :: String
                                        , clientMutationId :: Optional String
                                        }

-- | original name - CreateTeamDiscussionInput
type CreateTeamDiscussionInput = { teamId :: Id
                                 , title :: String
                                 , body :: String
                                 , private :: Optional Boolean
                                 , clientMutationId :: Optional String
                                 }

-- | original name - DeclineTopicSuggestionInput
type DeclineTopicSuggestionInput = { repositoryId :: Id
                                   , name :: String
                                   , reason :: TopicSuggestionDeclineReason
                                   , clientMutationId :: Optional String
                                   }

-- | original name - DeleteBranchProtectionRuleInput
type DeleteBranchProtectionRuleInput = { branchProtectionRuleId :: Id
                                       , clientMutationId :: Optional String
                                       }

-- | original name - DeleteDeploymentInput
type DeleteDeploymentInput = { id :: Id
                             , clientMutationId :: Optional String
                             }

-- | original name - DeleteIpAllowListEntryInput
type DeleteIpAllowListEntryInput = { ipAllowListEntryId :: Id
                                   , clientMutationId :: Optional String
                                   }

-- | original name - DeleteIssueCommentInput
type DeleteIssueCommentInput = { id :: Id
                               , clientMutationId :: Optional String
                               }

-- | original name - DeleteIssueInput
type DeleteIssueInput = { issueId :: Id
                        , clientMutationId :: Optional String
                        }

-- | original name - DeleteProjectCardInput
type DeleteProjectCardInput = { cardId :: Id
                              , clientMutationId :: Optional String
                              }

-- | original name - DeleteProjectColumnInput
type DeleteProjectColumnInput = { columnId :: Id
                                , clientMutationId :: Optional String
                                }

-- | original name - DeleteProjectInput
type DeleteProjectInput = { projectId :: Id
                          , clientMutationId :: Optional String
                          }

-- | original name - DeletePullRequestReviewCommentInput
type DeletePullRequestReviewCommentInput = { id :: Id
                                           , clientMutationId :: Optional String
                                           }

-- | original name - DeletePullRequestReviewInput
type DeletePullRequestReviewInput = { pullRequestReviewId :: Id
                                    , clientMutationId :: Optional String
                                    }

-- | original name - DeleteRefInput
type DeleteRefInput = { refId :: Id
                      , clientMutationId :: Optional String
                      }

-- | original name - DeleteTeamDiscussionCommentInput
type DeleteTeamDiscussionCommentInput = { id :: Id
                                        , clientMutationId :: Optional String
                                        }

-- | original name - DeleteTeamDiscussionInput
type DeleteTeamDiscussionInput = { id :: Id
                                 , clientMutationId :: Optional String
                                 }

-- | original name - DeploymentOrder
type DeploymentOrder = { field :: DeploymentOrderField
                       , direction :: OrderDirection
                       }

-- | original name - DismissPullRequestReviewInput
type DismissPullRequestReviewInput = { pullRequestReviewId :: Id
                                     , message :: String
                                     , clientMutationId :: Optional String
                                     }

-- | original name - DraftPullRequestReviewComment
type DraftPullRequestReviewComment = { path :: String
                                     , position :: Int
                                     , body :: String
                                     }

-- | original name - DraftPullRequestReviewThread
type DraftPullRequestReviewThread = { path :: String
                                    , line :: Int
                                    , side :: Optional DiffSide
                                    , startLine :: Optional Int
                                    , startSide :: Optional DiffSide
                                    , body :: String
                                    }

-- | original name - EnterpriseAdministratorInvitationOrder
type EnterpriseAdministratorInvitationOrder = { field :: EnterpriseAdministratorInvitationOrderField
                                              , direction :: OrderDirection
                                              }

-- | original name - EnterpriseMemberOrder
type EnterpriseMemberOrder = { field :: EnterpriseMemberOrderField
                             , direction :: OrderDirection
                             }

-- | original name - EnterpriseServerInstallationOrder
type EnterpriseServerInstallationOrder = { field :: EnterpriseServerInstallationOrderField
                                         , direction :: OrderDirection
                                         }

-- | original name - EnterpriseServerUserAccountEmailOrder
type EnterpriseServerUserAccountEmailOrder = { field :: EnterpriseServerUserAccountEmailOrderField
                                             , direction :: OrderDirection
                                             }

-- | original name - EnterpriseServerUserAccountOrder
type EnterpriseServerUserAccountOrder = { field :: EnterpriseServerUserAccountOrderField
                                        , direction :: OrderDirection
                                        }

-- | original name - EnterpriseServerUserAccountsUploadOrder
type EnterpriseServerUserAccountsUploadOrder = { field :: EnterpriseServerUserAccountsUploadOrderField
                                               , direction :: OrderDirection
                                               }

-- | original name - FollowUserInput
type FollowUserInput = { userId :: Id
                       , clientMutationId :: Optional String
                       }

-- | original name - GistOrder
type GistOrder = { field :: GistOrderField
                 , direction :: OrderDirection
                 }

-- | original name - InviteEnterpriseAdminInput
type InviteEnterpriseAdminInput = { enterpriseId :: Id
                                  , invitee :: Optional String
                                  , email :: Optional String
                                  , role :: Optional EnterpriseAdministratorRole
                                  , clientMutationId :: Optional String
                                  }

-- | original name - IpAllowListEntryOrder
type IpAllowListEntryOrder = { field :: IpAllowListEntryOrderField
                             , direction :: OrderDirection
                             }

-- | original name - IssueFilters
type IssueFilters = { assignee :: Optional String
                    , createdBy :: Optional String
                    , labels :: Array String
                    , mentioned :: Optional String
                    , milestone :: Optional String
                    , since :: Optional DateTime
                    , states :: Array IssueState
                    , viewerSubscribed :: Optional Boolean
                    }

-- | original name - IssueOrder
type IssueOrder = { field :: IssueOrderField
                  , direction :: OrderDirection
                  }

-- | original name - LabelOrder
type LabelOrder = { field :: LabelOrderField
                  , direction :: OrderDirection
                  }

-- | original name - LanguageOrder
type LanguageOrder = { field :: LanguageOrderField
                     , direction :: OrderDirection
                     }

-- | original name - LinkRepositoryToProjectInput
type LinkRepositoryToProjectInput = { projectId :: Id
                                    , repositoryId :: Id
                                    , clientMutationId :: Optional String
                                    }

-- | original name - LockLockableInput
type LockLockableInput = { lockableId :: Id
                         , lockReason :: Optional LockReason
                         , clientMutationId :: Optional String
                         }

-- | original name - MarkPullRequestReadyForReviewInput
type MarkPullRequestReadyForReviewInput = { pullRequestId :: Id
                                          , clientMutationId :: Optional String
                                          }

-- | original name - MergeBranchInput
type MergeBranchInput = { repositoryId :: Id
                        , base :: String
                        , head :: String
                        , commitMessage :: Optional String
                        , clientMutationId :: Optional String
                        }

-- | original name - MergePullRequestInput
type MergePullRequestInput = { pullRequestId :: Id
                             , commitHeadline :: Optional String
                             , commitBody :: Optional String
                             , expectedHeadOid :: Optional GitObjectId
                             , mergeMethod :: Optional PullRequestMergeMethod
                             , clientMutationId :: Optional String
                             }

-- | original name - MilestoneOrder
type MilestoneOrder = { field :: MilestoneOrderField
                      , direction :: OrderDirection
                      }

-- | original name - MinimizeCommentInput
type MinimizeCommentInput = { subjectId :: Id
                            , classifier :: ReportedContentClassifiers
                            , clientMutationId :: Optional String
                            }

-- | original name - MoveProjectCardInput
type MoveProjectCardInput = { cardId :: Id
                            , columnId :: Id
                            , afterCardId :: Optional Id
                            , clientMutationId :: Optional String
                            }

-- | original name - MoveProjectColumnInput
type MoveProjectColumnInput = { columnId :: Id
                              , afterColumnId :: Optional Id
                              , clientMutationId :: Optional String
                              }

-- | original name - OrganizationOrder
type OrganizationOrder = { field :: OrganizationOrderField
                         , direction :: OrderDirection
                         }

-- | original name - PackageFileOrder
type PackageFileOrder = { field :: Optional PackageFileOrderField
                        , direction :: Optional OrderDirection
                        }

-- | original name - PackageOrder
type PackageOrder = { field :: Optional PackageOrderField
                    , direction :: Optional OrderDirection
                    }

-- | original name - PackageVersionOrder
type PackageVersionOrder = { field :: Optional PackageVersionOrderField
                           , direction :: Optional OrderDirection
                           }

-- | original name - ProjectOrder
type ProjectOrder = { field :: ProjectOrderField
                    , direction :: OrderDirection
                    }

-- | original name - PullRequestOrder
type PullRequestOrder = { field :: PullRequestOrderField
                        , direction :: OrderDirection
                        }

-- | original name - ReactionOrder
type ReactionOrder = { field :: ReactionOrderField
                     , direction :: OrderDirection
                     }

-- | original name - RefOrder
type RefOrder = { field :: RefOrderField
                , direction :: OrderDirection
                }

-- | original name - RegenerateEnterpriseIdentityProviderRecoveryCodesInput
type RegenerateEnterpriseIdentityProviderRecoveryCodesInput = { enterpriseId :: Id
                                                              , clientMutationId :: Optional String
                                                              }

-- | original name - ReleaseOrder
type ReleaseOrder = { field :: ReleaseOrderField
                    , direction :: OrderDirection
                    }

-- | original name - RemoveAssigneesFromAssignableInput
type RemoveAssigneesFromAssignableInput = { assignableId :: Id
                                          , assigneeIds :: Array Id
                                          , clientMutationId :: Optional String
                                          }

-- | original name - RemoveEnterpriseAdminInput
type RemoveEnterpriseAdminInput = { enterpriseId :: Id
                                  , login :: String
                                  , clientMutationId :: Optional String
                                  }

-- | original name - RemoveEnterpriseIdentityProviderInput
type RemoveEnterpriseIdentityProviderInput = { enterpriseId :: Id
                                             , clientMutationId :: Optional String
                                             }

-- | original name - RemoveEnterpriseOrganizationInput
type RemoveEnterpriseOrganizationInput = { enterpriseId :: Id
                                         , organizationId :: Id
                                         , clientMutationId :: Optional String
                                         }

-- | original name - RemoveLabelsFromLabelableInput
type RemoveLabelsFromLabelableInput = { labelableId :: Id
                                      , labelIds :: Array Id
                                      , clientMutationId :: Optional String
                                      }

-- | original name - RemoveOutsideCollaboratorInput
type RemoveOutsideCollaboratorInput = { userId :: Id
                                      , organizationId :: Id
                                      , clientMutationId :: Optional String
                                      }

-- | original name - RemoveReactionInput
type RemoveReactionInput = { subjectId :: Id
                           , content :: ReactionContent
                           , clientMutationId :: Optional String
                           }

-- | original name - RemoveStarInput
type RemoveStarInput = { starrableId :: Id
                       , clientMutationId :: Optional String
                       }

-- | original name - ReopenIssueInput
type ReopenIssueInput = { issueId :: Id
                        , clientMutationId :: Optional String
                        }

-- | original name - ReopenPullRequestInput
type ReopenPullRequestInput = { pullRequestId :: Id
                              , clientMutationId :: Optional String
                              }

-- | original name - RepositoryInvitationOrder
type RepositoryInvitationOrder = { field :: RepositoryInvitationOrderField
                                 , direction :: OrderDirection
                                 }

-- | original name - RepositoryOrder
type RepositoryOrder = { field :: RepositoryOrderField
                       , direction :: OrderDirection
                       }

-- | original name - RequestReviewsInput
type RequestReviewsInput = { pullRequestId :: Id
                           , userIds :: Array Id
                           , teamIds :: Array Id
                           , union :: Optional Boolean
                           , clientMutationId :: Optional String
                           }

-- | original name - ResolveReviewThreadInput
type ResolveReviewThreadInput = { threadId :: Id
                                , clientMutationId :: Optional String
                                }

-- | original name - SavedReplyOrder
type SavedReplyOrder = { field :: SavedReplyOrderField
                       , direction :: OrderDirection
                       }

-- | original name - SecurityAdvisoryIdentifierFilter
type SecurityAdvisoryIdentifierFilter = { type_ :: SecurityAdvisoryIdentifierType
                                        , value :: String
                                        }

-- | original name - SecurityAdvisoryOrder
type SecurityAdvisoryOrder = { field :: SecurityAdvisoryOrderField
                             , direction :: OrderDirection
                             }

-- | original name - SecurityVulnerabilityOrder
type SecurityVulnerabilityOrder = { field :: SecurityVulnerabilityOrderField
                                  , direction :: OrderDirection
                                  }

-- | original name - SetEnterpriseIdentityProviderInput
type SetEnterpriseIdentityProviderInput = { enterpriseId :: Id
                                          , ssoUrl :: Uri
                                          , issuer :: Optional String
                                          , idpCertificate :: String
                                          , signatureMethod :: SamlSignatureAlgorithm
                                          , digestMethod :: SamlDigestAlgorithm
                                          , clientMutationId :: Optional String
                                          }

-- | original name - SponsorsTierOrder
type SponsorsTierOrder = { field :: SponsorsTierOrderField
                         , direction :: OrderDirection
                         }

-- | original name - SponsorshipOrder
type SponsorshipOrder = { field :: SponsorshipOrderField
                        , direction :: OrderDirection
                        }

-- | original name - StarOrder
type StarOrder = { field :: StarOrderField
                 , direction :: OrderDirection
                 }

-- | original name - SubmitPullRequestReviewInput
type SubmitPullRequestReviewInput = { pullRequestId :: Optional Id
                                    , pullRequestReviewId :: Optional Id
                                    , event :: PullRequestReviewEvent
                                    , body :: Optional String
                                    , clientMutationId :: Optional String
                                    }

-- | original name - TeamDiscussionCommentOrder
type TeamDiscussionCommentOrder = { field :: TeamDiscussionCommentOrderField
                                  , direction :: OrderDirection
                                  }

-- | original name - TeamDiscussionOrder
type TeamDiscussionOrder = { field :: TeamDiscussionOrderField
                           , direction :: OrderDirection
                           }

-- | original name - TeamMemberOrder
type TeamMemberOrder = { field :: TeamMemberOrderField
                       , direction :: OrderDirection
                       }

-- | original name - TeamOrder
type TeamOrder = { field :: TeamOrderField
                 , direction :: OrderDirection
                 }

-- | original name - TeamRepositoryOrder
type TeamRepositoryOrder = { field :: TeamRepositoryOrderField
                           , direction :: OrderDirection
                           }

-- | original name - TransferIssueInput
type TransferIssueInput = { issueId :: Id
                          , repositoryId :: Id
                          , clientMutationId :: Optional String
                          }

-- | original name - UnarchiveRepositoryInput
type UnarchiveRepositoryInput = { repositoryId :: Id
                                , clientMutationId :: Optional String
                                }

-- | original name - UnfollowUserInput
type UnfollowUserInput = { userId :: Id
                         , clientMutationId :: Optional String
                         }

-- | original name - UnlinkRepositoryFromProjectInput
type UnlinkRepositoryFromProjectInput = { projectId :: Id
                                        , repositoryId :: Id
                                        , clientMutationId :: Optional String
                                        }

-- | original name - UnlockLockableInput
type UnlockLockableInput = { lockableId :: Id
                           , clientMutationId :: Optional String
                           }

-- | original name - UnmarkIssueAsDuplicateInput
type UnmarkIssueAsDuplicateInput = { duplicateId :: Id
                                   , canonicalId :: Id
                                   , clientMutationId :: Optional String
                                   }

-- | original name - UnminimizeCommentInput
type UnminimizeCommentInput = { subjectId :: Id
                              , clientMutationId :: Optional String
                              }

-- | original name - UnresolveReviewThreadInput
type UnresolveReviewThreadInput = { threadId :: Id
                                  , clientMutationId :: Optional String
                                  }

-- | original name - UpdateBranchProtectionRuleInput
type UpdateBranchProtectionRuleInput = { branchProtectionRuleId :: Id
                                       , pattern :: Optional String
                                       , requiresApprovingReviews :: Optional Boolean
                                       , requiredApprovingReviewCount :: Optional Int
                                       , requiresCommitSignatures :: Optional Boolean
                                       , isAdminEnforced :: Optional Boolean
                                       , requiresStatusChecks :: Optional Boolean
                                       , requiresStrictStatusChecks :: Optional Boolean
                                       , requiresCodeOwnerReviews :: Optional Boolean
                                       , dismissesStaleReviews :: Optional Boolean
                                       , restrictsReviewDismissals :: Optional Boolean
                                       , reviewDismissalActorIds :: Array Id
                                       , restrictsPushes :: Optional Boolean
                                       , pushActorIds :: Array Id
                                       , requiredStatusCheckContexts :: Array String
                                       , clientMutationId :: Optional String
                                       }

-- | original name - UpdateEnterpriseActionExecutionCapabilitySettingInput
type UpdateEnterpriseActionExecutionCapabilitySettingInput = { enterpriseId :: Id
                                                             , capability :: ActionExecutionCapabilitySetting
                                                             , clientMutationId :: Optional String
                                                             }

-- | original name - UpdateEnterpriseAdministratorRoleInput
type UpdateEnterpriseAdministratorRoleInput = { enterpriseId :: Id
                                              , login :: String
                                              , role :: EnterpriseAdministratorRole
                                              , clientMutationId :: Optional String
                                              }

-- | original name - UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
type UpdateEnterpriseAllowPrivateRepositoryForkingSettingInput = { enterpriseId :: Id
                                                                 , settingValue :: EnterpriseEnabledDisabledSettingValue
                                                                 , clientMutationId :: Optional String
                                                                 }

-- | original name - UpdateEnterpriseDefaultRepositoryPermissionSettingInput
type UpdateEnterpriseDefaultRepositoryPermissionSettingInput = { enterpriseId :: Id
                                                               , settingValue :: EnterpriseDefaultRepositoryPermissionSettingValue
                                                               , clientMutationId :: Optional String
                                                               }

-- | original name - UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
type UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput = { enterpriseId :: Id
                                                                        , settingValue :: EnterpriseEnabledDisabledSettingValue
                                                                        , clientMutationId :: Optional String
                                                                        }

-- | original name - UpdateEnterpriseMembersCanCreateRepositoriesSettingInput
type UpdateEnterpriseMembersCanCreateRepositoriesSettingInput = { enterpriseId :: Id
                                                                , settingValue :: Optional EnterpriseMembersCanCreateRepositoriesSettingValue
                                                                , membersCanCreateRepositoriesPolicyEnabled :: Optional Boolean
                                                                , membersCanCreatePublicRepositories :: Optional Boolean
                                                                , membersCanCreatePrivateRepositories :: Optional Boolean
                                                                , membersCanCreateInternalRepositories :: Optional Boolean
                                                                , clientMutationId :: Optional String
                                                                }

-- | original name - UpdateEnterpriseMembersCanDeleteIssuesSettingInput
type UpdateEnterpriseMembersCanDeleteIssuesSettingInput = { enterpriseId :: Id
                                                          , settingValue :: EnterpriseEnabledDisabledSettingValue
                                                          , clientMutationId :: Optional String
                                                          }

-- | original name - UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
type UpdateEnterpriseMembersCanDeleteRepositoriesSettingInput = { enterpriseId :: Id
                                                                , settingValue :: EnterpriseEnabledDisabledSettingValue
                                                                , clientMutationId :: Optional String
                                                                }

-- | original name - UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
type UpdateEnterpriseMembersCanInviteCollaboratorsSettingInput = { enterpriseId :: Id
                                                                 , settingValue :: EnterpriseEnabledDisabledSettingValue
                                                                 , clientMutationId :: Optional String
                                                                 }

-- | original name - UpdateEnterpriseMembersCanMakePurchasesSettingInput
type UpdateEnterpriseMembersCanMakePurchasesSettingInput = { enterpriseId :: Id
                                                           , settingValue :: EnterpriseMembersCanMakePurchasesSettingValue
                                                           , clientMutationId :: Optional String
                                                           }

-- | original name - UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
type UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput = { enterpriseId :: Id
                                                                     , settingValue :: EnterpriseEnabledDisabledSettingValue
                                                                     , clientMutationId :: Optional String
                                                                     }

-- | original name - UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
type UpdateEnterpriseMembersCanViewDependencyInsightsSettingInput = { enterpriseId :: Id
                                                                    , settingValue :: EnterpriseEnabledDisabledSettingValue
                                                                    , clientMutationId :: Optional String
                                                                    }

-- | original name - UpdateEnterpriseOrganizationProjectsSettingInput
type UpdateEnterpriseOrganizationProjectsSettingInput = { enterpriseId :: Id
                                                        , settingValue :: EnterpriseEnabledDisabledSettingValue
                                                        , clientMutationId :: Optional String
                                                        }

-- | original name - UpdateEnterpriseProfileInput
type UpdateEnterpriseProfileInput = { enterpriseId :: Id
                                    , name :: Optional String
                                    , description :: Optional String
                                    , websiteUrl :: Optional String
                                    , location :: Optional String
                                    , clientMutationId :: Optional String
                                    }

-- | original name - UpdateEnterpriseRepositoryProjectsSettingInput
type UpdateEnterpriseRepositoryProjectsSettingInput = { enterpriseId :: Id
                                                      , settingValue :: EnterpriseEnabledDisabledSettingValue
                                                      , clientMutationId :: Optional String
                                                      }

-- | original name - UpdateEnterpriseTeamDiscussionsSettingInput
type UpdateEnterpriseTeamDiscussionsSettingInput = { enterpriseId :: Id
                                                   , settingValue :: EnterpriseEnabledDisabledSettingValue
                                                   , clientMutationId :: Optional String
                                                   }

-- | original name - UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
type UpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput = { enterpriseId :: Id
                                                                   , settingValue :: EnterpriseEnabledSettingValue
                                                                   , clientMutationId :: Optional String
                                                                   }

-- | original name - UpdateIpAllowListEnabledSettingInput
type UpdateIpAllowListEnabledSettingInput = { ownerId :: Id
                                            , settingValue :: IpAllowListEnabledSettingValue
                                            , clientMutationId :: Optional String
                                            }

-- | original name - UpdateIpAllowListEntryInput
type UpdateIpAllowListEntryInput = { ipAllowListEntryId :: Id
                                   , allowListValue :: String
                                   , name :: Optional String
                                   , isActive :: Boolean
                                   , clientMutationId :: Optional String
                                   }

-- | original name - UpdateIssueCommentInput
type UpdateIssueCommentInput = { id :: Id
                               , body :: String
                               , clientMutationId :: Optional String
                               }

-- | original name - UpdateIssueInput
type UpdateIssueInput = { id :: Id
                        , title :: Optional String
                        , body :: Optional String
                        , assigneeIds :: Array Id
                        , milestoneId :: Optional Id
                        , labelIds :: Array Id
                        , state :: Optional IssueState
                        , projectIds :: Array Id
                        , clientMutationId :: Optional String
                        }

-- | original name - UpdateProjectCardInput
type UpdateProjectCardInput = { projectCardId :: Id
                              , isArchived :: Optional Boolean
                              , note :: Optional String
                              , clientMutationId :: Optional String
                              }

-- | original name - UpdateProjectColumnInput
type UpdateProjectColumnInput = { projectColumnId :: Id
                                , name :: String
                                , clientMutationId :: Optional String
                                }

-- | original name - UpdateProjectInput
type UpdateProjectInput = { projectId :: Id
                          , name :: Optional String
                          , body :: Optional String
                          , state :: Optional ProjectState
                          , public :: Optional Boolean
                          , clientMutationId :: Optional String
                          }

-- | original name - UpdatePullRequestInput
type UpdatePullRequestInput = { pullRequestId :: Id
                              , baseRefName :: Optional String
                              , title :: Optional String
                              , body :: Optional String
                              , state :: Optional PullRequestUpdateState
                              , maintainerCanModify :: Optional Boolean
                              , assigneeIds :: Array Id
                              , milestoneId :: Optional Id
                              , labelIds :: Array Id
                              , projectIds :: Array Id
                              , clientMutationId :: Optional String
                              }

-- | original name - UpdatePullRequestReviewCommentInput
type UpdatePullRequestReviewCommentInput = { pullRequestReviewCommentId :: Id
                                           , body :: String
                                           , clientMutationId :: Optional String
                                           }

-- | original name - UpdatePullRequestReviewInput
type UpdatePullRequestReviewInput = { pullRequestReviewId :: Id
                                    , body :: String
                                    , clientMutationId :: Optional String
                                    }

-- | original name - UpdateRefInput
type UpdateRefInput = { refId :: Id
                      , oid :: GitObjectId
                      , force :: Optional Boolean
                      , clientMutationId :: Optional String
                      }

-- | original name - UpdateRepositoryInput
type UpdateRepositoryInput = { repositoryId :: Id
                             , name :: Optional String
                             , description :: Optional String
                             , template :: Optional Boolean
                             , homepageUrl :: Optional Uri
                             , hasWikiEnabled :: Optional Boolean
                             , hasIssuesEnabled :: Optional Boolean
                             , hasProjectsEnabled :: Optional Boolean
                             , clientMutationId :: Optional String
                             }

-- | original name - UpdateSubscriptionInput
type UpdateSubscriptionInput = { subscribableId :: Id
                               , state :: SubscriptionState
                               , clientMutationId :: Optional String
                               }

-- | original name - UpdateTeamDiscussionCommentInput
type UpdateTeamDiscussionCommentInput = { id :: Id
                                        , body :: String
                                        , bodyVersion :: Optional String
                                        , clientMutationId :: Optional String
                                        }

-- | original name - UpdateTeamDiscussionInput
type UpdateTeamDiscussionInput = { id :: Id
                                 , title :: Optional String
                                 , body :: Optional String
                                 , bodyVersion :: Optional String
                                 , pinned :: Optional Boolean
                                 , clientMutationId :: Optional String
                                 }

-- | original name - UpdateTopicsInput
type UpdateTopicsInput = { repositoryId :: Id
                         , topicNames :: Array String
                         , clientMutationId :: Optional String
                         }

-- | original name - UserStatusOrder
type UserStatusOrder = { field :: UserStatusOrderField
                       , direction :: OrderDirection
                       }
