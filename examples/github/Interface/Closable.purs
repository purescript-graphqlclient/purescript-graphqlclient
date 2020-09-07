module Examples.Github.Interface.Closable where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Closable
  , Scope__Issue
  , Scope__Milestone
  , Scope__Project
  , Scope__PullRequest
  )
import Data.Maybe (Maybe(..))
import Examples.Github.Scalars (DateTime)
import Prelude

closed :: SelectionSet Scope__Closable Boolean
closed = selectionForField "closed" [] graphqlDefaultResponseScalarDecoder

closedAt :: SelectionSet Scope__Closable (Maybe DateTime)
closedAt = selectionForField "closedAt" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onIssue :: SelectionSet Scope__Issue decodesTo
                           , onMilestone :: SelectionSet
                                            Scope__Milestone
                                            decodesTo
                           , onProject :: SelectionSet Scope__Project decodesTo
                           , onPullRequest :: SelectionSet
                                              Scope__PullRequest
                                              decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__Closable
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Issue" selections.onIssue
                       , buildFragment "Milestone" selections.onMilestone
                       , buildFragment "Project" selections.onProject
                       , buildFragment "PullRequest" selections.onPullRequest
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onIssue: pure
                            Nothing
                 , onMilestone: pure
                                Nothing
                 , onProject: pure
                              Nothing
                 , onPullRequest: pure
                                  Nothing
                 }
