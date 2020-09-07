module Examples.Github.Union.RenamedTitleSubject where

import GraphqlClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__Issue, Scope__PullRequest, Scope__RenamedTitleSubject)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo = { onIssue :: SelectionSet Scope__Issue decodesTo
                           , onPullRequest :: SelectionSet
                                              Scope__PullRequest
                                              decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__RenamedTitleSubject
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Issue" selections.onIssue
                       , buildFragment "PullRequest" selections.onPullRequest
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onIssue: pure Nothing, onPullRequest: pure Nothing }
