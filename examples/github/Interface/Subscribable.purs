module Examples.Github.Interface.Subscribable where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Subscribable
  , Scope__Commit
  , Scope__Issue
  , Scope__PullRequest
  , Scope__Repository
  , Scope__Team
  , Scope__TeamDiscussion
  )
import Examples.Github.Scalars (Id)
import Data.Maybe (Maybe(..))
import Examples.Github.Enum.SubscriptionState (SubscriptionState)
import Prelude (pure)

id :: SelectionSet Scope__Subscribable Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__Subscribable Boolean
viewerCanSubscribe = selectionForField
                     "viewerCanSubscribe"
                     []
                     graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__Subscribable (Maybe SubscriptionState)
viewerSubscription = selectionForField
                     "viewerSubscription"
                     []
                     graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onCommit :: SelectionSet
                                         Scope__Commit
                                         decodesTo
                           , onIssue :: SelectionSet Scope__Issue decodesTo
                           , onPullRequest :: SelectionSet
                                              Scope__PullRequest
                                              decodesTo
                           , onRepository :: SelectionSet
                                             Scope__Repository
                                             decodesTo
                           , onTeam :: SelectionSet Scope__Team decodesTo
                           , onTeamDiscussion :: SelectionSet
                                                 Scope__TeamDiscussion
                                                 decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__Subscribable
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "Commit"
                         selections.onCommit
                       , buildFragment "Issue" selections.onIssue
                       , buildFragment "PullRequest" selections.onPullRequest
                       , buildFragment "Repository" selections.onRepository
                       , buildFragment "Team" selections.onTeam
                       , buildFragment
                         "TeamDiscussion"
                         selections.onTeamDiscussion
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onCommit: pure
                             Nothing
                 , onIssue: pure
                            Nothing
                 , onPullRequest: pure
                                  Nothing
                 , onRepository: pure
                                 Nothing
                 , onTeam: pure
                           Nothing
                 , onTeamDiscussion: pure
                                     Nothing
                 }
