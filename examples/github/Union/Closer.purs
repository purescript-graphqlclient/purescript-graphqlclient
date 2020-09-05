module Examples.Github.Union.Closer where

import GraphqlClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes (Scope__Commit, Scope__PullRequest, Scope__Closer)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo = { onCommit :: SelectionSet Scope__Commit decodesTo
                           , onPullRequest :: SelectionSet
                                              Scope__PullRequest
                                              decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__Closer
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Commit" selections.onCommit
                       , buildFragment "PullRequest" selections.onPullRequest
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onCommit: pure Nothing, onPullRequest: pure Nothing }
