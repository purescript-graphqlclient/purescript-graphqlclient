module Examples.Github.Interface.EnterpriseAuditEntryData where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__EnterpriseAuditEntryData
  , Scope__MembersCanDeleteReposClearAuditEntry
  , Scope__MembersCanDeleteReposDisableAuditEntry
  , Scope__MembersCanDeleteReposEnableAuditEntry
  , Scope__OrgInviteToBusinessAuditEntry
  , Scope__PrivateRepositoryForkingDisableAuditEntry
  , Scope__PrivateRepositoryForkingEnableAuditEntry
  , Scope__RepositoryVisibilityChangeDisableAuditEntry
  , Scope__RepositoryVisibilityChangeEnableAuditEntry
  )
import Data.Maybe (Maybe(..))
import Examples.Github.Scalars (Uri)
import Prelude

enterpriseResourcePath :: SelectionSet
                          Scope__EnterpriseAuditEntryData
                          (Maybe
                           Uri)
enterpriseResourcePath = selectionForField
                         "enterpriseResourcePath"
                         []
                         graphqlDefaultResponseScalarDecoder

enterpriseSlug :: SelectionSet Scope__EnterpriseAuditEntryData (Maybe String)
enterpriseSlug = selectionForField
                 "enterpriseSlug"
                 []
                 graphqlDefaultResponseScalarDecoder

enterpriseUrl :: SelectionSet Scope__EnterpriseAuditEntryData (Maybe Uri)
enterpriseUrl = selectionForField
                "enterpriseUrl"
                []
                graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onMembersCanDeleteReposClearAuditEntry :: SelectionSet
                                                                       Scope__MembersCanDeleteReposClearAuditEntry
                                                                       decodesTo
                           , onMembersCanDeleteReposDisableAuditEntry :: SelectionSet
                                                                         Scope__MembersCanDeleteReposDisableAuditEntry
                                                                         decodesTo
                           , onMembersCanDeleteReposEnableAuditEntry :: SelectionSet
                                                                        Scope__MembersCanDeleteReposEnableAuditEntry
                                                                        decodesTo
                           , onOrgInviteToBusinessAuditEntry :: SelectionSet
                                                                Scope__OrgInviteToBusinessAuditEntry
                                                                decodesTo
                           , onPrivateRepositoryForkingDisableAuditEntry :: SelectionSet
                                                                            Scope__PrivateRepositoryForkingDisableAuditEntry
                                                                            decodesTo
                           , onPrivateRepositoryForkingEnableAuditEntry :: SelectionSet
                                                                           Scope__PrivateRepositoryForkingEnableAuditEntry
                                                                           decodesTo
                           , onRepositoryVisibilityChangeDisableAuditEntry :: SelectionSet
                                                                              Scope__RepositoryVisibilityChangeDisableAuditEntry
                                                                              decodesTo
                           , onRepositoryVisibilityChangeEnableAuditEntry :: SelectionSet
                                                                             Scope__RepositoryVisibilityChangeEnableAuditEntry
                                                                             decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__EnterpriseAuditEntryData
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
                         "OrgInviteToBusinessAuditEntry"
                         selections.onOrgInviteToBusinessAuditEntry
                       , buildFragment
                         "PrivateRepositoryForkingDisableAuditEntry"
                         selections.onPrivateRepositoryForkingDisableAuditEntry
                       , buildFragment
                         "PrivateRepositoryForkingEnableAuditEntry"
                         selections.onPrivateRepositoryForkingEnableAuditEntry
                       , buildFragment
                         "RepositoryVisibilityChangeDisableAuditEntry"
                         selections.onRepositoryVisibilityChangeDisableAuditEntry
                       , buildFragment
                         "RepositoryVisibilityChangeEnableAuditEntry"
                         selections.onRepositoryVisibilityChangeEnableAuditEntry
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onMembersCanDeleteReposClearAuditEntry: pure
                                                           Nothing
                 , onMembersCanDeleteReposDisableAuditEntry: pure
                                                             Nothing
                 , onMembersCanDeleteReposEnableAuditEntry: pure
                                                            Nothing
                 , onOrgInviteToBusinessAuditEntry: pure
                                                    Nothing
                 , onPrivateRepositoryForkingDisableAuditEntry: pure
                                                                Nothing
                 , onPrivateRepositoryForkingEnableAuditEntry: pure
                                                               Nothing
                 , onRepositoryVisibilityChangeDisableAuditEntry: pure
                                                                  Nothing
                 , onRepositoryVisibilityChangeEnableAuditEntry: pure
                                                                 Nothing
                 }
