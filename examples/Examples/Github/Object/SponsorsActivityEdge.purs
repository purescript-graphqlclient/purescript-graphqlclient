module Examples.Github.Object.SponsorsActivityEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__SponsorsActivityEdge, Scope__SponsorsActivity)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__SponsorsActivityEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__SponsorsActivity r
  -> SelectionSet Scope__SponsorsActivityEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
