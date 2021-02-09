module Dillonkearns.Examples.Github.Object.MarketplaceListingEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__MarketplaceListingEdge, Scope__MarketplaceListing)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__MarketplaceListingEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__MarketplaceListing r
  -> SelectionSet Scope__MarketplaceListingEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
