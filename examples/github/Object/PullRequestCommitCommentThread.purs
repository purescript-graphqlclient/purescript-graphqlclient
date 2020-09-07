module Examples.Github.Object.PullRequestCommitCommentThread where

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
  ( Scope__CommitCommentConnection
  , Scope__PullRequestCommitCommentThread
  , Scope__Commit
  , Scope__PullRequest
  , Scope__Repository
  )
import Examples.Github.Scalars (Id)
import Data.Maybe (Maybe)

type CommentsInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type CommentsInput = { | CommentsInputRowOptional + () }

comments :: forall r . CommentsInput -> SelectionSet
                                        Scope__CommitCommentConnection
                                        r -> SelectionSet
                                             Scope__PullRequestCommitCommentThread
                                             r
comments input = selectionForCompositeField
                 "comments"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commit :: forall r . SelectionSet
                     Scope__Commit
                     r -> SelectionSet
                          Scope__PullRequestCommitCommentThread
                          r
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__PullRequestCommitCommentThread Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

path :: SelectionSet Scope__PullRequestCommitCommentThread (Maybe String)
path = selectionForField "path" [] graphqlDefaultResponseScalarDecoder

position :: SelectionSet Scope__PullRequestCommitCommentThread (Maybe Int)
position = selectionForField "position" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet
                          Scope__PullRequest
                          r -> SelectionSet
                               Scope__PullRequestCommitCommentThread
                               r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__PullRequestCommitCommentThread
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
