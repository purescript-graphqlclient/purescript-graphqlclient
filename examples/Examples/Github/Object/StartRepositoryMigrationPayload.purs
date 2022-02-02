module Examples.Github.Object.StartRepositoryMigrationPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__StartRepositoryMigrationPayload, Scope__RepositoryMigration)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__StartRepositoryMigrationPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

repositoryMigration
  :: forall r
   . SelectionSet Scope__RepositoryMigration r
  -> SelectionSet Scope__StartRepositoryMigrationPayload (Maybe r)
repositoryMigration = selectionForCompositeField
                      "repositoryMigration"
                      []
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer
