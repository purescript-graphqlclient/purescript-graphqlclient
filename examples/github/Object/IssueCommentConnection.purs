module Examples.Github.Object.IssueCommentConnection where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__IssueCommentEdge
  , Scope__IssueCommentConnection
  , Scope__IssueComment
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges :: forall r . SelectionSet
                    Scope__IssueCommentEdge
                    r -> SelectionSet
                         Scope__IssueCommentConnection
                         (Maybe
                          (Array
                           (Maybe
                            r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet
                    Scope__IssueComment
                    r -> SelectionSet
                         Scope__IssueCommentConnection
                         (Maybe
                          (Array
                           (Maybe
                            r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo :: forall r . SelectionSet
                       Scope__PageInfo
                       r -> SelectionSet
                            Scope__IssueCommentConnection
                            r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__IssueCommentConnection Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
