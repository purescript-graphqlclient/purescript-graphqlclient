module Examples.Github.Union.ReviewDismissalAllowanceActor where

import GraphqlClient
  ( SelectionSet
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Team
  , Scope__User
  , Scope__ReviewDismissalAllowanceActor
  )
import Data.Maybe
  ( Maybe(..)
  )
import Prelude
  ( pure
  )

type Fragments decodesTo = { onTeam :: SelectionSet Scope__Team decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__ReviewDismissalAllowanceActor decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "Team" selections.onTeam, buildFragment "User" selections.onUser]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onTeam: pure Nothing, onUser: pure Nothing }
