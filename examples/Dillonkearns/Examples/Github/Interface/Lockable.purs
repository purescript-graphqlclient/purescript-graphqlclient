module Dillonkearns.Examples.Github.Interface.Lockable where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Lockable, Scope__Issue, Scope__PullRequest)
import Data.Maybe (Maybe(..))
import Dillonkearns.Examples.Github.Enum.LockReason (LockReason)
import Prelude (pure)

activeLockReason :: SelectionSet Scope__Lockable (Maybe LockReason)
activeLockReason = selectionForField
                   "activeLockReason"
                   []
                   graphqlDefaultResponseScalarDecoder

locked :: SelectionSet Scope__Lockable Boolean
locked = selectionForField "locked" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onIssue :: SelectionSet Scope__Issue decodesTo
    , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__Lockable decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Issue" selections.onIssue
                       , buildFragment "PullRequest" selections.onPullRequest
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onIssue: pure Nothing, onPullRequest: pure Nothing }
