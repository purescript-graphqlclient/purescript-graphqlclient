module Examples.Github.Object.PullRequestReviewComment where

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
  , Scope__PullRequestReviewComment
  , Scope__Commit
  , Scope__PullRequest
  , Scope__PullRequestReview
  , Scope__ReactionGroup
  , Scope__ReactionConnection
  , Scope__Repository
  , Scope__UserContentEditConnection
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Enum.CommentAuthorAssociation
  ( CommentAuthorAssociation
  )
import Examples.Github.Scalars
  ( Html
  , DateTime
  , Id
  , Uri
  )
import Examples.Github.Enum.ReactionContent
  ( ReactionContent
  )
import Examples.Github.InputObject
  ( ReactionOrder
  ) as Examples.Github.InputObject
import Type.Row
  ( type (+)
  )
import Examples.Github.Enum.PullRequestReviewCommentState
  ( PullRequestReviewCommentState
  )
import Examples.Github.Enum.CommentCannotUpdateReason
  ( CommentCannotUpdateReason
  )

author :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
author = selectionForCompositeField "author" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__PullRequestReviewComment CommentAuthorAssociation
authorAssociation = selectionForField "authorAssociation" [] graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__PullRequestReviewComment String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__PullRequestReviewComment Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__PullRequestReviewComment String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

commit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
commit = selectionForCompositeField "commit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__PullRequestReviewComment DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__PullRequestReviewComment Boolean
createdViaEmail = selectionForField "createdViaEmail" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__PullRequestReviewComment (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

diffHunk :: SelectionSet Scope__PullRequestReviewComment String
diffHunk = selectionForField "diffHunk" [] graphqlDefaultResponseScalarDecoder

draftedAt :: SelectionSet Scope__PullRequestReviewComment DateTime
draftedAt = selectionForField "draftedAt" [] graphqlDefaultResponseScalarDecoder

editor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
editor = selectionForCompositeField "editor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__PullRequestReviewComment Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__PullRequestReviewComment Boolean
includesCreatedEdit = selectionForField "includesCreatedEdit" [] graphqlDefaultResponseScalarDecoder

isMinimized :: SelectionSet Scope__PullRequestReviewComment Boolean
isMinimized = selectionForField "isMinimized" [] graphqlDefaultResponseScalarDecoder

lastEditedAt :: SelectionSet Scope__PullRequestReviewComment (Maybe DateTime)
lastEditedAt = selectionForField "lastEditedAt" [] graphqlDefaultResponseScalarDecoder

minimizedReason :: SelectionSet Scope__PullRequestReviewComment (Maybe String)
minimizedReason = selectionForField "minimizedReason" [] graphqlDefaultResponseScalarDecoder

originalCommit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
originalCommit = selectionForCompositeField "originalCommit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

originalPosition :: SelectionSet Scope__PullRequestReviewComment Int
originalPosition = selectionForField "originalPosition" [] graphqlDefaultResponseScalarDecoder

outdated :: SelectionSet Scope__PullRequestReviewComment Boolean
outdated = selectionForField "outdated" [] graphqlDefaultResponseScalarDecoder

path :: SelectionSet Scope__PullRequestReviewComment String
path = selectionForField "path" [] graphqlDefaultResponseScalarDecoder

position :: SelectionSet Scope__PullRequestReviewComment (Maybe Int)
position = selectionForField "position" [] graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__PullRequestReviewComment (Maybe DateTime)
publishedAt = selectionForField "publishedAt" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__PullRequestReviewComment r
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pullRequestReview :: forall r . SelectionSet Scope__PullRequestReview r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
pullRequestReview = selectionForCompositeField "pullRequestReview" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

reactionGroups :: forall r . SelectionSet Scope__ReactionGroup r -> SelectionSet Scope__PullRequestReviewComment (Maybe (Array r))
reactionGroups = selectionForCompositeField "reactionGroups" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReactionsInputRowOptional r = ( after :: Optional String
                                   , before :: Optional String
                                   , first :: Optional Int
                                   , last :: Optional Int
                                   , content :: Optional ReactionContent
                                   , orderBy :: Optional Examples.Github.InputObject.ReactionOrder
                                   | r
                                   )

type ReactionsInput = { | ReactionsInputRowOptional + () }

reactions :: forall r . ReactionsInput -> SelectionSet Scope__ReactionConnection r -> SelectionSet Scope__PullRequestReviewComment r
reactions input = selectionForCompositeField "reactions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

replyTo :: forall r . SelectionSet Scope__PullRequestReviewComment r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
replyTo = selectionForCompositeField "replyTo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__PullRequestReviewComment r
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__PullRequestReviewComment Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__PullRequestReviewComment PullRequestReviewCommentState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__PullRequestReviewComment DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__PullRequestReviewComment Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type UserContentEditsInputRowOptional r = ( after :: Optional String
                                          , before :: Optional String
                                          , first :: Optional Int
                                          , last :: Optional Int
                                          | r
                                          )

type UserContentEditsInput = { | UserContentEditsInputRowOptional + () }

userContentEdits :: forall r . UserContentEditsInput -> SelectionSet Scope__UserContentEditConnection r -> SelectionSet Scope__PullRequestReviewComment (Maybe r)
userContentEdits input = selectionForCompositeField "userContentEdits" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanDelete :: SelectionSet Scope__PullRequestReviewComment Boolean
viewerCanDelete = selectionForField "viewerCanDelete" [] graphqlDefaultResponseScalarDecoder

viewerCanMinimize :: SelectionSet Scope__PullRequestReviewComment Boolean
viewerCanMinimize = selectionForField "viewerCanMinimize" [] graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__PullRequestReviewComment Boolean
viewerCanReact = selectionForField "viewerCanReact" [] graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__PullRequestReviewComment Boolean
viewerCanUpdate = selectionForField "viewerCanUpdate" [] graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons :: SelectionSet Scope__PullRequestReviewComment (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField "viewerCannotUpdateReasons" [] graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__PullRequestReviewComment Boolean
viewerDidAuthor = selectionForField "viewerDidAuthor" [] graphqlDefaultResponseScalarDecoder
