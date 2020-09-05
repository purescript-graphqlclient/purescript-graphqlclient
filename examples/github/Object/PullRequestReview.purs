module Examples.Github.Object.PullRequestReview where

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
  , Scope__PullRequestReview
  , Scope__PullRequestReviewCommentConnection
  , Scope__Commit
  , Scope__TeamConnection
  , Scope__PullRequest
  , Scope__ReactionGroup
  , Scope__ReactionConnection
  , Scope__Repository
  , Scope__UserContentEditConnection
  )
import Data.Maybe (Maybe)
import Examples.Github.Enum.CommentAuthorAssociation (CommentAuthorAssociation)
import Examples.Github.Scalars (Html, DateTime, Id, Uri)
import Type.Row (type (+))
import Examples.Github.Enum.ReactionContent (ReactionContent)
import Examples.Github.InputObject (ReactionOrder) as Examples.Github.InputObject
import Examples.Github.Enum.PullRequestReviewState (PullRequestReviewState)
import Examples.Github.Enum.CommentCannotUpdateReason
  (CommentCannotUpdateReason)

author :: forall r . SelectionSet
                     Scope__Actor
                     r -> SelectionSet
                          Scope__PullRequestReview
                          (Maybe
                           r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet
                     Scope__PullRequestReview
                     CommentAuthorAssociation
authorAssociation = selectionForField
                    "authorAssociation"
                    []
                    graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__PullRequestReview String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__PullRequestReview Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__PullRequestReview String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

type CommentsInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type CommentsInput = { | CommentsInputRowOptional + () }

comments :: forall r . CommentsInput -> SelectionSet
                                        Scope__PullRequestReviewCommentConnection
                                        r -> SelectionSet
                                             Scope__PullRequestReview
                                             r
comments input = selectionForCompositeField
                 "comments"
                 (toGraphqlArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commit :: forall r . SelectionSet
                     Scope__Commit
                     r -> SelectionSet
                          Scope__PullRequestReview
                          (Maybe
                           r)
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__PullRequestReview DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__PullRequestReview Boolean
createdViaEmail = selectionForField
                  "createdViaEmail"
                  []
                  graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__PullRequestReview (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

editor :: forall r . SelectionSet
                     Scope__Actor
                     r -> SelectionSet
                          Scope__PullRequestReview
                          (Maybe
                           r)
editor = selectionForCompositeField
         "editor"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__PullRequestReview Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__PullRequestReview Boolean
includesCreatedEdit = selectionForField
                      "includesCreatedEdit"
                      []
                      graphqlDefaultResponseScalarDecoder

lastEditedAt :: SelectionSet Scope__PullRequestReview (Maybe DateTime)
lastEditedAt = selectionForField
               "lastEditedAt"
               []
               graphqlDefaultResponseScalarDecoder

type OnBehalfOfInputRowOptional r = ( after :: Optional String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    | r
                                    )

type OnBehalfOfInput = { | OnBehalfOfInputRowOptional + () }

onBehalfOf :: forall r . OnBehalfOfInput -> SelectionSet
                                            Scope__TeamConnection
                                            r -> SelectionSet
                                                 Scope__PullRequestReview
                                                 r
onBehalfOf input = selectionForCompositeField
                   "onBehalfOf"
                   (toGraphqlArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

publishedAt :: SelectionSet Scope__PullRequestReview (Maybe DateTime)
publishedAt = selectionForField
              "publishedAt"
              []
              graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet
                          Scope__PullRequest
                          r -> SelectionSet
                               Scope__PullRequestReview
                               r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

reactionGroups :: forall r . SelectionSet
                             Scope__ReactionGroup
                             r -> SelectionSet
                                  Scope__PullRequestReview
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
                                               Scope__PullRequestReview
                                               r
reactions input = selectionForCompositeField
                  "reactions"
                  (toGraphqlArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__PullRequestReview
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__PullRequestReview Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__PullRequestReview PullRequestReviewState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

submittedAt :: SelectionSet Scope__PullRequestReview (Maybe DateTime)
submittedAt = selectionForField
              "submittedAt"
              []
              graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__PullRequestReview DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__PullRequestReview Uri
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
                                                             Scope__PullRequestReview
                                                             (Maybe
                                                              r)
userContentEdits input = selectionForCompositeField
                         "userContentEdits"
                         (toGraphqlArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanDelete :: SelectionSet Scope__PullRequestReview Boolean
viewerCanDelete = selectionForField
                  "viewerCanDelete"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__PullRequestReview Boolean
viewerCanReact = selectionForField
                 "viewerCanReact"
                 []
                 graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__PullRequestReview Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons :: SelectionSet
                             Scope__PullRequestReview
                             (Array
                              CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField
                            "viewerCannotUpdateReasons"
                            []
                            graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__PullRequestReview Boolean
viewerDidAuthor = selectionForField
                  "viewerDidAuthor"
                  []
                  graphqlDefaultResponseScalarDecoder
