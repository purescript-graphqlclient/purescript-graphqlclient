module Examples.Github.Object.Blame where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__BlameRange
  , Scope__Blame
  )

ranges :: forall r . SelectionSet Scope__BlameRange r -> SelectionSet Scope__Blame (Array r)
ranges = selectionForCompositeField "ranges" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
