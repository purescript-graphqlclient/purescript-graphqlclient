module Examples.Github.Object.CheckAnnotationSpan where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CheckAnnotationPosition, Scope__CheckAnnotationSpan)

end :: forall r . SelectionSet
                  Scope__CheckAnnotationPosition
                  r -> SelectionSet
                       Scope__CheckAnnotationSpan
                       r
end = selectionForCompositeField
      "end"
      []
      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

start :: forall r . SelectionSet
                    Scope__CheckAnnotationPosition
                    r -> SelectionSet
                         Scope__CheckAnnotationSpan
                         r
start = selectionForCompositeField
        "start"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
