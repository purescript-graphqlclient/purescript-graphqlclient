module Examples.Github.Object.ReactionEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__ReactionEdge
  , Scope__Reaction
  )
import Data.Maybe
  ( Maybe
  )

cursor :: SelectionSet Scope__ReactionEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet Scope__Reaction r -> SelectionSet Scope__ReactionEdge (Maybe r)
node = selectionForCompositeField "node" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
