module Examples.Github.Object.TextMatch where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__TextMatch, Scope__TextMatchHighlight)

fragment :: SelectionSet Scope__TextMatch String
fragment = selectionForField "fragment" [] graphqlDefaultResponseScalarDecoder

highlights
  :: forall r
   . SelectionSet Scope__TextMatchHighlight r
  -> SelectionSet Scope__TextMatch (Array r)
highlights = selectionForCompositeField
             "highlights"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

property :: SelectionSet Scope__TextMatch String
property = selectionForField "property" [] graphqlDefaultResponseScalarDecoder
