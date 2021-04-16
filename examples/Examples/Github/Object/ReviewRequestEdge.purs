module Examples.Github.Object.ReviewRequestEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__ReviewRequestEdge, Scope__ReviewRequest)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__ReviewRequestEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__ReviewRequest r
  -> SelectionSet Scope__ReviewRequestEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
