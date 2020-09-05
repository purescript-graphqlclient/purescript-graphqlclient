module Examples.Github.Object.TeamDiscussionComment where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , toGraphqlArguments
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__TeamDiscussionComment
  , Scope__TeamDiscussion
  , Scope__ReactionGroup
  , Scope__ReactionConnection
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

author :: forall r . SelectionSet
                     Scope__Actor
                     r -> SelectionSet
                          Scope__TeamDiscussionComment
                          (Maybe
                           r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet
                     Scope__TeamDiscussionComment
                     CommentAuthorAssociation
authorAssociation = selectionForField
                    "authorAssociation"
                    []
                    graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__TeamDiscussionComment String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__TeamDiscussionComment Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__TeamDiscussionComment String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

bodyVersion :: SelectionSet Scope__TeamDiscussionComment String
bodyVersion = selectionForField
              "bodyVersion"
              []
              graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__TeamDiscussionComment DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__TeamDiscussionComment Boolean
createdViaEmail = selectionForField
                  "createdViaEmail"
                  []
                  graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__TeamDiscussionComment (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

discussion :: forall r . SelectionSet
                         Scope__TeamDiscussion
                         r -> SelectionSet
                              Scope__TeamDiscussionComment
                              r
discussion = selectionForCompositeField
             "discussion"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

editor :: forall r . SelectionSet
                     Scope__Actor
                     r -> SelectionSet
                          Scope__TeamDiscussionComment
                          (Maybe
                           r)
editor = selectionForCompositeField
         "editor"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__TeamDiscussionComment Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__TeamDiscussionComment Boolean
includesCreatedEdit = selectionForField
                      "includesCreatedEdit"
                      []
                      graphqlDefaultResponseScalarDecoder

lastEditedAt :: SelectionSet Scope__TeamDiscussionComment (Maybe DateTime)
lastEditedAt = selectionForField
               "lastEditedAt"
               []
               graphqlDefaultResponseScalarDecoder

number :: SelectionSet Scope__TeamDiscussionComment Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__TeamDiscussionComment (Maybe DateTime)
publishedAt = selectionForField
              "publishedAt"
              []
              graphqlDefaultResponseScalarDecoder

reactionGroups :: forall r . SelectionSet
                             Scope__ReactionGroup
                             r -> SelectionSet
                                  Scope__TeamDiscussionComment
                                  (Maybe
                                   (Array
                                    r))
reactionGroups = selectionForCompositeField
                 "reactionGroups"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReactionsInputRowOptional r = ( after :: Optional
                                              String
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
                                               Scope__TeamDiscussionComment
                                               r
reactions input = selectionForCompositeField
                  "reactions"
                  (toGraphqlArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__TeamDiscussionComment Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__TeamDiscussionComment DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__TeamDiscussionComment Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type UserContentEditsInputRowOptional r = ( after :: Optional
                                                     String
                                          , before :: Optional String
                                          , first :: Optional Int
                                          , last :: Optional Int
                                          | r
                                          )

type UserContentEditsInput = { | UserContentEditsInputRowOptional + () }

userContentEdits :: forall r . UserContentEditsInput -> SelectionSet
                                                        Scope__UserContentEditConnection
                                                        r -> SelectionSet
                                                             Scope__TeamDiscussionComment
                                                             (Maybe
                                                              r)
userContentEdits input = selectionForCompositeField
                         "userContentEdits"
                         (toGraphqlArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanDelete :: SelectionSet Scope__TeamDiscussionComment Boolean
viewerCanDelete = selectionForField
                  "viewerCanDelete"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__TeamDiscussionComment Boolean
viewerCanReact = selectionForField
                 "viewerCanReact"
                 []
                 graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__TeamDiscussionComment Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons :: SelectionSet
                             Scope__TeamDiscussionComment
                             (Array
                              CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField
                            "viewerCannotUpdateReasons"
                            []
                            graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__TeamDiscussionComment Boolean
viewerDidAuthor = selectionForField
                  "viewerDidAuthor"
                  []
                  graphqlDefaultResponseScalarDecoder
