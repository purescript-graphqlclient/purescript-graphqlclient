module Examples.Github.Object.Issue where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__Issue
  , Scope__UserConnection
  , Scope__Actor
  , Scope__IssueCommentConnection
  , Scope__Hovercard
  , Scope__LabelConnection
  , Scope__Milestone
  , Scope__ProjectCardConnection
  , Scope__ProjectNext
  , Scope__ProjectNextConnection
  , Scope__ReactionGroup
  , Scope__ReactionConnection
  , Scope__Repository
  , Scope__IssueTimelineConnection
  , Scope__IssueTimelineItemsConnection
  , Scope__UserContentEditConnection
  )
import Data.Maybe (Maybe)
import Examples.Github.Enum.LockReason (LockReason)
import Type.Row (type (+))
import Examples.Github.Enum.CommentAuthorAssociation (CommentAuthorAssociation)
import Examples.Github.Scalars (Html, Uri, DateTime, Id)
import Examples.Github.InputObject
  (IssueCommentOrder, LabelOrder, ReactionOrder) as Examples.Github.InputObject
import Examples.Github.Enum.ProjectCardArchivedState (ProjectCardArchivedState)
import Examples.Github.Enum.ProjectNextOrderField (ProjectNextOrderField)
import Examples.Github.Enum.ReactionContent (ReactionContent)
import Examples.Github.Enum.IssueState (IssueState)
import Examples.Github.Enum.IssueTimelineItemsItemType
  (IssueTimelineItemsItemType)
import Examples.Github.Enum.CommentCannotUpdateReason
  (CommentCannotUpdateReason)
import Examples.Github.Enum.SubscriptionState (SubscriptionState)

activeLockReason :: SelectionSet Scope__Issue (Maybe LockReason)
activeLockReason = selectionForField
                   "activeLockReason"
                   []
                   graphqlDefaultResponseScalarDecoder

type AssigneesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type AssigneesInput = { | AssigneesInputRowOptional + () }

assignees
  :: forall r
   . AssigneesInput
  -> SelectionSet Scope__UserConnection r
  -> SelectionSet Scope__Issue r
assignees input = selectionForCompositeField
                  "assignees"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

