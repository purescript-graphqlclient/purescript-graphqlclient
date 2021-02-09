module Dillonkearns.Examples.Github.Object.TeamDiscussionCommentEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
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
