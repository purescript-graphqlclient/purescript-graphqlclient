module Dillonkearns.Examples.Github.Interface.UniformResourceLocatable where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__UniformResourceLocatable
  , Scope__Bot
  , Scope__CheckRun
  , Scope__ClosedEvent
  , Scope__Commit
  , Scope__ConvertToDraftEvent
  , Scope__CrossReferencedEvent
  , Scope__Gist
  , Scope__Issue
  , Scope__Mannequin
  , Scope__MergedEvent
  , Scope__Milestone
  , Scope__Organization
  , Scope__PullRequest
  , Scope__PullRequestCommit
  , Scope__ReadyForReviewEvent
  , Scope__Release
  , Scope__Repository
  , Scope__RepositoryTopic
  , Scope__ReviewDismissedEvent
  , Scope__TeamDiscussion
  , Scope__TeamDiscussionComment
  , Scope__User
  )
import Dillonkearns.Examples.Github.Scalars (Uri)
import Data.Maybe (Maybe(..))
import Prelude (pure)

resourcePath :: SelectionSet Scope__UniformResourceLocatable Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__UniformResourceLocatable Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onBot :: SelectionSet Scope__Bot decodesTo
    , onCheckRun :: SelectionSet Scope__CheckRun decodesTo
    , onClosedEvent :: SelectionSet Scope__ClosedEvent decodesTo
    , onCommit :: SelectionSet Scope__Commit decodesTo
    , onConvertToDraftEvent :: SelectionSet Scope__ConvertToDraftEvent decodesTo
    , onCrossReferencedEvent
      :: SelectionSet
         Scope__CrossReferencedEvent
         decodesTo
    , onGist :: SelectionSet Scope__Gist decodesTo
    , onIssue :: SelectionSet Scope__Issue decodesTo
    , onMannequin :: SelectionSet Scope__Mannequin decodesTo
    , onMergedEvent :: SelectionSet Scope__MergedEvent decodesTo
    , onMilestone :: SelectionSet Scope__Milestone decodesTo
    , onOrganization :: SelectionSet Scope__Organization decodesTo
    , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
    , onPullRequestCommit :: SelectionSet Scope__PullRequestCommit decodesTo
    , onReadyForReviewEvent :: SelectionSet Scope__ReadyForReviewEvent decodesTo
    , onRelease :: SelectionSet Scope__Release decodesTo
    , onRepository :: SelectionSet Scope__Repository decodesTo
    , onRepositoryTopic :: SelectionSet Scope__RepositoryTopic decodesTo
    , onReviewDismissedEvent
      :: SelectionSet
         Scope__ReviewDismissedEvent
         decodesTo
    , onTeamDiscussion :: SelectionSet Scope__TeamDiscussion decodesTo
    , onTeamDiscussionComment
      :: SelectionSet
         Scope__TeamDiscussionComment
         decodesTo
    , onUser :: SelectionSet Scope__User decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__UniformResourceLocatable decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Bot" selections.onBot
                       , buildFragment "CheckRun" selections.onCheckRun
                       , buildFragment "ClosedEvent" selections.onClosedEvent
                       , buildFragment "Commit" selections.onCommit
                       , buildFragment
                         "ConvertToDraftEvent"
                         selections.onConvertToDraftEvent
                       , buildFragment
                         "CrossReferencedEvent"
                         selections.onCrossReferencedEvent
                       , buildFragment "Gist" selections.onGist
                       , buildFragment "Issue" selections.onIssue
                       , buildFragment "Mannequin" selections.onMannequin
                       , buildFragment "MergedEvent" selections.onMergedEvent
                       , buildFragment "Milestone" selections.onMilestone
                       , buildFragment "Organization" selections.onOrganization
                       , buildFragment "PullRequest" selections.onPullRequest
                       , buildFragment
                         "PullRequestCommit"
                         selections.onPullRequestCommit
                       , buildFragment
                         "ReadyForReviewEvent"
                         selections.onReadyForReviewEvent
                       , buildFragment "Release" selections.onRelease
                       , buildFragment "Repository" selections.onRepository
                       , buildFragment
                         "RepositoryTopic"
                         selections.onRepositoryTopic
                       , buildFragment
                         "ReviewDismissedEvent"
                         selections.onReviewDismissedEvent
                       , buildFragment
                         "TeamDiscussion"
                         selections.onTeamDiscussion
                       , buildFragment
                         "TeamDiscussionComment"
                         selections.onTeamDiscussionComment
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onBot: pure
                          Nothing
                 , onCheckRun: pure
                               Nothing
                 , onClosedEvent: pure
                                  Nothing
                 , onCommit: pure
                             Nothing
                 , onConvertToDraftEvent: pure
                                          Nothing
                 , onCrossReferencedEvent: pure
                                           Nothing
                 , onGist: pure
                           Nothing
                 , onIssue: pure
                            Nothing
                 , onMannequin: pure
                                Nothing
                 , onMergedEvent: pure
                                  Nothing
                 , onMilestone: pure
                                Nothing
                 , onOrganization: pure
                                   Nothing
                 , onPullRequest: pure
                                  Nothing
                 , onPullRequestCommit: pure
                                        Nothing
                 , onReadyForReviewEvent: pure
                                          Nothing
                 , onRelease: pure
                              Nothing
                 , onRepository: pure
                                 Nothing
                 , onRepositoryTopic: pure
                                      Nothing
                 , onReviewDismissedEvent: pure
                                           Nothing
                 , onTeamDiscussion: pure
                                     Nothing
                 , onTeamDiscussionComment: pure
                                            Nothing
                 , onUser: pure
                           Nothing
                 }
