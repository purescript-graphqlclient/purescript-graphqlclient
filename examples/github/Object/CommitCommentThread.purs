module Examples.Github.Object.CommitCommentThread where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__CommitCommentConnection
  , Scope__CommitCommentThread
  , Scope__Commit
  , Scope__Repository
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id)

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
                                             Scope__CommitCommentThread
                                             r
comments input = selectionForCompositeField
                 "comments"
                 (toGraphqlArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commit :: forall r . SelectionSet
                     Scope__Commit
                     r -> SelectionSet
                          Scope__CommitCommentThread
                          (Maybe
                           r)
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__CommitCommentThread Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

path :: SelectionSet Scope__CommitCommentThread (Maybe String)
path = selectionForField "path" [] graphqlDefaultResponseScalarDecoder

position :: SelectionSet Scope__CommitCommentThread (Maybe Int)
position = selectionForField "position" [] graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__CommitCommentThread
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
