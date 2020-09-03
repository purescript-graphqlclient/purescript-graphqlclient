module Examples.Swapi.Union.CharacterUnion where

import GraphqlClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Swapi.Scopes (Scope__Human, Scope__Droid, Scope__CharacterUnion)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo = { onHuman :: SelectionSet Scope__Human decodesTo
                           , onDroid :: SelectionSet Scope__Droid decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__CharacterUnion decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Human" selections.onHuman
                       , buildFragment "Droid" selections.onDroid
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onHuman: pure Nothing, onDroid: pure Nothing }
