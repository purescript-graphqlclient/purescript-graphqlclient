module Examples.Github.Interface.UpdatableComment where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__UpdatableComment
  , Scope__CommitComment
  , Scope__DiscussionComment
  , Scope__GistComment
  , Scope__Issue
  , Scope__IssueComment
  , Scope__PullRequest
  , Scope__PullRequestReview
  , Scope__PullRequestReviewComment
  , Scope__TeamDiscussion
  , Scope__TeamDiscussionComment
  )
import Examples.Github.Enum.CommentCannotUpdateReason
  (CommentCannotUpdateReason)
import Data.Maybe (Maybe(..))
import Prelude (pure)

viewerCannotUpdateReasons
  :: SelectionSet
     Scope__UpdatableComment
     (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField
                            "viewerCannotUpdateReasons"
                            []
                            graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onCommitComment :: SelectionSet Scope__CommitComment decodesTo
    , onDiscussionComment :: SelectionSet Scope__DiscussionComment decodesTo
    , onGistComment :: SelectionSet Scope__GistComment decodesTo
    , onIssue :: SelectionSet Scope__Issue decodesTo
    , onIssueComment :: SelectionSet Scope__IssueComment decodesTo
    , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
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
  -> SelectionSet Scope__UpdatableComment decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "CommitComment"
                         selections.onCommitComment
                       , buildFragment
                         "DiscussionComment"
                         selections.onDiscussionComment
                       , buildFragment "GistComment" selections.onGistComment
                       , buildFragment "Issue" selections.onIssue
                       , buildFragment "IssueComment" selections.onIssueComment
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

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onCommitComment: pure
                                    Nothing
                 , onDiscussionComment: pure
                                        Nothing
                 , onGistComment: pure
                                  Nothing
                 , onIssue: pure
                            Nothing
                 , onIssueComment: pure
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
