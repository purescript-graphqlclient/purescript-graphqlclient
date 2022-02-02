module Examples.Github.Union.BranchActorAllowanceActor where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__Team, Scope__User, Scope__BranchActorAllowanceActor)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onTeam :: SelectionSet Scope__Team decodesTo
    , onUser :: SelectionSet Scope__User decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__BranchActorAllowanceActor decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Team" selections.onTeam
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onTeam: pure Nothing, onUser: pure Nothing }
