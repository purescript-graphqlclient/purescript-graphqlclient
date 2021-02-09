module Dillonkearns.Examples.Github.Union.OrgRestoreMemberAuditEntryMembership where

import Dillonkearns.GraphQLClient
  (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Dillonkearns.Examples.Github.Scopes
  ( Scope__OrgRestoreMemberMembershipOrganizationAuditEntryData
  , Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
  , Scope__OrgRestoreMemberMembershipTeamAuditEntryData
  , Scope__OrgRestoreMemberAuditEntryMembership
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onOrgRestoreMemberMembershipOrganizationAuditEntryData
      :: SelectionSet
         Scope__OrgRestoreMemberMembershipOrganizationAuditEntryData
         decodesTo
    , onOrgRestoreMemberMembershipRepositoryAuditEntryData
      :: SelectionSet
         Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
         decodesTo
    , onOrgRestoreMemberMembershipTeamAuditEntryData
      :: SelectionSet
         Scope__OrgRestoreMemberMembershipTeamAuditEntryData
         decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__OrgRestoreMemberAuditEntryMembership decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "OrgRestoreMemberMembershipOrganizationAuditEntryData"
                         selections.onOrgRestoreMemberMembershipOrganizationAuditEntryData
                       , buildFragment
                         "OrgRestoreMemberMembershipRepositoryAuditEntryData"
                         selections.onOrgRestoreMemberMembershipRepositoryAuditEntryData
                       , buildFragment
                         "OrgRestoreMemberMembershipTeamAuditEntryData"
                         selections.onOrgRestoreMemberMembershipTeamAuditEntryData
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onOrgRestoreMemberMembershipOrganizationAuditEntryData: pure
                                                                           Nothing
                 , onOrgRestoreMemberMembershipRepositoryAuditEntryData: pure
                                                                         Nothing
                 , onOrgRestoreMemberMembershipTeamAuditEntryData: pure
                                                                   Nothing
                 }
