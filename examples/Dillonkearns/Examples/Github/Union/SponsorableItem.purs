module Dillonkearns.Examples.Github.Union.SponsorableItem where

import Dillonkearns.GraphQLClient
  (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Dillonkearns.Examples.Github.Scopes
  (Scope__Organization, Scope__User, Scope__SponsorableItem)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onOrganization :: SelectionSet Scope__Organization decodesTo
    , onUser :: SelectionSet Scope__User decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__SponsorableItem decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Organization" selections.onOrganization
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure Nothing, onUser: pure Nothing }
