module Examples.Github.Interface.Updatable where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Updatable
  , Scope__CommitComment
  , Scope__GistComment
  , Scope__Issue
  , Scope__IssueComment
  , Scope__Project
  , Scope__PullRequest
  , Scope__PullRequestReview
  , Scope__PullRequestReviewComment
  , Scope__TeamDiscussion
  , Scope__TeamDiscussionComment
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

viewerCanUpdate :: SelectionSet Scope__Updatable Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onCommitComment :: SelectionSet
                                                Scope__CommitComment
                                                decodesTo
                           , onGistComment :: SelectionSet
                                              Scope__GistComment
                                              decodesTo
                           , onIssue :: SelectionSet Scope__Issue decodesTo
                           , onIssueComment :: SelectionSet
                                               Scope__IssueComment
                                               decodesTo
                           , onProject :: SelectionSet Scope__Project decodesTo
                           , onPullRequest :: SelectionSet
                                              Scope__PullRequest
                                              decodesTo
                           , onPullRequestReview :: SelectionSet
                                                    Scope__PullRequestReview
                                                    decodesTo
                           , onPullRequestReviewComment :: SelectionSet
                                                           Scope__PullRequestReviewComment
                                                           decodesTo
                           , onTeamDiscussion :: SelectionSet
                                                 Scope__TeamDiscussion
                                                 decodesTo
                           , onTeamDiscussionComment :: SelectionSet
                                                        Scope__TeamDiscussionComment
                                                        decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__Updatable
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "CommitComment"
                         selections.onCommitComment
                       , buildFragment "GistComment" selections.onGistComment
                       , buildFragment "Issue" selections.onIssue
                       , buildFragment "IssueComment" selections.onIssueComment
                       , buildFragment "Project" selections.onProject
                       , buildFragment "PullRequest" selections.onPullRequest
                       , buildFragment
                         "PullRequestReview"
                         selections.onPullRequestReview
                       , buildFragment
                         "PullRequestReviewComment"
                         selections.onPullRequestReviewComment
                       , buildFragment
                         "TeamDiscussion"
                         selections.onTeamDiscussion
                       , buildFragment
                         "TeamDiscussionComment"
                         selections.onTeamDiscussionComment
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onCommitComment: pure
                                    Nothing
                 , onGistComment: pure
                                  Nothing
                 , onIssue: pure
                            Nothing
                 , onIssueComment: pure
                                   Nothing
                 , onProject: pure
                              Nothing
                 , onPullRequest: pure
                                  Nothing
                 , onPullRequestReview: pure
                                        Nothing
                 , onPullRequestReviewComment: pure
                                               Nothing
                 , onTeamDiscussion: pure
                                     Nothing
                 , onTeamDiscussionComment: pure
                                            Nothing
                 }
