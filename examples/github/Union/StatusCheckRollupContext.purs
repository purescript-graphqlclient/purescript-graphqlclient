module Examples.Github.Union.StatusCheckRollupContext where

import GraphqlClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__StatusContext, Scope__StatusCheckRollupContext)
import Data.Maybe (Maybe(..))
import Prelude

type Fragments decodesTo = { onStatusContext :: SelectionSet
                                                Scope__StatusContext
                                                decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__StatusCheckRollupContext
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "StatusContext"
                         selections.onStatusContext
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onStatusContext: pure Nothing }
