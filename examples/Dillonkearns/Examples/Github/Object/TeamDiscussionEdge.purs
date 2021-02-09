module Dillonkearns.Examples.Github.Object.TeamDiscussionEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__TeamDiscussionEdge, Scope__TeamDiscussion)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__TeamDiscussionEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__TeamDiscussion r
  -> SelectionSet Scope__TeamDiscussionEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
