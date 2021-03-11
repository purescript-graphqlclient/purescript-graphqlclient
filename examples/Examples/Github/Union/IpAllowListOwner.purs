module Examples.Github.Union.IpAllowListOwner where

import GraphQLClient
  (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__Enterprise, Scope__Organization, Scope__IpAllowListOwner)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onEnterprise :: SelectionSet Scope__Enterprise decodesTo
    , onOrganization :: SelectionSet Scope__Organization decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__IpAllowListOwner decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Enterprise" selections.onEnterprise
                       , buildFragment "Organization" selections.onOrganization
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onEnterprise: pure Nothing, onOrganization: pure Nothing }
