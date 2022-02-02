module Examples.Github.Object.DiscussionComment where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , toGraphQLArguments
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__DiscussionComment
  , Scope__Discussion
  , Scope__ReactionGroup
  , Scope__ReactionConnection
  , Scope__DiscussionCommentConnection
  , Scope__UserContentEditConnection
  )
import Data.Maybe (Maybe)
import Examples.Github.Enum.CommentAuthorAssociation (CommentAuthorAssociation)
import Examples.Github.Scalars (Html, DateTime, Id, Uri)
import Examples.Github.Enum.ReactionContent (ReactionContent)
import Examples.Github.InputObject (ReactionOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Examples.Github.Enum.CommentCannotUpdateReason
  (CommentCannotUpdateReason)

author
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__DiscussionComment (Maybe r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation
  :: SelectionSet
     Scope__DiscussionComment
     CommentAuthorAssociation
authorAssociation = selectionForField
                    "authorAssociation"
                    []
                    graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__DiscussionComment String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__DiscussionComment Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__DiscussionComment String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__DiscussionComment DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__DiscussionComment Boolean
createdViaEmail = selectionForField
                  "createdViaEmail"
                  []
                  graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__DiscussionComment (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

deletedAt :: SelectionSet Scope__DiscussionComment (Maybe DateTime)
deletedAt = selectionForField "deletedAt" [] graphqlDefaultResponseScalarDecoder

discussion
  :: forall r
   . SelectionSet Scope__Discussion r
  -> SelectionSet Scope__DiscussionComment (Maybe r)
discussion = selectionForCompositeField
             "discussion"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

editor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__DiscussionComment (Maybe r)
editor = selectionForCompositeField
         "editor"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__DiscussionComment Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__DiscussionComment Boolean
includesCreatedEdit = selectionForField
                      "includesCreatedEdit"
                      []
                      graphqlDefaultResponseScalarDecoder

isAnswer :: SelectionSet Scope__DiscussionComment Boolean
isAnswer = selectionForField "isAnswer" [] graphqlDefaultResponseScalarDecoder

isMinimized :: SelectionSet Scope__DiscussionComment Boolean
isMinimized = selectionForField
              "isMinimized"
              []
              graphqlDefaultResponseScalarDecoder

lastEditedAt :: SelectionSet Scope__DiscussionComment (Maybe DateTime)
lastEditedAt = selectionForField
               "lastEditedAt"
               []
               graphqlDefaultResponseScalarDecoder

minimizedReason :: SelectionSet Scope__DiscussionComment (Maybe String)
minimizedReason = selectionForField
                  "minimizedReason"
                  []
                  graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__DiscussionComment (Maybe DateTime)
publishedAt = selectionForField
              "publishedAt"
              []
              graphqlDefaultResponseScalarDecoder

reactionGroups
  :: forall r
   . SelectionSet Scope__ReactionGroup r
  -> SelectionSet Scope__DiscussionComment (Maybe (Array r))
reactionGroups = selectionForCompositeField
                 "reactionGroups"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReactionsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , content :: Optional ReactionContent
    , orderBy :: Optional Examples.Github.InputObject.ReactionOrder
    | r
    )

type ReactionsInput = { | ReactionsInputRowOptional + () }

reactions
  :: forall r
   . ReactionsInput
  -> SelectionSet Scope__ReactionConnection r
  -> SelectionSet Scope__DiscussionComment r
reactions input = selectionForCompositeField
                  "reactions"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepliesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type RepliesInput = { | RepliesInputRowOptional + () }

replies
  :: forall r
   . RepliesInput
  -> SelectionSet Scope__DiscussionCommentConnection r
  -> SelectionSet Scope__DiscussionComment r
replies input = selectionForCompositeField
                "replies"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

replyTo
  :: forall r
   . SelectionSet Scope__DiscussionComment r
  -> SelectionSet Scope__DiscussionComment (Maybe r)
replyTo = selectionForCompositeField
          "replyTo"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__DiscussionComment Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__DiscussionComment DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

upvoteCount :: SelectionSet Scope__DiscussionComment Int
upvoteCount = selectionForField
              "upvoteCount"
              []
              graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__DiscussionComment Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

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
  -> SelectionSet Scope__DiscussionComment (Maybe r)
userContentEdits input = selectionForCompositeField
                         "userContentEdits"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanDelete :: SelectionSet Scope__DiscussionComment Boolean
viewerCanDelete = selectionForField
                  "viewerCanDelete"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanMarkAsAnswer :: SelectionSet Scope__DiscussionComment Boolean
viewerCanMarkAsAnswer = selectionForField
                        "viewerCanMarkAsAnswer"
                        []
                        graphqlDefaultResponseScalarDecoder

viewerCanMinimize :: SelectionSet Scope__DiscussionComment Boolean
viewerCanMinimize = selectionForField
                    "viewerCanMinimize"
                    []
                    graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__DiscussionComment Boolean
viewerCanReact = selectionForField
                 "viewerCanReact"
                 []
                 graphqlDefaultResponseScalarDecoder

viewerCanUnmarkAsAnswer :: SelectionSet Scope__DiscussionComment Boolean
viewerCanUnmarkAsAnswer = selectionForField
                          "viewerCanUnmarkAsAnswer"
                          []
                          graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__DiscussionComment Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanUpvote :: SelectionSet Scope__DiscussionComment Boolean
viewerCanUpvote = selectionForField
                  "viewerCanUpvote"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons
  :: SelectionSet
     Scope__DiscussionComment
     (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField
                            "viewerCannotUpdateReasons"
                            []
                            graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__DiscussionComment Boolean
viewerDidAuthor = selectionForField
                  "viewerDidAuthor"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerHasUpvoted :: SelectionSet Scope__DiscussionComment Boolean
viewerHasUpvoted = selectionForField
                   "viewerHasUpvoted"
                   []
                   graphqlDefaultResponseScalarDecoder
