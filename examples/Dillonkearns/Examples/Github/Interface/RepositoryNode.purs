module Dillonkearns.Examples.Github.Interface.RepositoryNode where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__Repository
  , Scope__RepositoryNode
  , Scope__CommitComment
  , Scope__CommitCommentThread
  , Scope__Issue
  , Scope__IssueComment
  , Scope__PullRequest
  , Scope__PullRequestCommitCommentThread
  , Scope__PullRequestReview
  , Scope__PullRequestReviewComment
  , Scope__RepositoryVulnerabilityAlert
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__RepositoryNode r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type Fragments decodesTo
  = { onCommitComment :: SelectionSet Scope__CommitComment decodesTo
    , onCommitCommentThread :: SelectionSet Scope__CommitCommentThread decodesTo
    , onIssue :: SelectionSet Scope__Issue decodesTo
    , onIssueComment :: SelectionSet Scope__IssueComment decodesTo
    , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
    , onPullRequestCommitCommentThread
      :: SelectionSet
         Scope__PullRequestCommitCommentThread
         decodesTo
    , onPullRequestReview :: SelectionSet Scope__PullRequestReview decodesTo
    , onPullRequestReviewComment
      :: SelectionSet
         Scope__PullRequestReviewComment
         decodesTo
    , onRepositoryVulnerabilityAlert
      :: SelectionSet
         Scope__RepositoryVulnerabilityAlert
         decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__RepositoryNode decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "CommitComment"
                         selections.onCommitComment
                       , buildFragment
                         "CommitCommentThread"
                         selections.onCommitCommentThread
                       , buildFragment "Issue" selections.onIssue
                       , buildFragment "IssueComment" selections.onIssueComment
                       , buildFragment "PullRequest" selections.onPullRequest
                       , buildFragment
                         "PullRequestCommitCommentThread"
                         selections.onPullRequestCommitCommentThread
                       , buildFragment
                         "PullRequestReview"
                         selections.onPullRequestReview
                       , buildFragment
                         "PullRequestReviewComment"
                         selections.onPullRequestReviewComment
                       , buildFragment
                         "RepositoryVulnerabilityAlert"
                         selections.onRepositoryVulnerabilityAlert
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onCommitComment: pure
                                    Nothing
                 , onCommitCommentThread: pure
                                          Nothing
                 , onIssue: pure
                            Nothing
                 , onIssueComment: pure
                                   Nothing
                 , onPullRequest: pure
                                  Nothing
                 , onPullRequestCommitCommentThread: pure
                                                     Nothing
                 , onPullRequestReview: pure
                                        Nothing
                 , onPullRequestReviewComment: pure
                                               Nothing
                 , onRepositoryVulnerabilityAlert: pure
                                                   Nothing
                 }
