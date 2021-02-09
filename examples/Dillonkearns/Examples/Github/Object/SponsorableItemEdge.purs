module Dillonkearns.Examples.Github.Object.SponsorableItemEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__SponsorableItemEdge, Scope__SponsorableItem)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__SponsorableItemEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__SponsorableItem r
  -> SelectionSet Scope__SponsorableItemEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
