module Examples.Github.Object.DiscussionCategoryEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DiscussionCategoryEdge, Scope__DiscussionCategory)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__DiscussionCategoryEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__DiscussionCategory r
  -> SelectionSet Scope__DiscussionCategoryEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
