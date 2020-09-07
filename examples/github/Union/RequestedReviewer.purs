module Examples.Github.Union.RequestedReviewer where

import GraphqlClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__Mannequin, Scope__Team, Scope__User, Scope__RequestedReviewer)
import Data.Maybe (Maybe(..))
import Prelude

type Fragments decodesTo = { onMannequin :: SelectionSet
                                            Scope__Mannequin
                                            decodesTo
                           , onTeam :: SelectionSet Scope__Team decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__RequestedReviewer
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Mannequin" selections.onMannequin
                       , buildFragment "Team" selections.onTeam
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onMannequin: pure
                                Nothing
                 , onTeam: pure
                           Nothing
                 , onUser: pure
                           Nothing
                 }
