module Examples.Github.Union.Sponsor where

import GraphqlClient
  ( SelectionSet
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Organization
  , Scope__User
  , Scope__Sponsor
  )
import Data.Maybe
  ( Maybe(..)
  )
import Prelude
  ( pure
  )

type Fragments decodesTo = { onOrganization :: SelectionSet Scope__Organization decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__Sponsor decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "Organization" selections.onOrganization, buildFragment "User" selections.onUser]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure Nothing, onUser: pure Nothing }
