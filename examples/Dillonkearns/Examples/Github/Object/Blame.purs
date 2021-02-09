module Dillonkearns.Examples.Github.Object.Blame where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes (Scope__BlameRange, Scope__Blame)

ranges
  :: forall r
   . SelectionSet Scope__BlameRange r
  -> SelectionSet Scope__Blame (Array r)
ranges = selectionForCompositeField
         "ranges"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
