module Examples.Github.Object.CreateMigrationSourcePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CreateMigrationSourcePayload, Scope__MigrationSource)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__CreateMigrationSourcePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

migrationSource
  :: forall r
   . SelectionSet Scope__MigrationSource r
  -> SelectionSet Scope__CreateMigrationSourcePayload (Maybe r)
migrationSource = selectionForCompositeField
                  "migrationSource"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer
