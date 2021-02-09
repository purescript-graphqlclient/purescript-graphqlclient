module Examples.Github.Union.PushAllowanceActor where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__App, Scope__Team, Scope__User, Scope__PushAllowanceActor)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onApp :: SelectionSet Scope__App decodesTo
    , onTeam :: SelectionSet Scope__Team decodesTo
    , onUser :: SelectionSet Scope__User decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__PushAllowanceActor decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "App" selections.onApp
                       , buildFragment "Team" selections.onTeam
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onApp: pure
                          Nothing
                 , onTeam: pure
                           Nothing
                 , onUser: pure
                           Nothing
                 }
