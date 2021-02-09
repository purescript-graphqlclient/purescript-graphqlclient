module Dillonkearns.Examples.Github.Object.IssueComment where

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
  , Scope__IssueComment
  , Scope__Issue
  , Scope__PullRequest
  , Scope__ReactionGroup
  , Scope__ReactionConnection
  , Scope__Repository
  , Scope__UserContentEditConnection
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Enum.CommentAuthorAssociation
  (CommentAuthorAssociation)
import Dillonkearns.Examples.Github.Scalars (Html, DateTime, Id, Uri)
import Dillonkearns.Examples.Github.Enum.ReactionContent (ReactionContent)
import Dillonkearns.Examples.Github.InputObject (ReactionOrder) as Dillonkearns.Examples.Github.InputObject
import Type.Row (type (+))
import Dillonkearns.Examples.Github.Enum.CommentCannotUpdateReason
  (CommentCannotUpdateReason)

author
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__IssueComment (Maybe r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__IssueComment CommentAuthorAssociation
authorAssociation = selectionForField
                    "authorAssociation"
                    []
                    graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__IssueComment String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__IssueComment Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__IssueComment String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__IssueComment DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__IssueComment Boolean
createdViaEmail = selectionForField
                  "createdViaEmail"
                  []
                  graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__IssueComment (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

editor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__IssueComment (Maybe r)
editor = selectionForCompositeField
         "editor"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__IssueComment Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__IssueComment Boolean
includesCreatedEdit = selectionForField
                      "includesCreatedEdit"
                      []
                      graphqlDefaultResponseScalarDecoder

isMinimized :: SelectionSet Scope__IssueComment Boolean
isMinimized = selectionForField
              "isMinimized"
              []
              graphqlDefaultResponseScalarDecoder

issue
  :: forall r
   . SelectionSet Scope__Issue r
  -> SelectionSet Scope__IssueComment r
issue = selectionForCompositeField
        "issue"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

lastEditedAt :: SelectionSet Scope__IssueComment (Maybe DateTime)
lastEditedAt = selectionForField
               "lastEditedAt"
               []
               graphqlDefaultResponseScalarDecoder

minimizedReason :: SelectionSet Scope__IssueComment (Maybe String)
minimizedReason = selectionForField
                  "minimizedReason"
                  []
                  graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__IssueComment (Maybe DateTime)
publishedAt = selectionForField
              "publishedAt"
              []
              graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__IssueComment (Maybe r)
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

reactionGroups
  :: forall r
   . SelectionSet Scope__ReactionGroup r
  -> SelectionSet Scope__IssueComment (Maybe (Array r))
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
  -> SelectionSet Scope__IssueComment r
reactions input = selectionForCompositeField
                  "reactions"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__IssueComment r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__IssueComment Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__IssueComment DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__IssueComment Uri
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
  -> SelectionSet Scope__IssueComment (Maybe r)
userContentEdits input = selectionForCompositeField
                         "userContentEdits"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanDelete :: SelectionSet Scope__IssueComment Boolean
viewerCanDelete = selectionForField
                  "viewerCanDelete"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanMinimize :: SelectionSet Scope__IssueComment Boolean
viewerCanMinimize = selectionForField
                    "viewerCanMinimize"
                    []
                    graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__IssueComment Boolean
viewerCanReact = selectionForField
                 "viewerCanReact"
                 []
                 graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__IssueComment Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons
  :: SelectionSet
     Scope__IssueComment
     (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField
                            "viewerCannotUpdateReasons"
                            []
                            graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__IssueComment Boolean
viewerDidAuthor = selectionForField
                  "viewerDidAuthor"
                  []
                  graphqlDefaultResponseScalarDecoder
