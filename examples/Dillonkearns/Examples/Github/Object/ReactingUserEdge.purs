module Dillonkearns.Examples.Github.Object.ReactingUserEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__ReactingUserEdge, Scope__User)
import Dillonkearns.Examples.Github.Scalars (DateTime)

cursor :: SelectionSet Scope__ReactingUserEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__ReactingUserEdge r
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

reactedAt :: SelectionSet Scope__ReactingUserEdge DateTime
reactedAt = selectionForField "reactedAt" [] graphqlDefaultResponseScalarDecoder
