module Examples.Github.Union.AuditEntryActor where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__Bot, Scope__Organization, Scope__User, Scope__AuditEntryActor)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onBot :: SelectionSet Scope__Bot decodesTo
    , onOrganization :: SelectionSet Scope__Organization decodesTo
    , onUser :: SelectionSet Scope__User decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__AuditEntryActor decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Bot" selections.onBot
                       , buildFragment "Organization" selections.onOrganization
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onBot: pure
                          Nothing
                 , onOrganization: pure
                                   Nothing
                 , onUser: pure
                           Nothing
                 }
