module Examples.Github.Object.RepositoryMigrationEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__RepositoryMigrationEdge, Scope__RepositoryMigration)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__RepositoryMigrationEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__RepositoryMigration r
  -> SelectionSet Scope__RepositoryMigrationEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
