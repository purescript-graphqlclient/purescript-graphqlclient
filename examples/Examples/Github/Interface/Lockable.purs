module Examples.Github.Interface.Lockable where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  (Scope__Lockable, Scope__Discussion, Scope__Issue, Scope__PullRequest)
import Data.Maybe (Maybe(..))
import Examples.Github.Enum.LockReason (LockReason)
import Prelude (pure)

activeLockReason :: SelectionSet Scope__Lockable (Maybe LockReason)
activeLockReason = selectionForField
                   "activeLockReason"
                   []
                   graphqlDefaultResponseScalarDecoder

locked :: SelectionSet Scope__Lockable Boolean
locked = selectionForField "locked" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onDiscussion :: SelectionSet Scope__Discussion decodesTo
    , onIssue :: SelectionSet Scope__Issue decodesTo
    , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__Lockable decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Discussion" selections.onDiscussion
                       , buildFragment "Issue" selections.onIssue
                       , buildFragment "PullRequest" selections.onPullRequest
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onDiscussion: pure
                                 Nothing
                 , onIssue: pure
                            Nothing
                 , onPullRequest: pure
                                  Nothing
                 }
