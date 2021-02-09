module Dillonkearns.Examples.Github.Object.StarredRepositoryEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__StarredRepositoryEdge, Scope__Repository)
import Dillonkearns.Examples.Github.Scalars (DateTime)

cursor :: SelectionSet Scope__StarredRepositoryEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__StarredRepositoryEdge r
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

starredAt :: SelectionSet Scope__StarredRepositoryEdge DateTime
starredAt = selectionForField "starredAt" [] graphqlDefaultResponseScalarDecoder
