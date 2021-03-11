module Examples.Github.Interface.Deletable where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Deletable
  , Scope__CommitComment
  , Scope__GistComment
  , Scope__IssueComment
  , Scope__PullRequestReview
  , Scope__PullRequestReviewComment
  , Scope__TeamDiscussion
  , Scope__TeamDiscussionComment
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

viewerCanDelete :: SelectionSet Scope__Deletable Boolean
viewerCanDelete = selectionForField
                  "viewerCanDelete"
                  []
                  graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onCommitComment :: SelectionSet Scope__CommitComment decodesTo
    , onGistComment :: SelectionSet Scope__GistComment decodesTo
    , onIssueComment :: SelectionSet Scope__IssueComment decodesTo
    , onPullRequestReview :: SelectionSet Scope__PullRequestReview decodesTo
    , onPullRequestReviewComment
      :: SelectionSet
         Scope__PullRequestReviewComment
         decodesTo
    , onTeamDiscussion :: SelectionSet Scope__TeamDiscussion decodesTo
    , onTeamDiscussionComment
      :: SelectionSet
         Scope__TeamDiscussionComment
         decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__Deletable decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "CommitComment"
                         selections.onCommitComment
                       , buildFragment "GistComment" selections.onGistComment
                       , buildFragment "IssueComment" selections.onIssueComment
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

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onCommitComment: pure
                                    Nothing
                 , onGistComment: pure
                                  Nothing
                 , onIssueComment: pure
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
