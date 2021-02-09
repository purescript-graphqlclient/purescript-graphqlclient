module Examples.Github.Union.StatusCheckRollupContext where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__CheckRun, Scope__StatusContext, Scope__StatusCheckRollupContext)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onCheckRun :: SelectionSet Scope__CheckRun decodesTo
    , onStatusContext :: SelectionSet Scope__StatusContext decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__StatusCheckRollupContext decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "CheckRun" selections.onCheckRun
                       , buildFragment
                         "StatusContext"
                         selections.onStatusContext
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onCheckRun: pure Nothing, onStatusContext: pure Nothing }
