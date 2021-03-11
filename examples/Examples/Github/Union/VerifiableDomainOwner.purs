module Examples.Github.Union.VerifiableDomainOwner where

import GraphQLClient
  (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__Enterprise, Scope__Organization, Scope__VerifiableDomainOwner)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onEnterprise :: SelectionSet Scope__Enterprise decodesTo
    , onOrganization :: SelectionSet Scope__Organization decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__VerifiableDomainOwner decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Enterprise" selections.onEnterprise
                       , buildFragment "Organization" selections.onOrganization
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onEnterprise: pure Nothing, onOrganization: pure Nothing }
