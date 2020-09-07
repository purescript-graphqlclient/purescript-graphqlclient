module Examples.Github.Interface.RepositoryAuditEntryData where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Repository
  , Scope__RepositoryAuditEntryData
  , Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
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
  , Scope__TeamAddRepositoryAuditEntry
  , Scope__TeamRemoveRepositoryAuditEntry
  )
import Data.Maybe (Maybe(..))
import Examples.Github.Scalars (Uri)
import Prelude

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__RepositoryAuditEntryData
                              (Maybe
                               r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryName :: SelectionSet Scope__RepositoryAuditEntryData (Maybe String)
repositoryName = selectionForField
                 "repositoryName"
                 []
                 graphqlDefaultResponseScalarDecoder

repositoryResourcePath :: SelectionSet
                          Scope__RepositoryAuditEntryData
                          (Maybe
                           Uri)
repositoryResourcePath = selectionForField
                         "repositoryResourcePath"
                         []
                         graphqlDefaultResponseScalarDecoder

repositoryUrl :: SelectionSet Scope__RepositoryAuditEntryData (Maybe Uri)
repositoryUrl = selectionForField
                "repositoryUrl"
                []
                graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onOrgRestoreMemberMembershipRepositoryAuditEntryData :: SelectionSet
                                                                                     Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
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
                           , onTeamAddRepositoryAuditEntry :: SelectionSet
                                                              Scope__TeamAddRepositoryAuditEntry
                                                              decodesTo
                           , onTeamRemoveRepositoryAuditEntry :: SelectionSet
                                                                 Scope__TeamRemoveRepositoryAuditEntry
                                                                 decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__RepositoryAuditEntryData
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "OrgRestoreMemberMembershipRepositoryAuditEntryData"
                         selections.onOrgRestoreMemberMembershipRepositoryAuditEntryData
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
                         "TeamAddRepositoryAuditEntry"
                         selections.onTeamAddRepositoryAuditEntry
                       , buildFragment
                         "TeamRemoveRepositoryAuditEntry"
                         selections.onTeamRemoveRepositoryAuditEntry
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onOrgRestoreMemberMembershipRepositoryAuditEntryData: pure
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
                 , onTeamAddRepositoryAuditEntry: pure
                                                  Nothing
                 , onTeamRemoveRepositoryAuditEntry: pure
                                                     Nothing
                 }
