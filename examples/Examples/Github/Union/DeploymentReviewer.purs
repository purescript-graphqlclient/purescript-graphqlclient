module Examples.Github.Union.DeploymentReviewer where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__Team, Scope__User, Scope__DeploymentReviewer)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onTeam :: SelectionSet Scope__Team decodesTo
    , onUser :: SelectionSet Scope__User decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__DeploymentReviewer decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Team" selections.onTeam
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onTeam: pure Nothing, onUser: pure Nothing }
