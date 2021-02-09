module Examples.Github.Object.VerifiableDomainEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__VerifiableDomainEdge, Scope__VerifiableDomain)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__VerifiableDomainEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__VerifiableDomain r
  -> SelectionSet Scope__VerifiableDomainEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
