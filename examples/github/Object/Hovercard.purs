module Examples.Github.Object.Hovercard where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__HovercardContext, Scope__Hovercard)

contexts
  :: forall r
   . SelectionSet Scope__HovercardContext r
  -> SelectionSet Scope__Hovercard (Array r)
contexts = selectionForCompositeField
           "contexts"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer
