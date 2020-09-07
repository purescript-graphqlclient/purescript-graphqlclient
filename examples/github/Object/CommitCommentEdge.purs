module Examples.Github.Object.CommitCommentEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__CommitCommentEdge, Scope__CommitComment)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__CommitCommentEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__CommitComment
                   r -> SelectionSet
                        Scope__CommitCommentEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
