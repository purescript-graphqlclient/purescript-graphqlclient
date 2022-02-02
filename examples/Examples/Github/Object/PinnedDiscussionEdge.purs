module Examples.Github.Object.PinnedDiscussionEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__PinnedDiscussionEdge, Scope__PinnedDiscussion)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__PinnedDiscussionEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__PinnedDiscussion r
  -> SelectionSet Scope__PinnedDiscussionEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
