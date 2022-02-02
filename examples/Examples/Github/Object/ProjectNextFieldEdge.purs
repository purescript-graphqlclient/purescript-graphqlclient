module Examples.Github.Object.ProjectNextFieldEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__ProjectNextFieldEdge, Scope__ProjectNextField)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__ProjectNextFieldEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__ProjectNextField r
  -> SelectionSet Scope__ProjectNextFieldEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
