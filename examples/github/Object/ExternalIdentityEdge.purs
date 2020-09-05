module Examples.Github.Object.ExternalIdentityEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__ExternalIdentityEdge, Scope__ExternalIdentity)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__ExternalIdentityEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__ExternalIdentity
                   r -> SelectionSet
                        Scope__ExternalIdentityEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
