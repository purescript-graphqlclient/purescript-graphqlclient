module Dillonkearns.Examples.Github.Object.EnterpriseUserAccountEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__EnterpriseUserAccountEdge, Scope__EnterpriseUserAccount)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__EnterpriseUserAccountEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__EnterpriseUserAccount r
  -> SelectionSet Scope__EnterpriseUserAccountEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
