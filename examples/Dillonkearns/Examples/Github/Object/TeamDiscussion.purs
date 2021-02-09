module Dillonkearns.Examples.Github.Object.TeamDiscussion where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , toGraphQLArguments
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__Actor
  , Scope__TeamDiscussion
  , Scope__TeamDiscussionCommentConnection
  , Scope__ReactionGroup
  , Scope__ReactionConnection
  , Scope__Team
  , Scope__UserContentEditConnection
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Enum.CommentAuthorAssociation
  (CommentAuthorAssociation)
import Dillonkearns.Examples.Github.Scalars (Html, Uri, DateTime, Id)
import Dillonkearns.Examples.Github.InputObject
  (TeamDiscussionCommentOrder, ReactionOrder) as Dillonkearns.Examples.Github.InputObject
import Type.Row (type (+))
import Dillonkearns.Examples.Github.Enum.ReactionContent (ReactionContent)
import Dillonkearns.Examples.Github.Enum.CommentCannotUpdateReason
  (CommentCannotUpdateReason)
import Dillonkearns.Examples.Github.Enum.SubscriptionState (SubscriptionState)

author
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__TeamDiscussion (Maybe r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__TeamDiscussion CommentAuthorAssociation
authorAssociation = selectionForField
                    "authorAssociation"
                    []
                    graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__TeamDiscussion String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__TeamDiscussion Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__TeamDiscussion String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

bodyVersion :: SelectionSet Scope__TeamDiscussion String
bodyVersion = selectionForField
              "bodyVersion"
              []
              graphqlDefaultResponseScalarDecoder

type CommentsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy
      :: Optional
         Dillonkearns.Examples.Github.InputObject.TeamDiscussionCommentOrder
    , fromComment :: Optional Int
    | r
    )

type CommentsInput = { | CommentsInputRowOptional + () }

comments
  :: forall r
   . CommentsInput
  -> SelectionSet Scope__TeamDiscussionCommentConnection r
  -> SelectionSet Scope__TeamDiscussion r
comments input = selectionForCompositeField
                 "comments"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commentsResourcePath :: SelectionSet Scope__TeamDiscussion Uri
commentsResourcePath = selectionForField
                       "commentsResourcePath"
                       []
                       graphqlDefaultResponseScalarDecoder

commentsUrl :: SelectionSet Scope__TeamDiscussion Uri
commentsUrl = selectionForField
              "commentsUrl"
              []
              graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__TeamDiscussion DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__TeamDiscussion Boolean
createdViaEmail = selectionForField
                  "createdViaEmail"
                  []
                  graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__TeamDiscussion (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

editor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__TeamDiscussion (Maybe r)
editor = selectionForCompositeField
         "editor"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__TeamDiscussion Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__TeamDiscussion Boolean
includesCreatedEdit = selectionForField
                      "includesCreatedEdit"
                      []
                      graphqlDefaultResponseScalarDecoder

isPinned :: SelectionSet Scope__TeamDiscussion Boolean
isPinned = selectionForField "isPinned" [] graphqlDefaultResponseScalarDecoder

isPrivate :: SelectionSet Scope__TeamDiscussion Boolean
isPrivate = selectionForField "isPrivate" [] graphqlDefaultResponseScalarDecoder

lastEditedAt :: SelectionSet Scope__TeamDiscussion (Maybe DateTime)
lastEditedAt = selectionForField
               "lastEditedAt"
               []
               graphqlDefaultResponseScalarDecoder

number :: SelectionSet Scope__TeamDiscussion Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__TeamDiscussion (Maybe DateTime)
publishedAt = selectionForField
              "publishedAt"
              []
              graphqlDefaultResponseScalarDecoder

reactionGroups
  :: forall r
   . SelectionSet Scope__ReactionGroup r
  -> SelectionSet Scope__TeamDiscussion (Maybe (Array r))
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
    , orderBy :: Optional Dillonkearns.Examples.Github.InputObject.ReactionOrder
    | r
    )

type ReactionsInput = { | ReactionsInputRowOptional + () }

reactions
  :: forall r
   . ReactionsInput
  -> SelectionSet Scope__ReactionConnection r
  -> SelectionSet Scope__TeamDiscussion r
reactions input = selectionForCompositeField
                  "reactions"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__TeamDiscussion Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

team
  :: forall r
   . SelectionSet Scope__Team r
  -> SelectionSet Scope__TeamDiscussion r
team = selectionForCompositeField
       "team"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

title :: SelectionSet Scope__TeamDiscussion String
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__TeamDiscussion DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__TeamDiscussion Uri
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
  -> SelectionSet Scope__TeamDiscussion (Maybe r)
userContentEdits input = selectionForCompositeField
                         "userContentEdits"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanDelete :: SelectionSet Scope__TeamDiscussion Boolean
viewerCanDelete = selectionForField
                  "viewerCanDelete"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanPin :: SelectionSet Scope__TeamDiscussion Boolean
viewerCanPin = selectionForField
               "viewerCanPin"
               []
               graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__TeamDiscussion Boolean
viewerCanReact = selectionForField
                 "viewerCanReact"
                 []
                 graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__TeamDiscussion Boolean
viewerCanSubscribe = selectionForField
                     "viewerCanSubscribe"
                     []
                     graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__TeamDiscussion Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons
  :: SelectionSet
     Scope__TeamDiscussion
     (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField
                            "viewerCannotUpdateReasons"
                            []
                            graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__TeamDiscussion Boolean
viewerDidAuthor = selectionForField
                  "viewerDidAuthor"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerSubscription
  :: SelectionSet
     Scope__TeamDiscussion
     (Maybe SubscriptionState)
viewerSubscription = selectionForField
                     "viewerSubscription"
                     []
                     graphqlDefaultResponseScalarDecoder
