module Examples.Github.Object.Discussion where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphQLArguments
  )
import Examples.Github.Scopes
  ( Scope__Discussion
  , Scope__DiscussionComment
  , Scope__Actor
  , Scope__DiscussionCategory
  , Scope__DiscussionCommentConnection
  , Scope__LabelConnection
  , Scope__ReactionGroup
  , Scope__ReactionConnection
  , Scope__Repository
  , Scope__UserContentEditConnection
  )
import Data.Maybe (Maybe)
import Examples.Github.Enum.LockReason (LockReason)
import Examples.Github.Scalars (DateTime, Html, Id, Uri)
import Examples.Github.Enum.CommentAuthorAssociation (CommentAuthorAssociation)
import Type.Row (type (+))
import Examples.Github.InputObject (LabelOrder, ReactionOrder) as Examples.Github.InputObject
import Examples.Github.Enum.ReactionContent (ReactionContent)
import Examples.Github.Enum.SubscriptionState (SubscriptionState)

activeLockReason :: SelectionSet Scope__Discussion (Maybe LockReason)
activeLockReason = selectionForField
                   "activeLockReason"
                   []
                   graphqlDefaultResponseScalarDecoder

answer
  :: forall r
   . SelectionSet Scope__DiscussionComment r
  -> SelectionSet Scope__Discussion (Maybe r)
answer = selectionForCompositeField
         "answer"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

answerChosenAt :: SelectionSet Scope__Discussion (Maybe DateTime)
answerChosenAt = selectionForField
                 "answerChosenAt"
                 []
                 graphqlDefaultResponseScalarDecoder

answerChosenBy
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__Discussion (Maybe r)
answerChosenBy = selectionForCompositeField
                 "answerChosenBy"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

author
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__Discussion (Maybe r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__Discussion CommentAuthorAssociation
authorAssociation = selectionForField
                    "authorAssociation"
                    []
                    graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__Discussion String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__Discussion Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__Discussion String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

category
  :: forall r
   . SelectionSet Scope__DiscussionCategory r
  -> SelectionSet Scope__Discussion r
category = selectionForCompositeField
           "category"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CommentsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type CommentsInput = { | CommentsInputRowOptional + () }

comments
  :: forall r
   . CommentsInput
  -> SelectionSet Scope__DiscussionCommentConnection r
  -> SelectionSet Scope__Discussion r
comments input = selectionForCompositeField
                 "comments"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__Discussion DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__Discussion Boolean
createdViaEmail = selectionForField
                  "createdViaEmail"
                  []
                  graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Discussion (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

editor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__Discussion (Maybe r)
editor = selectionForCompositeField
         "editor"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Discussion Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__Discussion Boolean
includesCreatedEdit = selectionForField
                      "includesCreatedEdit"
                      []
                      graphqlDefaultResponseScalarDecoder

type LabelsInputRowOptional r
  = ( orderBy :: Optional Examples.Github.InputObject.LabelOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type LabelsInput = { | LabelsInputRowOptional + () }

labels
  :: forall r
   . LabelsInput
  -> SelectionSet Scope__LabelConnection r
  -> SelectionSet Scope__Discussion (Maybe r)
labels input = selectionForCompositeField
               "labels"
               (toGraphQLArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

lastEditedAt :: SelectionSet Scope__Discussion (Maybe DateTime)
lastEditedAt = selectionForField
               "lastEditedAt"
               []
               graphqlDefaultResponseScalarDecoder

locked :: SelectionSet Scope__Discussion Boolean
locked = selectionForField "locked" [] graphqlDefaultResponseScalarDecoder

number :: SelectionSet Scope__Discussion Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__Discussion (Maybe DateTime)
publishedAt = selectionForField
              "publishedAt"
              []
              graphqlDefaultResponseScalarDecoder

reactionGroups
  :: forall r
   . SelectionSet Scope__ReactionGroup r
  -> SelectionSet Scope__Discussion (Maybe (Array r))
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
  -> SelectionSet Scope__Discussion r
reactions input = selectionForCompositeField
                  "reactions"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__Discussion r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Discussion Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

title :: SelectionSet Scope__Discussion String
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Discussion DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

upvoteCount :: SelectionSet Scope__Discussion Int
upvoteCount = selectionForField
              "upvoteCount"
              []
              graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Discussion Uri
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
  -> SelectionSet Scope__Discussion (Maybe r)
userContentEdits input = selectionForCompositeField
                         "userContentEdits"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanDelete :: SelectionSet Scope__Discussion Boolean
viewerCanDelete = selectionForField
                  "viewerCanDelete"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__Discussion Boolean
viewerCanReact = selectionForField
                 "viewerCanReact"
                 []
                 graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__Discussion Boolean
viewerCanSubscribe = selectionForField
                     "viewerCanSubscribe"
                     []
                     graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__Discussion Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanUpvote :: SelectionSet Scope__Discussion Boolean
viewerCanUpvote = selectionForField
                  "viewerCanUpvote"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__Discussion Boolean
viewerDidAuthor = selectionForField
                  "viewerDidAuthor"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerHasUpvoted :: SelectionSet Scope__Discussion Boolean
viewerHasUpvoted = selectionForField
                   "viewerHasUpvoted"
                   []
                   graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__Discussion (Maybe SubscriptionState)
viewerSubscription = selectionForField
                     "viewerSubscription"
                     []
                     graphqlDefaultResponseScalarDecoder
