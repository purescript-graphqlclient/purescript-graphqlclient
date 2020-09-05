module Examples.Github.Object.ReactingUserEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__ReactingUserEdge, Scope__User)
import Examples.Github.Scalars (DateTime)

cursor :: SelectionSet Scope__ReactingUserEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__User
                   r -> SelectionSet
                        Scope__ReactingUserEdge
                        r
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

reactedAt :: SelectionSet Scope__ReactingUserEdge DateTime
reactedAt = selectionForField "reactedAt" [] graphqlDefaultResponseScalarDecoder
