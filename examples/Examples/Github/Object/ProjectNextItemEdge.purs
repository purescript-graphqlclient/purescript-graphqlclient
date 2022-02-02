module Examples.Github.Object.ProjectNextItemEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__ProjectNextItemEdge, Scope__ProjectNextItem)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__ProjectNextItemEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__ProjectNextItem r
  -> SelectionSet Scope__ProjectNextItemEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
