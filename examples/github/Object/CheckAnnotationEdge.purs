module Examples.Github.Object.CheckAnnotationEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CheckAnnotationEdge, Scope__CheckAnnotation)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__CheckAnnotationEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__CheckAnnotation
                   r -> SelectionSet
                        Scope__CheckAnnotationEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
