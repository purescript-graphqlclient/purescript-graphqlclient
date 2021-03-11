module Examples.Github.Object.IpAllowListEntryEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__IpAllowListEntryEdge, Scope__IpAllowListEntry)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__IpAllowListEntryEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__IpAllowListEntry r
  -> SelectionSet Scope__IpAllowListEntryEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
