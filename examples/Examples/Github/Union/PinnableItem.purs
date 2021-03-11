module Examples.Github.Union.PinnableItem where

import GraphQLClient
  (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__Gist, Scope__Repository, Scope__PinnableItem)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onGist :: SelectionSet Scope__Gist decodesTo
    , onRepository :: SelectionSet Scope__Repository decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__PinnableItem decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Gist" selections.onGist
                       , buildFragment "Repository" selections.onRepository
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onGist: pure Nothing, onRepository: pure Nothing }
