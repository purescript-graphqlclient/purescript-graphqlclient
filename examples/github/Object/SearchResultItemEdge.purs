module Examples.Github.Object.SearchResultItemEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__SearchResultItemEdge, Scope__SearchResultItem, Scope__TextMatch)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__SearchResultItemEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__SearchResultItem
                   r -> SelectionSet
                        Scope__SearchResultItemEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

textMatches :: forall r . SelectionSet
                          Scope__TextMatch
                          r -> SelectionSet
                               Scope__SearchResultItemEdge
                               (Maybe
                                (Array
                                 (Maybe
                                  r)))
textMatches = selectionForCompositeField
              "textMatches"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
