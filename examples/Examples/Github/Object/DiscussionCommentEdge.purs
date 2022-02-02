module Examples.Github.Object.DiscussionCommentEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DiscussionCommentEdge, Scope__DiscussionComment)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__DiscussionCommentEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__DiscussionComment r
  -> SelectionSet Scope__DiscussionCommentEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
