module Dillonkearns.Examples.Github.Object.CheckSuiteEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
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
