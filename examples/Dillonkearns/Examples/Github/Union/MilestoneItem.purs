module Dillonkearns.Examples.Github.Union.MilestoneItem where

import Dillonkearns.GraphQLClient
  (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Dillonkearns.Examples.Github.Scopes
  (Scope__Issue, Scope__PullRequest, Scope__MilestoneItem)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onIssue :: SelectionSet Scope__Issue decodesTo
    , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__MilestoneItem decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Issue" selections.onIssue
                       , buildFragment "PullRequest" selections.onPullRequest
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onIssue: pure Nothing, onPullRequest: pure Nothing }
