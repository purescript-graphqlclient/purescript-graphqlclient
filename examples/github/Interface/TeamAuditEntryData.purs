module Examples.Github.Interface.TeamAuditEntryData where

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
  ( Scope__Team
  , Scope__TeamAuditEntryData
  , Scope__OrgRestoreMemberMembershipTeamAuditEntryData
  , Scope__TeamAddMemberAuditEntry
  , Scope__TeamAddRepositoryAuditEntry
  , Scope__TeamChangeParentTeamAuditEntry
  , Scope__TeamRemoveMemberAuditEntry
  , Scope__TeamRemoveRepositoryAuditEntry
  )
import Data.Maybe
  ( Maybe(..)
  )
import Examples.Github.Scalars
  ( Uri
  )
import Prelude
  ( pure
  )

team :: forall r . SelectionSet Scope__Team r -> SelectionSet Scope__TeamAuditEntryData (Maybe r)
team = selectionForCompositeField "team" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

teamName :: SelectionSet Scope__TeamAuditEntryData (Maybe String)
teamName = selectionForField "teamName" [] graphqlDefaultResponseScalarDecoder

teamResourcePath :: SelectionSet Scope__TeamAuditEntryData (Maybe Uri)
teamResourcePath = selectionForField "teamResourcePath" [] graphqlDefaultResponseScalarDecoder

teamUrl :: SelectionSet Scope__TeamAuditEntryData (Maybe Uri)
teamUrl = selectionForField "teamUrl" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onOrgRestoreMemberMembershipTeamAuditEntryData :: SelectionSet Scope__OrgRestoreMemberMembershipTeamAuditEntryData decodesTo
                           , onTeamAddMemberAuditEntry :: SelectionSet Scope__TeamAddMemberAuditEntry decodesTo
                           , onTeamAddRepositoryAuditEntry :: SelectionSet Scope__TeamAddRepositoryAuditEntry decodesTo
                           , onTeamChangeParentTeamAuditEntry :: SelectionSet Scope__TeamChangeParentTeamAuditEntry decodesTo
                           , onTeamRemoveMemberAuditEntry :: SelectionSet Scope__TeamRemoveMemberAuditEntry decodesTo
                           , onTeamRemoveRepositoryAuditEntry :: SelectionSet Scope__TeamRemoveRepositoryAuditEntry decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__TeamAuditEntryData decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "OrgRestoreMemberMembershipTeamAuditEntryData" selections.onOrgRestoreMemberMembershipTeamAuditEntryData, buildFragment "TeamAddMemberAuditEntry" selections.onTeamAddMemberAuditEntry, buildFragment "TeamAddRepositoryAuditEntry" selections.onTeamAddRepositoryAuditEntry, buildFragment "TeamChangeParentTeamAuditEntry" selections.onTeamChangeParentTeamAuditEntry, buildFragment "TeamRemoveMemberAuditEntry" selections.onTeamRemoveMemberAuditEntry, buildFragment "TeamRemoveRepositoryAuditEntry" selections.onTeamRemoveRepositoryAuditEntry]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onOrgRestoreMemberMembershipTeamAuditEntryData: pure Nothing, onTeamAddMemberAuditEntry: pure Nothing, onTeamAddRepositoryAuditEntry: pure Nothing, onTeamChangeParentTeamAuditEntry: pure Nothing, onTeamRemoveMemberAuditEntry: pure Nothing, onTeamRemoveRepositoryAuditEntry: pure Nothing }
