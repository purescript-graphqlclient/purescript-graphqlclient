module Swapi.Union.CharacterUnion where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Scalar
import Swapi.InputObject
import Swapi.Scopes
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase

type Fragments decodesTo = { onHuman :: SelectionSet Scope__Human decodesTo
                           , onDroid :: SelectionSet Scope__Droid decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__CharacterUnion decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "Human" selections.onHuman, buildFragment "Droid" selections.onDroid]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onHuman: pure Nothing, onDroid: pure Nothing }