author
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__Issue (Maybe r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__Issue CommentAuthorAssociation
authorAssociation = selectionForField
                    "authorAssociation"
                    []
                    graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__Issue String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__Issue Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyResourcePath :: SelectionSet Scope__Issue Uri
bodyResourcePath = selectionForField
                   "bodyResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__Issue String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

bodyUrl :: SelectionSet Scope__Issue Uri
bodyUrl = selectionForField "bodyUrl" [] graphqlDefaultResponseScalarDecoder

closed :: SelectionSet Scope__Issue Boolean
closed = selectionForField "closed" [] graphqlDefaultResponseScalarDecoder

closedAt :: SelectionSet Scope__Issue (Maybe DateTime)
closedAt = selectionForField "closedAt" [] graphqlDefaultResponseScalarDecoder

type CommentsInputRowOptional r
  = ( orderBy :: Optional Examples.Github.InputObject.IssueCommentOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type CommentsInput = { | CommentsInputRowOptional + () }

comments
  :: forall r
   . CommentsInput
  -> SelectionSet Scope__IssueCommentConnection r
  -> SelectionSet Scope__Issue r
comments input = selectionForCompositeField
                 "comments"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__Issue DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__Issue Boolean
createdViaEmail = selectionForField
                  "createdViaEmail"
                  []
                  graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Issue (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

editor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__Issue (Maybe r)
editor = selectionForCompositeField
         "editor"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HovercardInputRowOptional r
  = ( includeNotificationContexts :: Optional Boolean | r )

type HovercardInput = { | HovercardInputRowOptional + () }

hovercard
  :: forall r
   . HovercardInput
  -> SelectionSet Scope__Hovercard r
  -> SelectionSet Scope__Issue r
hovercard input = selectionForCompositeField
                  "hovercard"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Issue Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__Issue Boolean
includesCreatedEdit = selectionForField
                      "includesCreatedEdit"
                      []
                      graphqlDefaultResponseScalarDecoder

isPinned :: SelectionSet Scope__Issue (Maybe Boolean)
isPinned = selectionForField "isPinned" [] graphqlDefaultResponseScalarDecoder

isReadByViewer :: SelectionSet Scope__Issue (Maybe Boolean)
isReadByViewer = selectionForField
                 "isReadByViewer"
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
  -> SelectionSet Scope__Issue (Maybe r)
labels input = selectionForCompositeField
               "labels"
               (toGraphQLArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

lastEditedAt :: SelectionSet Scope__Issue (Maybe DateTime)
lastEditedAt = selectionForField
               "lastEditedAt"
               []
               graphqlDefaultResponseScalarDecoder

locked :: SelectionSet Scope__Issue Boolean
locked = selectionForField "locked" [] graphqlDefaultResponseScalarDecoder

milestone
  :: forall r
   . SelectionSet Scope__Milestone r
  -> SelectionSet Scope__Issue (Maybe r)
milestone = selectionForCompositeField
            "milestone"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

number :: SelectionSet Scope__Issue Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

type ParticipantsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type ParticipantsInput = { | ParticipantsInputRowOptional + () }

participants
  :: forall r
   . ParticipantsInput
  -> SelectionSet Scope__UserConnection r
  -> SelectionSet Scope__Issue r
participants input = selectionForCompositeField
                     "participants"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectCardsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , archivedStates :: Optional (Array (Maybe ProjectCardArchivedState))
    | r
    )

type ProjectCardsInput = { | ProjectCardsInputRowOptional + () }

projectCards
  :: forall r
   . ProjectCardsInput
  -> SelectionSet Scope__ProjectCardConnection r
  -> SelectionSet Scope__Issue r
projectCards input = selectionForCompositeField
                     "projectCards"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectNextInputRowRequired r = ( number :: Int | r )

type ProjectNextInput = { | ProjectNextInputRowRequired + () }

projectNext
  :: forall r
   . ProjectNextInput
  -> SelectionSet Scope__ProjectNext r
  -> SelectionSet Scope__Issue (Maybe r)
projectNext input = selectionForCompositeField
                    "projectNext"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectsNextInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , query :: Optional String
    , sortBy :: Optional ProjectNextOrderField
    | r
    )

type ProjectsNextInput = { | ProjectsNextInputRowOptional + () }

projectsNext
  :: forall r
   . ProjectsNextInput
  -> SelectionSet Scope__ProjectNextConnection r
  -> SelectionSet Scope__Issue r
projectsNext input = selectionForCompositeField
                     "projectsNext"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

publishedAt :: SelectionSet Scope__Issue (Maybe DateTime)
publishedAt = selectionForField
              "publishedAt"
              []
              graphqlDefaultResponseScalarDecoder

reactionGroups
  :: forall r
   . SelectionSet Scope__ReactionGroup r
  -> SelectionSet Scope__Issue (Maybe (Array r))
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
  -> SelectionSet Scope__Issue r
reactions input = selectionForCompositeField
                  "reactions"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__Issue r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Issue Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__Issue IssueState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

type TimelineInputRowOptional r
  = ( since :: Optional DateTime
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type TimelineInput = { | TimelineInputRowOptional + () }

timeline
  :: forall r
   . TimelineInput
  -> SelectionSet Scope__IssueTimelineConnection r
  -> SelectionSet Scope__Issue r
timeline input = selectionForCompositeField
                 "timeline"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TimelineItemsInputRowOptional r
  = ( since :: Optional DateTime
    , skip :: Optional Int
    , itemTypes :: Optional (Array IssueTimelineItemsItemType)
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type TimelineItemsInput = { | TimelineItemsInputRowOptional + () }

timelineItems
  :: forall r
   . TimelineItemsInput
  -> SelectionSet Scope__IssueTimelineItemsConnection r
  -> SelectionSet Scope__Issue r
timelineItems input = selectionForCompositeField
                      "timelineItems"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

title :: SelectionSet Scope__Issue String
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

titleHTML :: SelectionSet Scope__Issue String
titleHTML = selectionForField "titleHTML" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Issue DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Issue Uri
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
  -> SelectionSet Scope__Issue (Maybe r)
userContentEdits input = selectionForCompositeField
                         "userContentEdits"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanReact :: SelectionSet Scope__Issue Boolean
viewerCanReact = selectionForField
                 "viewerCanReact"
                 []
                 graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__Issue Boolean
viewerCanSubscribe = selectionForField
                     "viewerCanSubscribe"
                     []
                     graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__Issue Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons
  :: SelectionSet
     Scope__Issue
     (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField
                            "viewerCannotUpdateReasons"
                            []
                            graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__Issue Boolean
viewerDidAuthor = selectionForField
                  "viewerDidAuthor"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__Issue (Maybe SubscriptionState)
viewerSubscription = selectionForField
                     "viewerSubscription"
                     []
                     graphqlDefaultResponseScalarDecoder
