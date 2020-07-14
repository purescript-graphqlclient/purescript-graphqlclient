module Swapi.Union.CharacterUnion where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Scalar
import Swapi.InputObject
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase
import Swapi.Object.Droid as Droid
import Swapi.Object.Human as Human

data Scope__CharacterUnion

type Fragments decodesTo =
  { onHuman :: SelectionSet Human.Scope__Human decodesTo
  , onDroid :: SelectionSet Droid.Scope__Droid decodesTo
  }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__CharacterUnion decodesTo
fragments selections =
  exhaustiveFragmentSelection
    [ buildFragment "Human" selections.onHuman
    , buildFragment "Droid" selections.onDroid
    ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments =
  { onHuman: pure Nothing
  , onDroid: pure Nothing
  }
