module Examples.Github.Interface.Comment where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , toGraphQLArguments
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__Comment
  , Scope__UserContentEditConnection
  , Scope__CommitComment
  , Scope__Discussion
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
import Data.Maybe (Maybe(..))
import Examples.Github.Enum.CommentAuthorAssociation (CommentAuthorAssociation)
import Examples.Github.Scalars (Html, DateTime, Id)
import Type.Row (type (+))
import Prelude (pure)

author
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__Comment (Maybe r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__Comment CommentAuthorAssociation
authorAssociation = selectionForField
                    "authorAssociation"
                    []
                    graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__Comment String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__Comment Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__Comment String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Comment DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__Comment Boolean
createdViaEmail = selectionForField
                  "createdViaEmail"
                  []
                  graphqlDefaultResponseScalarDecoder

editor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__Comment (Maybe r)
editor = selectionForCompositeField
         "editor"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Comment Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__Comment Boolean
includesCreatedEdit = selectionForField
                      "includesCreatedEdit"
                      []
                      graphqlDefaultResponseScalarDecoder

lastEditedAt :: SelectionSet Scope__Comment (Maybe DateTime)
lastEditedAt = selectionForField
               "lastEditedAt"
               []
               graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__Comment (Maybe DateTime)
publishedAt = selectionForField
              "publishedAt"
              []
              graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Comment DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

type UserContentEditsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type UserContentEditsInput = { | UserContentEditsInputRowOptional + () }

userContentEdits
  :: forall r
   . UserContentEditsInput
  -> SelectionSet Scope__UserContentEditConnection r
  -> SelectionSet Scope__Comment (Maybe r)
userContentEdits input = selectionForCompositeField
                         "userContentEdits"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerDidAuthor :: SelectionSet Scope__Comment Boolean
viewerDidAuthor = selectionForField
                  "viewerDidAuthor"
                  []
                  graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onCommitComment :: SelectionSet Scope__CommitComment decodesTo
    , onDiscussion :: SelectionSet Scope__Discussion decodesTo
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
  -> SelectionSet Scope__Comment decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "CommitComment"
                         selections.onCommitComment
                       , buildFragment "Discussion" selections.onDiscussion
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
                 , onDiscussion: pure
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
