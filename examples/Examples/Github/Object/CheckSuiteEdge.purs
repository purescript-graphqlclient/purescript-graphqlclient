module Examples.Github.Object.CheckSuiteEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CheckSuiteEdge, Scope__CheckSuite)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__CheckSuiteEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__CheckSuite r
  -> SelectionSet Scope__CheckSuiteEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
