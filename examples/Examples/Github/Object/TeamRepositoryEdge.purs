module Examples.Github.Object.TeamRepositoryEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__TeamRepositoryEdge, Scope__Repository)
import Examples.Github.Enum.RepositoryPermission
  (RepositoryPermission)

cursor :: SelectionSet Scope__TeamRepositoryEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__TeamRepositoryEdge r
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

permission :: SelectionSet Scope__TeamRepositoryEdge RepositoryPermission
permission = selectionForField
             "permission"
             []
             graphqlDefaultResponseScalarDecoder
