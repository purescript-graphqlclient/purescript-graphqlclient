module Examples.Github.Object.CommitComment where

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
  , Scope__CommitComment
  , Scope__Commit
  , Scope__ReactionGroup
  , Scope__ReactionConnection
  , Scope__Repository
  , Scope__UserContentEditConnection
  )
import Data.Maybe (Maybe)
import Examples.Github.Enum.CommentAuthorAssociation
  (CommentAuthorAssociation)
import Examples.Github.Scalars (Html, DateTime, Id, Uri)
import Examples.Github.Enum.ReactionContent (ReactionContent)
import Examples.Github.InputObject (ReactionOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Examples.Github.Enum.CommentCannotUpdateReason
  (CommentCannotUpdateReason)

author
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__CommitComment (Maybe r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__CommitComment CommentAuthorAssociation
authorAssociation = selectionForField
                    "authorAssociation"
                    []
                    graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__CommitComment String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__CommitComment Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__CommitComment String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

commit
  :: forall r
   . SelectionSet Scope__Commit r
  -> SelectionSet Scope__CommitComment (Maybe r)
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__CommitComment DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__CommitComment Boolean
createdViaEmail = selectionForField
                  "createdViaEmail"
                  []
                  graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__CommitComment (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

editor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__CommitComment (Maybe r)
editor = selectionForCompositeField
         "editor"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__CommitComment Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__CommitComment Boolean
includesCreatedEdit = selectionForField
                      "includesCreatedEdit"
                      []
                      graphqlDefaultResponseScalarDecoder

isMinimized :: SelectionSet Scope__CommitComment Boolean
isMinimized = selectionForField
              "isMinimized"
              []
              graphqlDefaultResponseScalarDecoder

lastEditedAt :: SelectionSet Scope__CommitComment (Maybe DateTime)
lastEditedAt = selectionForField
               "lastEditedAt"
               []
               graphqlDefaultResponseScalarDecoder

minimizedReason :: SelectionSet Scope__CommitComment (Maybe String)
minimizedReason = selectionForField
                  "minimizedReason"
                  []
                  graphqlDefaultResponseScalarDecoder

path :: SelectionSet Scope__CommitComment (Maybe String)
path = selectionForField "path" [] graphqlDefaultResponseScalarDecoder

position :: SelectionSet Scope__CommitComment (Maybe Int)
position = selectionForField "position" [] graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__CommitComment (Maybe DateTime)
publishedAt = selectionForField
              "publishedAt"
              []
              graphqlDefaultResponseScalarDecoder

reactionGroups
  :: forall r
   . SelectionSet Scope__ReactionGroup r
  -> SelectionSet Scope__CommitComment (Maybe (Array r))
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
  -> SelectionSet Scope__CommitComment r
reactions input = selectionForCompositeField
                  "reactions"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__CommitComment r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__CommitComment Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__CommitComment DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__CommitComment Uri
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
  -> SelectionSet Scope__CommitComment (Maybe r)
userContentEdits input = selectionForCompositeField
                         "userContentEdits"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanDelete :: SelectionSet Scope__CommitComment Boolean
viewerCanDelete = selectionForField
                  "viewerCanDelete"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanMinimize :: SelectionSet Scope__CommitComment Boolean
viewerCanMinimize = selectionForField
                    "viewerCanMinimize"
                    []
                    graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__CommitComment Boolean
viewerCanReact = selectionForField
                 "viewerCanReact"
                 []
                 graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__CommitComment Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons
  :: SelectionSet
     Scope__CommitComment
     (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField
                            "viewerCannotUpdateReasons"
                            []
                            graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__CommitComment Boolean
viewerDidAuthor = selectionForField
                  "viewerDidAuthor"
                  []
                  graphqlDefaultResponseScalarDecoder
