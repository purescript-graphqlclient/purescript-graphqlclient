module Examples.Github.Object.PullRequest where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__PullRequest
  , Scope__UserConnection
  , Scope__Actor
  , Scope__Ref
  , Scope__Repository
  , Scope__IssueCommentConnection
  , Scope__PullRequestCommitConnection
  , Scope__PullRequestChangedFileConnection
  , Scope__RepositoryOwner
  , Scope__Hovercard
  , Scope__LabelConnection
  , Scope__Commit
  , Scope__Milestone
  , Scope__ProjectCardConnection
  , Scope__ReactionGroup
  , Scope__ReactionConnection
  , Scope__ReviewRequestConnection
  , Scope__PullRequestReviewThreadConnection
  , Scope__PullRequestReviewConnection
  , Scope__SuggestedReviewer
  , Scope__PullRequestTimelineConnection
  , Scope__PullRequestTimelineItemsConnection
  , Scope__UserContentEditConnection
  )
import Data.Maybe (Maybe)
import Examples.Github.Enum.LockReason (LockReason)
import Type.Row (type (+))
import Examples.Github.Enum.CommentAuthorAssociation (CommentAuthorAssociation)
import Examples.Github.Scalars (GitObjectId, Html, Uri, DateTime, Id)
import Examples.Github.InputObject (LabelOrder, ReactionOrder) as Examples.Github.InputObject
import Examples.Github.Enum.MergeableState (MergeableState)
import Examples.Github.Enum.ProjectCardArchivedState (ProjectCardArchivedState)
import Examples.Github.Enum.ReactionContent (ReactionContent)
import Examples.Github.Enum.PullRequestReviewDecision
  (PullRequestReviewDecision)
import Examples.Github.Enum.PullRequestReviewState (PullRequestReviewState)
import Examples.Github.Enum.PullRequestState (PullRequestState)
import Examples.Github.Enum.PullRequestTimelineItemsItemType
  (PullRequestTimelineItemsItemType)
import Examples.Github.Enum.CommentCannotUpdateReason
  (CommentCannotUpdateReason)
import Examples.Github.Enum.SubscriptionState (SubscriptionState)

activeLockReason :: SelectionSet Scope__PullRequest (Maybe LockReason)
activeLockReason = selectionForField
                   "activeLockReason"
                   []
                   graphqlDefaultResponseScalarDecoder

additions :: SelectionSet Scope__PullRequest Int
additions = selectionForField "additions" [] graphqlDefaultResponseScalarDecoder

type AssigneesInputRowOptional r = ( after :: Optional String
                                   , before :: Optional String
                                   , first :: Optional Int
                                   , last :: Optional Int
                                   | r
                                   )

type AssigneesInput = { | AssigneesInputRowOptional + () }

assignees :: forall r . AssigneesInput -> SelectionSet
                                          Scope__UserConnection
                                          r -> SelectionSet
                                               Scope__PullRequest
                                               r
