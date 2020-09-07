module Examples.Github.Interface.Minimizable where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Minimizable
  , Scope__CommitComment
  , Scope__GistComment
  , Scope__IssueComment
  , Scope__PullRequestReviewComment
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

isMinimized :: SelectionSet Scope__Minimizable Boolean
isMinimized = selectionForField
              "isMinimized"
              []
              graphqlDefaultResponseScalarDecoder

minimizedReason :: SelectionSet Scope__Minimizable (Maybe String)
minimizedReason = selectionForField
                  "minimizedReason"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanMinimize :: SelectionSet Scope__Minimizable Boolean
viewerCanMinimize = selectionForField
                    "viewerCanMinimize"
                    []
                    graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onCommitComment :: SelectionSet
                                                Scope__CommitComment
                                                decodesTo
                           , onGistComment :: SelectionSet
                                              Scope__GistComment
                                              decodesTo
                           , onIssueComment :: SelectionSet
                                               Scope__IssueComment
                                               decodesTo
                           , onPullRequestReviewComment :: SelectionSet
                                                           Scope__PullRequestReviewComment
                                                           decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__Minimizable
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "CommitComment"
                         selections.onCommitComment
                       , buildFragment "GistComment" selections.onGistComment
                       , buildFragment "IssueComment" selections.onIssueComment
                       , buildFragment
                         "PullRequestReviewComment"
                         selections.onPullRequestReviewComment
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onCommitComment: pure
                                    Nothing
                 , onGistComment: pure
                                  Nothing
                 , onIssueComment: pure
                                   Nothing
                 , onPullRequestReviewComment: pure
                                               Nothing
                 }
