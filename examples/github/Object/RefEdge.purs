module Examples.Github.Object.RefEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__RefEdge, Scope__Ref)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__RefEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__Ref
                   r -> SelectionSet
                        Scope__RefEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
