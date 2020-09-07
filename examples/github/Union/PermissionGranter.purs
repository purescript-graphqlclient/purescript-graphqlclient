module Examples.Github.Union.PermissionGranter where

import GraphqlClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  ( Scope__Organization
  , Scope__Repository
  , Scope__Team
  , Scope__PermissionGranter
  )
import Data.Maybe (Maybe(..))
import Prelude

type Fragments decodesTo = { onOrganization :: SelectionSet
                                               Scope__Organization
                                               decodesTo
                           , onRepository :: SelectionSet
                                             Scope__Repository
                                             decodesTo
                           , onTeam :: SelectionSet Scope__Team decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__PermissionGranter
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Organization" selections.onOrganization
                       , buildFragment "Repository" selections.onRepository
                       , buildFragment "Team" selections.onTeam
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure
                                   Nothing
                 , onRepository: pure
                                 Nothing
                 , onTeam: pure
                           Nothing
                 }
