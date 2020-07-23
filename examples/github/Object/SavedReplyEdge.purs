module Examples.Github.Object.SavedReplyEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__SavedReplyEdge
  , Scope__SavedReply
  )
import Data.Maybe
  ( Maybe
  )

cursor :: SelectionSet Scope__SavedReplyEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet Scope__SavedReply r -> SelectionSet Scope__SavedReplyEdge (Maybe r)
node = selectionForCompositeField "node" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