assignees input = selectionForCompositeField
                  "assignees"
                  (toGraphqlArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

author :: forall r . SelectionSet
                     Scope__Actor
                     r -> SelectionSet
                          Scope__PullRequest
                          (Maybe
                           r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__PullRequest CommentAuthorAssociation
authorAssociation = selectionForField
                    "authorAssociation"
                    []
                    graphqlDefaultResponseScalarDecoder

baseRef :: forall r . SelectionSet
                      Scope__Ref
                      r -> SelectionSet
                           Scope__PullRequest
                           (Maybe
                            r)
baseRef = selectionForCompositeField
          "baseRef"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

baseRefName :: SelectionSet Scope__PullRequest String
baseRefName = selectionForField
              "baseRefName"
              []
              graphqlDefaultResponseScalarDecoder

baseRefOid :: SelectionSet Scope__PullRequest GitObjectId
baseRefOid = selectionForField
             "baseRefOid"
             []
             graphqlDefaultResponseScalarDecoder

baseRepository :: forall r . SelectionSet
                             Scope__Repository
                             r -> SelectionSet
                                  Scope__PullRequest
                                  (Maybe
                                   r)
baseRepository = selectionForCompositeField
                 "baseRepository"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

body :: SelectionSet Scope__PullRequest String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__PullRequest Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__PullRequest String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

changedFiles :: SelectionSet Scope__PullRequest Int
changedFiles = selectionForField
               "changedFiles"
               []
               graphqlDefaultResponseScalarDecoder

checksResourcePath :: SelectionSet Scope__PullRequest Uri
checksResourcePath = selectionForField
                     "checksResourcePath"
                     []
                     graphqlDefaultResponseScalarDecoder

checksUrl :: SelectionSet Scope__PullRequest Uri
checksUrl = selectionForField "checksUrl" [] graphqlDefaultResponseScalarDecoder

closed :: SelectionSet Scope__PullRequest Boolean
closed = selectionForField "closed" [] graphqlDefaultResponseScalarDecoder

closedAt :: SelectionSet Scope__PullRequest (Maybe DateTime)
closedAt = selectionForField "closedAt" [] graphqlDefaultResponseScalarDecoder

type CommentsInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type CommentsInput = { | CommentsInputRowOptional + () }

comments :: forall r . CommentsInput -> SelectionSet
                                        Scope__IssueCommentConnection
                                        r -> SelectionSet
                                             Scope__PullRequest
                                             r
comments input = selectionForCompositeField
                 "comments"
                 (toGraphqlArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CommitsInputRowOptional r = ( after :: Optional String
                                 , before :: Optional String
                                 , first :: Optional Int
                                 , last :: Optional Int
                                 | r
                                 )

type CommitsInput = { | CommitsInputRowOptional + () }

commits :: forall r . CommitsInput -> SelectionSet
                                      Scope__PullRequestCommitConnection
                                      r -> SelectionSet
                                           Scope__PullRequest
                                           r
commits input = selectionForCompositeField
                "commits"
                (toGraphqlArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__PullRequest DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__PullRequest Boolean
createdViaEmail = selectionForField
                  "createdViaEmail"
                  []
                  graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__PullRequest (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

deletions :: SelectionSet Scope__PullRequest Int
deletions = selectionForField "deletions" [] graphqlDefaultResponseScalarDecoder

editor :: forall r . SelectionSet
                     Scope__Actor
                     r -> SelectionSet
                          Scope__PullRequest
                          (Maybe
                           r)
editor = selectionForCompositeField
         "editor"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type FilesInputRowOptional r = ( after :: Optional String
                               , before :: Optional String
                               , first :: Optional Int
                               , last :: Optional Int
                               | r
                               )

type FilesInput = { | FilesInputRowOptional + () }

files :: forall r . FilesInput -> SelectionSet
                                  Scope__PullRequestChangedFileConnection
                                  r -> SelectionSet
                                       Scope__PullRequest
                                       (Maybe
                                        r)
files input = selectionForCompositeField
              "files"
              (toGraphqlArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

headRef :: forall r . SelectionSet
                      Scope__Ref
                      r -> SelectionSet
                           Scope__PullRequest
                           (Maybe
                            r)
headRef = selectionForCompositeField
          "headRef"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

headRefName :: SelectionSet Scope__PullRequest String
headRefName = selectionForField
              "headRefName"
              []
              graphqlDefaultResponseScalarDecoder

headRefOid :: SelectionSet Scope__PullRequest GitObjectId
headRefOid = selectionForField
             "headRefOid"
             []
             graphqlDefaultResponseScalarDecoder

headRepository :: forall r . SelectionSet
                             Scope__Repository
                             r -> SelectionSet
                                  Scope__PullRequest
                                  (Maybe
                                   r)
headRepository = selectionForCompositeField
                 "headRepository"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

headRepositoryOwner :: forall r . SelectionSet
                                  Scope__RepositoryOwner
                                  r -> SelectionSet
                                       Scope__PullRequest
                                       (Maybe
                                        r)
headRepositoryOwner = selectionForCompositeField
                      "headRepositoryOwner"
                      []
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HovercardInputRowOptional r = ( includeNotificationContexts :: Optional
                                                                    Boolean
                                   | r
                                   )

type HovercardInput = { | HovercardInputRowOptional + () }

hovercard :: forall r . HovercardInput -> SelectionSet
                                          Scope__Hovercard
                                          r -> SelectionSet
                                               Scope__PullRequest
                                               r
hovercard input = selectionForCompositeField
                  "hovercard"
                  (toGraphqlArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__PullRequest Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__PullRequest Boolean
includesCreatedEdit = selectionForField
                      "includesCreatedEdit"
                      []
                      graphqlDefaultResponseScalarDecoder

isCrossRepository :: SelectionSet Scope__PullRequest Boolean
isCrossRepository = selectionForField
                    "isCrossRepository"
                    []
                    graphqlDefaultResponseScalarDecoder

isDraft :: SelectionSet Scope__PullRequest Boolean
isDraft = selectionForField "isDraft" [] graphqlDefaultResponseScalarDecoder

type LabelsInputRowOptional r = ( orderBy :: Optional
                                             Examples.Github.InputObject.LabelOrder
                                , after :: Optional String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                | r
                                )

type LabelsInput = { | LabelsInputRowOptional + () }

labels :: forall r . LabelsInput -> SelectionSet
                                    Scope__LabelConnection
                                    r -> SelectionSet
                                         Scope__PullRequest
                                         (Maybe
                                          r)
labels input = selectionForCompositeField
               "labels"
               (toGraphqlArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

lastEditedAt :: SelectionSet Scope__PullRequest (Maybe DateTime)
lastEditedAt = selectionForField
               "lastEditedAt"
               []
               graphqlDefaultResponseScalarDecoder

locked :: SelectionSet Scope__PullRequest Boolean
locked = selectionForField "locked" [] graphqlDefaultResponseScalarDecoder

maintainerCanModify :: SelectionSet Scope__PullRequest Boolean
maintainerCanModify = selectionForField
                      "maintainerCanModify"
                      []
                      graphqlDefaultResponseScalarDecoder

mergeCommit :: forall r . SelectionSet
                          Scope__Commit
                          r -> SelectionSet
                               Scope__PullRequest
                               (Maybe
                                r)
mergeCommit = selectionForCompositeField
              "mergeCommit"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mergeable :: SelectionSet Scope__PullRequest MergeableState
mergeable = selectionForField "mergeable" [] graphqlDefaultResponseScalarDecoder

merged :: SelectionSet Scope__PullRequest Boolean
merged = selectionForField "merged" [] graphqlDefaultResponseScalarDecoder

mergedAt :: SelectionSet Scope__PullRequest (Maybe DateTime)
mergedAt = selectionForField "mergedAt" [] graphqlDefaultResponseScalarDecoder

mergedBy :: forall r . SelectionSet
                       Scope__Actor
                       r -> SelectionSet
                            Scope__PullRequest
                            (Maybe
                             r)
mergedBy = selectionForCompositeField
           "mergedBy"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

milestone :: forall r . SelectionSet
                        Scope__Milestone
                        r -> SelectionSet
                             Scope__PullRequest
                             (Maybe
                              r)
milestone = selectionForCompositeField
            "milestone"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

number :: SelectionSet Scope__PullRequest Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

type ParticipantsInputRowOptional r = ( after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type ParticipantsInput = { | ParticipantsInputRowOptional + () }

participants :: forall r . ParticipantsInput -> SelectionSet
                                                Scope__UserConnection
                                                r -> SelectionSet
                                                     Scope__PullRequest
                                                     r
participants input = selectionForCompositeField
                     "participants"
                     (toGraphqlArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

permalink :: SelectionSet Scope__PullRequest Uri
permalink = selectionForField "permalink" [] graphqlDefaultResponseScalarDecoder

potentialMergeCommit :: forall r . SelectionSet
                                   Scope__Commit
                                   r -> SelectionSet
                                        Scope__PullRequest
                                        (Maybe
                                         r)
potentialMergeCommit = selectionForCompositeField
                       "potentialMergeCommit"
                       []
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectCardsInputRowOptional r = ( after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      , archivedStates :: Optional
                                                          (Array
                                                           (Maybe
                                                            ProjectCardArchivedState))
                                      | r
                                      )

type ProjectCardsInput = { | ProjectCardsInputRowOptional + () }

projectCards :: forall r . ProjectCardsInput -> SelectionSet
                                                Scope__ProjectCardConnection
                                                r -> SelectionSet
                                                     Scope__PullRequest
                                                     r
projectCards input = selectionForCompositeField
                     "projectCards"
                     (toGraphqlArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

publishedAt :: SelectionSet Scope__PullRequest (Maybe DateTime)
publishedAt = selectionForField
              "publishedAt"
              []
              graphqlDefaultResponseScalarDecoder

reactionGroups :: forall r . SelectionSet
                             Scope__ReactionGroup
                             r -> SelectionSet
                                  Scope__PullRequest
                                  (Maybe
                                   (Array
                                    r))
reactionGroups = selectionForCompositeField
                 "reactionGroups"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReactionsInputRowOptional r = ( after :: Optional String
                                   , before :: Optional String
                                   , first :: Optional Int
                                   , last :: Optional Int
                                   , content :: Optional ReactionContent
                                   , orderBy :: Optional
                                                Examples.Github.InputObject.ReactionOrder
                                   | r
                                   )

type ReactionsInput = { | ReactionsInputRowOptional + () }

reactions :: forall r . ReactionsInput -> SelectionSet
                                          Scope__ReactionConnection
                                          r -> SelectionSet
                                               Scope__PullRequest
                                               r
reactions input = selectionForCompositeField
                  "reactions"
                  (toGraphqlArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__PullRequest
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__PullRequest Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

revertResourcePath :: SelectionSet Scope__PullRequest Uri
revertResourcePath = selectionForField
                     "revertResourcePath"
                     []
                     graphqlDefaultResponseScalarDecoder

revertUrl :: SelectionSet Scope__PullRequest Uri
revertUrl = selectionForField "revertUrl" [] graphqlDefaultResponseScalarDecoder

reviewDecision :: SelectionSet
                  Scope__PullRequest
                  (Maybe
                   PullRequestReviewDecision)
reviewDecision = selectionForField
                 "reviewDecision"
                 []
                 graphqlDefaultResponseScalarDecoder

type ReviewRequestsInputRowOptional r = ( after :: Optional String
                                        , before :: Optional String
                                        , first :: Optional Int
                                        , last :: Optional Int
                                        | r
                                        )

type ReviewRequestsInput = { | ReviewRequestsInputRowOptional + () }

reviewRequests :: forall r . ReviewRequestsInput -> SelectionSet
                                                    Scope__ReviewRequestConnection
                                                    r -> SelectionSet
                                                         Scope__PullRequest
                                                         (Maybe
                                                          r)
reviewRequests input = selectionForCompositeField
                       "reviewRequests"
                       (toGraphqlArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReviewThreadsInputRowOptional r = ( after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type ReviewThreadsInput = { | ReviewThreadsInputRowOptional + () }

reviewThreads :: forall r . ReviewThreadsInput -> SelectionSet
                                                  Scope__PullRequestReviewThreadConnection
                                                  r -> SelectionSet
                                                       Scope__PullRequest
                                                       r
reviewThreads input = selectionForCompositeField
                      "reviewThreads"
                      (toGraphqlArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReviewsInputRowOptional r = ( after :: Optional String
                                 , before :: Optional String
                                 , first :: Optional Int
                                 , last :: Optional Int
                                 , states :: Optional
                                             (Array
                                              PullRequestReviewState)
                                 , author :: Optional String
                                 | r
                                 )

type ReviewsInput = { | ReviewsInputRowOptional + () }

reviews :: forall r . ReviewsInput -> SelectionSet
                                      Scope__PullRequestReviewConnection
                                      r -> SelectionSet
                                           Scope__PullRequest
                                           (Maybe
                                            r)
reviews input = selectionForCompositeField
                "reviews"
                (toGraphqlArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

state :: SelectionSet Scope__PullRequest PullRequestState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

suggestedReviewers :: forall r . SelectionSet
                                 Scope__SuggestedReviewer
                                 r -> SelectionSet
                                      Scope__PullRequest
                                      (Array
                                       (Maybe
                                        r))
suggestedReviewers = selectionForCompositeField
                     "suggestedReviewers"
                     []
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TimelineInputRowOptional r = ( since :: Optional DateTime
                                  , after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type TimelineInput = { | TimelineInputRowOptional + () }

timeline :: forall r . TimelineInput -> SelectionSet
                                        Scope__PullRequestTimelineConnection
                                        r -> SelectionSet
                                             Scope__PullRequest
                                             r
timeline input = selectionForCompositeField
                 "timeline"
                 (toGraphqlArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TimelineItemsInputRowOptional r = ( since :: Optional DateTime
                                       , skip :: Optional Int
                                       , itemTypes :: Optional
                                                      (Array
                                                       PullRequestTimelineItemsItemType)
                                       , after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type TimelineItemsInput = { | TimelineItemsInputRowOptional + () }

timelineItems :: forall r . TimelineItemsInput -> SelectionSet
                                                  Scope__PullRequestTimelineItemsConnection
                                                  r -> SelectionSet
                                                       Scope__PullRequest
                                                       r
timelineItems input = selectionForCompositeField
                      "timelineItems"
                      (toGraphqlArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

title :: SelectionSet Scope__PullRequest String
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__PullRequest DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__PullRequest Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type UserContentEditsInputRowOptional r = ( after :: Optional String
                                          , before :: Optional String
                                          , first :: Optional Int
                                          , last :: Optional Int
                                          | r
                                          )

type UserContentEditsInput = { | UserContentEditsInputRowOptional + () }

userContentEdits :: forall r . UserContentEditsInput -> SelectionSet
                                                        Scope__UserContentEditConnection
                                                        r -> SelectionSet
                                                             Scope__PullRequest
                                                             (Maybe
                                                              r)
userContentEdits input = selectionForCompositeField
                         "userContentEdits"
                         (toGraphqlArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanApplySuggestion :: SelectionSet Scope__PullRequest Boolean
viewerCanApplySuggestion = selectionForField
                           "viewerCanApplySuggestion"
                           []
                           graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__PullRequest Boolean
viewerCanReact = selectionForField
                 "viewerCanReact"
                 []
                 graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__PullRequest Boolean
viewerCanSubscribe = selectionForField
                     "viewerCanSubscribe"
                     []
                     graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__PullRequest Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons :: SelectionSet
                             Scope__PullRequest
                             (Array
                              CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField
                            "viewerCannotUpdateReasons"
                            []
                            graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__PullRequest Boolean
viewerDidAuthor = selectionForField
                  "viewerDidAuthor"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__PullRequest (Maybe SubscriptionState)
viewerSubscription = selectionForField
                     "viewerSubscription"
                     []
                     graphqlDefaultResponseScalarDecoder
