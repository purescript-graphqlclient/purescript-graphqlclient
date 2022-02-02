module Examples.Github.Object.BypassForcePushAllowanceEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__BypassForcePushAllowanceEdge, Scope__BypassForcePushAllowance)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__BypassForcePushAllowanceEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__BypassForcePushAllowance r
  -> SelectionSet Scope__BypassForcePushAllowanceEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
