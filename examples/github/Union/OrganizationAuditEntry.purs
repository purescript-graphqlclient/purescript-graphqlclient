module Examples.Github.Union.OrganizationAuditEntry where

import GraphqlClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  ( Scope__MembersCanDeleteReposClearAuditEntry
  , Scope__MembersCanDeleteReposDisableAuditEntry
  , Scope__MembersCanDeleteReposEnableAuditEntry
  , Scope__OauthApplicationCreateAuditEntry
  , Scope__OrgAddBillingManagerAuditEntry
  , Scope__OrgAddMemberAuditEntry
  , Scope__OrgBlockUserAuditEntry
  , Scope__OrgConfigDisableCollaboratorsOnlyAuditEntry
  , Scope__OrgConfigEnableCollaboratorsOnlyAuditEntry
  , Scope__OrgCreateAuditEntry
  , Scope__OrgDisableOauthAppRestrictionsAuditEntry
  , Scope__OrgDisableSamlAuditEntry
  , Scope__OrgDisableTwoFactorRequirementAuditEntry
  , Scope__OrgEnableOauthAppRestrictionsAuditEntry
  , Scope__OrgEnableSamlAuditEntry
  , Scope__OrgEnableTwoFactorRequirementAuditEntry
  , Scope__OrgInviteMemberAuditEntry
  , Scope__OrgInviteToBusinessAuditEntry
  , Scope__OrgOauthAppAccessApprovedAuditEntry
  , Scope__OrgOauthAppAccessDeniedAuditEntry
  , Scope__OrgOauthAppAccessRequestedAuditEntry
  , Scope__OrgRemoveBillingManagerAuditEntry
  , Scope__OrgRemoveMemberAuditEntry
  , Scope__OrgRemoveOutsideCollaboratorAuditEntry
  , Scope__OrgRestoreMemberAuditEntry
  , Scope__OrgUnblockUserAuditEntry
  , Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
  , Scope__OrgUpdateMemberAuditEntry
  , Scope__OrgUpdateMemberRepositoryCreationPermissionAuditEntry
  , Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
  , Scope__PrivateRepositoryForkingDisableAuditEntry
  , Scope__PrivateRepositoryForkingEnableAuditEntry
  , Scope__RepoAccessAuditEntry
  , Scope__RepoAddMemberAuditEntry
  , Scope__RepoAddTopicAuditEntry
  , Scope__RepoArchivedAuditEntry
  , Scope__RepoChangeMergeSettingAuditEntry
  , Scope__RepoConfigDisableAnonymousGitAccessAuditEntry
  , Scope__RepoConfigDisableCollaboratorsOnlyAuditEntry
  , Scope__RepoConfigDisableContributorsOnlyAuditEntry
  , Scope__RepoConfigDisableSockpuppetDisallowedAuditEntry
  , Scope__RepoConfigEnableAnonymousGitAccessAuditEntry
  , Scope__RepoConfigEnableCollaboratorsOnlyAuditEntry
  , Scope__RepoConfigEnableContributorsOnlyAuditEntry
  , Scope__RepoConfigEnableSockpuppetDisallowedAuditEntry
  , Scope__RepoConfigLockAnonymousGitAccessAuditEntry
  , Scope__RepoConfigUnlockAnonymousGitAccessAuditEntry
  , Scope__RepoCreateAuditEntry
  , Scope__RepoDestroyAuditEntry
  , Scope__RepoRemoveMemberAuditEntry
  , Scope__RepoRemoveTopicAuditEntry
  , Scope__RepositoryVisibilityChangeDisableAuditEntry
  , Scope__RepositoryVisibilityChangeEnableAuditEntry
  , Scope__TeamAddMemberAuditEntry
  , Scope__TeamAddRepositoryAuditEntry
  , Scope__TeamChangeParentTeamAuditEntry
  , Scope__TeamRemoveMemberAuditEntry
  , Scope__TeamRemoveRepositoryAuditEntry
  , Scope__OrganizationAuditEntry
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo = { onMembersCanDeleteReposClearAuditEntry :: SelectionSet
                                                                       Scope__MembersCanDeleteReposClearAuditEntry
                                                                       decodesTo
                           , onMembersCanDeleteReposDisableAuditEntry :: SelectionSet
                                                                         Scope__MembersCanDeleteReposDisableAuditEntry
                                                                         decodesTo
                           , onMembersCanDeleteReposEnableAuditEntry :: SelectionSet
                                                                        Scope__MembersCanDeleteReposEnableAuditEntry
                                                                        decodesTo
                           , onOauthApplicationCreateAuditEntry :: SelectionSet
                                                                   Scope__OauthApplicationCreateAuditEntry
                                                                   decodesTo
                           , onOrgAddBillingManagerAuditEntry :: SelectionSet
                                                                 Scope__OrgAddBillingManagerAuditEntry
                                                                 decodesTo
                           , onOrgAddMemberAuditEntry :: SelectionSet
                                                         Scope__OrgAddMemberAuditEntry
                                                         decodesTo
                           , onOrgBlockUserAuditEntry :: SelectionSet
                                                         Scope__OrgBlockUserAuditEntry
                                                         decodesTo
                           , onOrgConfigDisableCollaboratorsOnlyAuditEntry :: SelectionSet
                                                                              Scope__OrgConfigDisableCollaboratorsOnlyAuditEntry
                                                                              decodesTo
                           , onOrgConfigEnableCollaboratorsOnlyAuditEntry :: SelectionSet
                                                                             Scope__OrgConfigEnableCollaboratorsOnlyAuditEntry
                                                                             decodesTo
                           , onOrgCreateAuditEntry :: SelectionSet
                                                      Scope__OrgCreateAuditEntry
                                                      decodesTo
                           , onOrgDisableOauthAppRestrictionsAuditEntry :: SelectionSet
                                                                           Scope__OrgDisableOauthAppRestrictionsAuditEntry
                                                                           decodesTo
                           , onOrgDisableSamlAuditEntry :: SelectionSet
                                                           Scope__OrgDisableSamlAuditEntry
                                                           decodesTo
                           , onOrgDisableTwoFactorRequirementAuditEntry :: SelectionSet
                                                                           Scope__OrgDisableTwoFactorRequirementAuditEntry
                                                                           decodesTo
                           , onOrgEnableOauthAppRestrictionsAuditEntry :: SelectionSet
                                                                          Scope__OrgEnableOauthAppRestrictionsAuditEntry
                                                                          decodesTo
                           , onOrgEnableSamlAuditEntry :: SelectionSet
                                                          Scope__OrgEnableSamlAuditEntry
                                                          decodesTo
                           , onOrgEnableTwoFactorRequirementAuditEntry :: SelectionSet
                                                                          Scope__OrgEnableTwoFactorRequirementAuditEntry
                                                                          decodesTo
                           , onOrgInviteMemberAuditEntry :: SelectionSet
                                                            Scope__OrgInviteMemberAuditEntry
                                                            decodesTo
                           , onOrgInviteToBusinessAuditEntry :: SelectionSet
                                                                Scope__OrgInviteToBusinessAuditEntry
                                                                decodesTo
                           , onOrgOauthAppAccessApprovedAuditEntry :: SelectionSet
                                                                      Scope__OrgOauthAppAccessApprovedAuditEntry
                                                                      decodesTo
                           , onOrgOauthAppAccessDeniedAuditEntry :: SelectionSet
                                                                    Scope__OrgOauthAppAccessDeniedAuditEntry
                                                                    decodesTo
                           , onOrgOauthAppAccessRequestedAuditEntry :: SelectionSet
                                                                       Scope__OrgOauthAppAccessRequestedAuditEntry
                                                                       decodesTo
                           , onOrgRemoveBillingManagerAuditEntry :: SelectionSet
                                                                    Scope__OrgRemoveBillingManagerAuditEntry
                                                                    decodesTo
                           , onOrgRemoveMemberAuditEntry :: SelectionSet
                                                            Scope__OrgRemoveMemberAuditEntry
                                                            decodesTo
                           , onOrgRemoveOutsideCollaboratorAuditEntry :: SelectionSet
                                                                         Scope__OrgRemoveOutsideCollaboratorAuditEntry
                                                                         decodesTo
                           , onOrgRestoreMemberAuditEntry :: SelectionSet
                                                             Scope__OrgRestoreMemberAuditEntry
                                                             decodesTo
                           , onOrgUnblockUserAuditEntry :: SelectionSet
                                                           Scope__OrgUnblockUserAuditEntry
                                                           decodesTo
                           , onOrgUpdateDefaultRepositoryPermissionAuditEntry :: SelectionSet
                                                                                 Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
                                                                                 decodesTo
                           , onOrgUpdateMemberAuditEntry :: SelectionSet
                                                            Scope__OrgUpdateMemberAuditEntry
                                                            decodesTo
                           , onOrgUpdateMemberRepositoryCreationPermissionAuditEntry :: SelectionSet
                                                                                        Scope__OrgUpdateMemberRepositoryCreationPermissionAuditEntry
                                                                                        decodesTo
                           , onOrgUpdateMemberRepositoryInvitationPermissionAuditEntry :: SelectionSet
                                                                                          Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
                                                                                          decodesTo
                           , onPrivateRepositoryForkingDisableAuditEntry :: SelectionSet
                                                                            Scope__PrivateRepositoryForkingDisableAuditEntry
                                                                            decodesTo
                           , onPrivateRepositoryForkingEnableAuditEntry :: SelectionSet
                                                                           Scope__PrivateRepositoryForkingEnableAuditEntry
                                                                           decodesTo
                           , onRepoAccessAuditEntry :: SelectionSet
                                                       Scope__RepoAccessAuditEntry
                                                       decodesTo
                           , onRepoAddMemberAuditEntry :: SelectionSet
                                                          Scope__RepoAddMemberAuditEntry
                                                          decodesTo
                           , onRepoAddTopicAuditEntry :: SelectionSet
                                                         Scope__RepoAddTopicAuditEntry
                                                         decodesTo
                           , onRepoArchivedAuditEntry :: SelectionSet
                                                         Scope__RepoArchivedAuditEntry
                                                         decodesTo
                           , onRepoChangeMergeSettingAuditEntry :: SelectionSet
                                                                   Scope__RepoChangeMergeSettingAuditEntry
                                                                   decodesTo
                           , onRepoConfigDisableAnonymousGitAccessAuditEntry :: SelectionSet
                                                                                Scope__RepoConfigDisableAnonymousGitAccessAuditEntry
                                                                                decodesTo
                           , onRepoConfigDisableCollaboratorsOnlyAuditEntry :: SelectionSet
                                                                               Scope__RepoConfigDisableCollaboratorsOnlyAuditEntry
                                                                               decodesTo
                           , onRepoConfigDisableContributorsOnlyAuditEntry :: SelectionSet
                                                                              Scope__RepoConfigDisableContributorsOnlyAuditEntry
                                                                              decodesTo
                           , onRepoConfigDisableSockpuppetDisallowedAuditEntry :: SelectionSet
                                                                                  Scope__RepoConfigDisableSockpuppetDisallowedAuditEntry
                                                                                  decodesTo
                           , onRepoConfigEnableAnonymousGitAccessAuditEntry :: SelectionSet
                                                                               Scope__RepoConfigEnableAnonymousGitAccessAuditEntry
                                                                               decodesTo
                           , onRepoConfigEnableCollaboratorsOnlyAuditEntry :: SelectionSet
                                                                              Scope__RepoConfigEnableCollaboratorsOnlyAuditEntry
                                                                              decodesTo
                           , onRepoConfigEnableContributorsOnlyAuditEntry :: SelectionSet
                                                                             Scope__RepoConfigEnableContributorsOnlyAuditEntry
                                                                             decodesTo
                           , onRepoConfigEnableSockpuppetDisallowedAuditEntry :: SelectionSet
                                                                                 Scope__RepoConfigEnableSockpuppetDisallowedAuditEntry
                                                                                 decodesTo
                           , onRepoConfigLockAnonymousGitAccessAuditEntry :: SelectionSet
                                                                             Scope__RepoConfigLockAnonymousGitAccessAuditEntry
                                                                             decodesTo
                           , onRepoConfigUnlockAnonymousGitAccessAuditEntry :: SelectionSet
                                                                               Scope__RepoConfigUnlockAnonymousGitAccessAuditEntry
                                                                               decodesTo
                           , onRepoCreateAuditEntry :: SelectionSet
                                                       Scope__RepoCreateAuditEntry
                                                       decodesTo
                           , onRepoDestroyAuditEntry :: SelectionSet
                                                        Scope__RepoDestroyAuditEntry
                                                        decodesTo
                           , onRepoRemoveMemberAuditEntry :: SelectionSet
                                                             Scope__RepoRemoveMemberAuditEntry
                                                             decodesTo
                           , onRepoRemoveTopicAuditEntry :: SelectionSet
                                                            Scope__RepoRemoveTopicAuditEntry
                                                            decodesTo
                           , onRepositoryVisibilityChangeDisableAuditEntry :: SelectionSet
                                                                              Scope__RepositoryVisibilityChangeDisableAuditEntry
                                                                              decodesTo
                           , onRepositoryVisibilityChangeEnableAuditEntry :: SelectionSet
                                                                             Scope__RepositoryVisibilityChangeEnableAuditEntry
                                                                             decodesTo
                           , onTeamAddMemberAuditEntry :: SelectionSet
                                                          Scope__TeamAddMemberAuditEntry
                                                          decodesTo
                           , onTeamAddRepositoryAuditEntry :: SelectionSet
                                                              Scope__TeamAddRepositoryAuditEntry
                                                              decodesTo
                           , onTeamChangeParentTeamAuditEntry :: SelectionSet
                                                                 Scope__TeamChangeParentTeamAuditEntry
                                                                 decodesTo
                           , onTeamRemoveMemberAuditEntry :: SelectionSet
                                                             Scope__TeamRemoveMemberAuditEntry
                                                             decodesTo
                           , onTeamRemoveRepositoryAuditEntry :: SelectionSet
                                                                 Scope__TeamRemoveRepositoryAuditEntry
                                                                 decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__OrganizationAuditEntry
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "MembersCanDeleteReposClearAuditEntry"
                         selections.onMembersCanDeleteReposClearAuditEntry
                       , buildFragment
                         "MembersCanDeleteReposDisableAuditEntry"
                         selections.onMembersCanDeleteReposDisableAuditEntry
                       , buildFragment
                         "MembersCanDeleteReposEnableAuditEntry"
                         selections.onMembersCanDeleteReposEnableAuditEntry
                       , buildFragment
                         "OauthApplicationCreateAuditEntry"
                         selections.onOauthApplicationCreateAuditEntry
                       , buildFragment
                         "OrgAddBillingManagerAuditEntry"
                         selections.onOrgAddBillingManagerAuditEntry
                       , buildFragment
                         "OrgAddMemberAuditEntry"
                         selections.onOrgAddMemberAuditEntry
                       , buildFragment
                         "OrgBlockUserAuditEntry"
                         selections.onOrgBlockUserAuditEntry
                       , buildFragment
                         "OrgConfigDisableCollaboratorsOnlyAuditEntry"
                         selections.onOrgConfigDisableCollaboratorsOnlyAuditEntry
                       , buildFragment
                         "OrgConfigEnableCollaboratorsOnlyAuditEntry"
                         selections.onOrgConfigEnableCollaboratorsOnlyAuditEntry
                       , buildFragment
                         "OrgCreateAuditEntry"
                         selections.onOrgCreateAuditEntry
                       , buildFragment
                         "OrgDisableOauthAppRestrictionsAuditEntry"
                         selections.onOrgDisableOauthAppRestrictionsAuditEntry
                       , buildFragment
                         "OrgDisableSamlAuditEntry"
                         selections.onOrgDisableSamlAuditEntry
                       , buildFragment
                         "OrgDisableTwoFactorRequirementAuditEntry"
                         selections.onOrgDisableTwoFactorRequirementAuditEntry
                       , buildFragment
                         "OrgEnableOauthAppRestrictionsAuditEntry"
                         selections.onOrgEnableOauthAppRestrictionsAuditEntry
                       , buildFragment
                         "OrgEnableSamlAuditEntry"
                         selections.onOrgEnableSamlAuditEntry
                       , buildFragment
                         "OrgEnableTwoFactorRequirementAuditEntry"
                         selections.onOrgEnableTwoFactorRequirementAuditEntry
                       , buildFragment
                         "OrgInviteMemberAuditEntry"
                         selections.onOrgInviteMemberAuditEntry
                       , buildFragment
                         "OrgInviteToBusinessAuditEntry"
                         selections.onOrgInviteToBusinessAuditEntry
                       , buildFragment
                         "OrgOauthAppAccessApprovedAuditEntry"
                         selections.onOrgOauthAppAccessApprovedAuditEntry
                       , buildFragment
                         "OrgOauthAppAccessDeniedAuditEntry"
                         selections.onOrgOauthAppAccessDeniedAuditEntry
                       , buildFragment
                         "OrgOauthAppAccessRequestedAuditEntry"
                         selections.onOrgOauthAppAccessRequestedAuditEntry
                       , buildFragment
                         "OrgRemoveBillingManagerAuditEntry"
                         selections.onOrgRemoveBillingManagerAuditEntry
                       , buildFragment
                         "OrgRemoveMemberAuditEntry"
                         selections.onOrgRemoveMemberAuditEntry
                       , buildFragment
                         "OrgRemoveOutsideCollaboratorAuditEntry"
                         selections.onOrgRemoveOutsideCollaboratorAuditEntry
                       , buildFragment
                         "OrgRestoreMemberAuditEntry"
                         selections.onOrgRestoreMemberAuditEntry
                       , buildFragment
                         "OrgUnblockUserAuditEntry"
                         selections.onOrgUnblockUserAuditEntry
                       , buildFragment
                         "OrgUpdateDefaultRepositoryPermissionAuditEntry"
                         selections.onOrgUpdateDefaultRepositoryPermissionAuditEntry
                       , buildFragment
                         "OrgUpdateMemberAuditEntry"
                         selections.onOrgUpdateMemberAuditEntry
                       , buildFragment
                         "OrgUpdateMemberRepositoryCreationPermissionAuditEntry"
                         selections.onOrgUpdateMemberRepositoryCreationPermissionAuditEntry
                       , buildFragment
                         "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry"
                         selections.onOrgUpdateMemberRepositoryInvitationPermissionAuditEntry
                       , buildFragment
                         "PrivateRepositoryForkingDisableAuditEntry"
                         selections.onPrivateRepositoryForkingDisableAuditEntry
                       , buildFragment
                         "PrivateRepositoryForkingEnableAuditEntry"
                         selections.onPrivateRepositoryForkingEnableAuditEntry
                       , buildFragment
                         "RepoAccessAuditEntry"
                         selections.onRepoAccessAuditEntry
                       , buildFragment
                         "RepoAddMemberAuditEntry"
                         selections.onRepoAddMemberAuditEntry
                       , buildFragment
                         "RepoAddTopicAuditEntry"
                         selections.onRepoAddTopicAuditEntry
                       , buildFragment
                         "RepoArchivedAuditEntry"
                         selections.onRepoArchivedAuditEntry
                       , buildFragment
                         "RepoChangeMergeSettingAuditEntry"
                         selections.onRepoChangeMergeSettingAuditEntry
                       , buildFragment
                         "RepoConfigDisableAnonymousGitAccessAuditEntry"
                         selections.onRepoConfigDisableAnonymousGitAccessAuditEntry
                       , buildFragment
                         "RepoConfigDisableCollaboratorsOnlyAuditEntry"
                         selections.onRepoConfigDisableCollaboratorsOnlyAuditEntry
                       , buildFragment
                         "RepoConfigDisableContributorsOnlyAuditEntry"
                         selections.onRepoConfigDisableContributorsOnlyAuditEntry
                       , buildFragment
                         "RepoConfigDisableSockpuppetDisallowedAuditEntry"
                         selections.onRepoConfigDisableSockpuppetDisallowedAuditEntry
                       , buildFragment
                         "RepoConfigEnableAnonymousGitAccessAuditEntry"
                         selections.onRepoConfigEnableAnonymousGitAccessAuditEntry
                       , buildFragment
                         "RepoConfigEnableCollaboratorsOnlyAuditEntry"
                         selections.onRepoConfigEnableCollaboratorsOnlyAuditEntry
                       , buildFragment
                         "RepoConfigEnableContributorsOnlyAuditEntry"
                         selections.onRepoConfigEnableContributorsOnlyAuditEntry
                       , buildFragment
                         "RepoConfigEnableSockpuppetDisallowedAuditEntry"
                         selections.onRepoConfigEnableSockpuppetDisallowedAuditEntry
                       , buildFragment
                         "RepoConfigLockAnonymousGitAccessAuditEntry"
                         selections.onRepoConfigLockAnonymousGitAccessAuditEntry
                       , buildFragment
                         "RepoConfigUnlockAnonymousGitAccessAuditEntry"
                         selections.onRepoConfigUnlockAnonymousGitAccessAuditEntry
                       , buildFragment
                         "RepoCreateAuditEntry"
                         selections.onRepoCreateAuditEntry
                       , buildFragment
                         "RepoDestroyAuditEntry"
                         selections.onRepoDestroyAuditEntry
                       , buildFragment
                         "RepoRemoveMemberAuditEntry"
                         selections.onRepoRemoveMemberAuditEntry
                       , buildFragment
                         "RepoRemoveTopicAuditEntry"
                         selections.onRepoRemoveTopicAuditEntry
                       , buildFragment
                         "RepositoryVisibilityChangeDisableAuditEntry"
                         selections.onRepositoryVisibilityChangeDisableAuditEntry
                       , buildFragment
                         "RepositoryVisibilityChangeEnableAuditEntry"
                         selections.onRepositoryVisibilityChangeEnableAuditEntry
                       , buildFragment
                         "TeamAddMemberAuditEntry"
                         selections.onTeamAddMemberAuditEntry
                       , buildFragment
                         "TeamAddRepositoryAuditEntry"
                         selections.onTeamAddRepositoryAuditEntry
                       , buildFragment
                         "TeamChangeParentTeamAuditEntry"
                         selections.onTeamChangeParentTeamAuditEntry
                       , buildFragment
                         "TeamRemoveMemberAuditEntry"
                         selections.onTeamRemoveMemberAuditEntry
                       , buildFragment
                         "TeamRemoveRepositoryAuditEntry"
                         selections.onTeamRemoveRepositoryAuditEntry
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onMembersCanDeleteReposClearAuditEntry: pure
                                                           Nothing
                 , onMembersCanDeleteReposDisableAuditEntry: pure
                                                             Nothing
                 , onMembersCanDeleteReposEnableAuditEntry: pure
                                                            Nothing
                 , onOauthApplicationCreateAuditEntry: pure
                                                       Nothing
                 , onOrgAddBillingManagerAuditEntry: pure
                                                     Nothing
                 , onOrgAddMemberAuditEntry: pure
                                             Nothing
                 , onOrgBlockUserAuditEntry: pure
                                             Nothing
                 , onOrgConfigDisableCollaboratorsOnlyAuditEntry: pure
                                                                  Nothing
                 , onOrgConfigEnableCollaboratorsOnlyAuditEntry: pure
                                                                 Nothing
                 , onOrgCreateAuditEntry: pure
                                          Nothing
                 , onOrgDisableOauthAppRestrictionsAuditEntry: pure
                                                               Nothing
                 , onOrgDisableSamlAuditEntry: pure
                                               Nothing
                 , onOrgDisableTwoFactorRequirementAuditEntry: pure
                                                               Nothing
                 , onOrgEnableOauthAppRestrictionsAuditEntry: pure
                                                              Nothing
                 , onOrgEnableSamlAuditEntry: pure
                                              Nothing
                 , onOrgEnableTwoFactorRequirementAuditEntry: pure
                                                              Nothing
                 , onOrgInviteMemberAuditEntry: pure
                                                Nothing
                 , onOrgInviteToBusinessAuditEntry: pure
                                                    Nothing
                 , onOrgOauthAppAccessApprovedAuditEntry: pure
                                                          Nothing
                 , onOrgOauthAppAccessDeniedAuditEntry: pure
                                                        Nothing
                 , onOrgOauthAppAccessRequestedAuditEntry: pure
                                                           Nothing
                 , onOrgRemoveBillingManagerAuditEntry: pure
                                                        Nothing
                 , onOrgRemoveMemberAuditEntry: pure
                                                Nothing
                 , onOrgRemoveOutsideCollaboratorAuditEntry: pure
                                                             Nothing
                 , onOrgRestoreMemberAuditEntry: pure
                                                 Nothing
                 , onOrgUnblockUserAuditEntry: pure
                                               Nothing
                 , onOrgUpdateDefaultRepositoryPermissionAuditEntry: pure
                                                                     Nothing
                 , onOrgUpdateMemberAuditEntry: pure
                                                Nothing
                 , onOrgUpdateMemberRepositoryCreationPermissionAuditEntry: pure
                                                                            Nothing
                 , onOrgUpdateMemberRepositoryInvitationPermissionAuditEntry: pure
                                                                              Nothing
                 , onPrivateRepositoryForkingDisableAuditEntry: pure
                                                                Nothing
                 , onPrivateRepositoryForkingEnableAuditEntry: pure
                                                               Nothing
                 , onRepoAccessAuditEntry: pure
                                           Nothing
                 , onRepoAddMemberAuditEntry: pure
                                              Nothing
                 , onRepoAddTopicAuditEntry: pure
                                             Nothing
                 , onRepoArchivedAuditEntry: pure
                                             Nothing
                 , onRepoChangeMergeSettingAuditEntry: pure
                                                       Nothing
                 , onRepoConfigDisableAnonymousGitAccessAuditEntry: pure
                                                                    Nothing
                 , onRepoConfigDisableCollaboratorsOnlyAuditEntry: pure
                                                                   Nothing
                 , onRepoConfigDisableContributorsOnlyAuditEntry: pure
                                                                  Nothing
                 , onRepoConfigDisableSockpuppetDisallowedAuditEntry: pure
                                                                      Nothing
                 , onRepoConfigEnableAnonymousGitAccessAuditEntry: pure
                                                                   Nothing
                 , onRepoConfigEnableCollaboratorsOnlyAuditEntry: pure
                                                                  Nothing
                 , onRepoConfigEnableContributorsOnlyAuditEntry: pure
                                                                 Nothing
                 , onRepoConfigEnableSockpuppetDisallowedAuditEntry: pure
                                                                     Nothing
                 , onRepoConfigLockAnonymousGitAccessAuditEntry: pure
                                                                 Nothing
                 , onRepoConfigUnlockAnonymousGitAccessAuditEntry: pure
                                                                   Nothing
                 , onRepoCreateAuditEntry: pure
                                           Nothing
                 , onRepoDestroyAuditEntry: pure
                                            Nothing
                 , onRepoRemoveMemberAuditEntry: pure
                                                 Nothing
                 , onRepoRemoveTopicAuditEntry: pure
                                                Nothing
                 , onRepositoryVisibilityChangeDisableAuditEntry: pure
                                                                  Nothing
                 , onRepositoryVisibilityChangeEnableAuditEntry: pure
                                                                 Nothing
                 , onTeamAddMemberAuditEntry: pure
                                              Nothing
                 , onTeamAddRepositoryAuditEntry: pure
                                                  Nothing
                 , onTeamChangeParentTeamAuditEntry: pure
                                                     Nothing
                 , onTeamRemoveMemberAuditEntry: pure
                                                 Nothing
                 , onTeamRemoveRepositoryAuditEntry: pure
                                                     Nothing
                 }
