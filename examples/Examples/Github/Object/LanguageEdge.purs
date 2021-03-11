module Examples.Github.Object.LanguageEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__LanguageEdge, Scope__Language)

cursor :: SelectionSet Scope__LanguageEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__Language r
  -> SelectionSet Scope__LanguageEdge r
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

size :: SelectionSet Scope__LanguageEdge Int
size = selectionForField "size" [] graphqlDefaultResponseScalarDecoder
