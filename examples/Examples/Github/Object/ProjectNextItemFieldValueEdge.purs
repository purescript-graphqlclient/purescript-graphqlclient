module Examples.Github.Object.ProjectNextItemFieldValueEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__ProjectNextItemFieldValueEdge, Scope__ProjectNextItemFieldValue)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__ProjectNextItemFieldValueEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__ProjectNextItemFieldValue r
  -> SelectionSet Scope__ProjectNextItemFieldValueEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
