module Examples.Github.Object.PackageVersionEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__PackageVersionEdge, Scope__PackageVersion)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__PackageVersionEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__PackageVersion
                   r -> SelectionSet
                        Scope__PackageVersionEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
