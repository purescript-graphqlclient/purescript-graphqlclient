module Dillonkearns.Examples.Github.Object.CheckAnnotationSpan where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__CheckAnnotationPosition, Scope__CheckAnnotationSpan)

end
  :: forall r
   . SelectionSet Scope__CheckAnnotationPosition r
  -> SelectionSet Scope__CheckAnnotationSpan r
end = selectionForCompositeField
      "end"
      []
      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

start
  :: forall r
   . SelectionSet Scope__CheckAnnotationPosition r
  -> SelectionSet Scope__CheckAnnotationSpan r
start = selectionForCompositeField
        "start"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
