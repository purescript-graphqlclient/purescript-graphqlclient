module Examples.Github.Object.ReactorEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__ReactorEdge, Scope__Reactor)
import Examples.Github.Scalars (DateTime)

cursor :: SelectionSet Scope__ReactorEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__Reactor r
  -> SelectionSet Scope__ReactorEdge r
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

reactedAt :: SelectionSet Scope__ReactorEdge DateTime
reactedAt = selectionForField "reactedAt" [] graphqlDefaultResponseScalarDecoder
