module Examples.Github.Object.TeamDiscussionCommentEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__TeamDiscussionCommentEdge, Scope__TeamDiscussionComment)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__TeamDiscussionCommentEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__TeamDiscussionComment r
  -> SelectionSet Scope__TeamDiscussionCommentEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
