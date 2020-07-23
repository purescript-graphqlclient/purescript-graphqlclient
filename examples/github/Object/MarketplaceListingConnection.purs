module Examples.Github.Object.MarketplaceListingConnection where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__MarketplaceListingEdge
  , Scope__MarketplaceListingConnection
  , Scope__MarketplaceListing
  , Scope__PageInfo
  )
import Data.Maybe
  ( Maybe
  )

edges :: forall r . SelectionSet Scope__MarketplaceListingEdge r -> SelectionSet Scope__MarketplaceListingConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField "edges" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet Scope__MarketplaceListing r -> SelectionSet Scope__MarketplaceListingConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField "nodes" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo :: forall r . SelectionSet Scope__PageInfo r -> SelectionSet Scope__MarketplaceListingConnection r
pageInfo = selectionForCompositeField "pageInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__MarketplaceListingConnection Int
totalCount = selectionForField "totalCount" [] graphqlDefaultResponseScalarDecoder
