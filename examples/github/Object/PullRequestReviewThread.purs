module Examples.Github.Object.PullRequestReviewThread where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__PullRequestReviewCommentConnection
  , Scope__PullRequestReviewThread
  , Scope__PullRequest
  , Scope__Repository
  , Scope__User
  )
import Examples.Github.Enum.DiffSide (DiffSide)
import Examples.Github.Scalars (Id)
import Data.Maybe (Maybe)

type CommentsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , skip :: Optional Int
    | r
    )

type CommentsInput = { | CommentsInputRowOptional + () }

comments
  :: forall r
   . CommentsInput
  -> SelectionSet Scope__PullRequestReviewCommentConnection r
  -> SelectionSet Scope__PullRequestReviewThread r
comments input = selectionForCompositeField
                 "comments"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

diffSide :: SelectionSet Scope__PullRequestReviewThread DiffSide
diffSide = selectionForField "diffSide" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__PullRequestReviewThread Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isCollapsed :: SelectionSet Scope__PullRequestReviewThread Boolean
isCollapsed = selectionForField
              "isCollapsed"
              []
              graphqlDefaultResponseScalarDecoder

isOutdated :: SelectionSet Scope__PullRequestReviewThread Boolean
isOutdated = selectionForField
             "isOutdated"
             []
             graphqlDefaultResponseScalarDecoder

isResolved :: SelectionSet Scope__PullRequestReviewThread Boolean
isResolved = selectionForField
             "isResolved"
             []
             graphqlDefaultResponseScalarDecoder

line :: SelectionSet Scope__PullRequestReviewThread (Maybe Int)
line = selectionForField "line" [] graphqlDefaultResponseScalarDecoder

originalLine :: SelectionSet Scope__PullRequestReviewThread (Maybe Int)
originalLine = selectionForField
               "originalLine"
               []
               graphqlDefaultResponseScalarDecoder

originalStartLine :: SelectionSet Scope__PullRequestReviewThread (Maybe Int)
originalStartLine = selectionForField
                    "originalStartLine"
                    []
                    graphqlDefaultResponseScalarDecoder

path :: SelectionSet Scope__PullRequestReviewThread String
path = selectionForField "path" [] graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__PullRequestReviewThread r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__PullRequestReviewThread r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resolvedBy
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__PullRequestReviewThread (Maybe r)
resolvedBy = selectionForCompositeField
             "resolvedBy"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

startDiffSide :: SelectionSet Scope__PullRequestReviewThread (Maybe DiffSide)
startDiffSide = selectionForField
                "startDiffSide"
                []
                graphqlDefaultResponseScalarDecoder

startLine :: SelectionSet Scope__PullRequestReviewThread (Maybe Int)
startLine = selectionForField "startLine" [] graphqlDefaultResponseScalarDecoder

viewerCanReply :: SelectionSet Scope__PullRequestReviewThread Boolean
viewerCanReply = selectionForField
                 "viewerCanReply"
                 []
                 graphqlDefaultResponseScalarDecoder

viewerCanResolve :: SelectionSet Scope__PullRequestReviewThread Boolean
viewerCanResolve = selectionForField
                   "viewerCanResolve"
                   []
                   graphqlDefaultResponseScalarDecoder

viewerCanUnresolve :: SelectionSet Scope__PullRequestReviewThread Boolean
viewerCanUnresolve = selectionForField
                     "viewerCanUnresolve"
                     []
                     graphqlDefaultResponseScalarDecoder
