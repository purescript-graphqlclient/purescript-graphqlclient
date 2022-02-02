module Examples.Github.Object.RepositoryMigration where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__RepositoryMigration, Scope__MigrationSource)
import Examples.Github.Scalars (DateTime, Id, Uri)
import Data.Maybe (Maybe)
import Examples.Github.Enum.MigrationState (MigrationState)

continueOnError :: SelectionSet Scope__RepositoryMigration Boolean
continueOnError = selectionForField
                  "continueOnError"
                  []
                  graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__RepositoryMigration DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

failureReason :: SelectionSet Scope__RepositoryMigration (Maybe String)
failureReason = selectionForField
                "failureReason"
                []
                graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__RepositoryMigration Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

migrationSource
  :: forall r
   . SelectionSet Scope__MigrationSource r
  -> SelectionSet Scope__RepositoryMigration r
migrationSource = selectionForCompositeField
                  "migrationSource"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sourceUrl :: SelectionSet Scope__RepositoryMigration Uri
sourceUrl = selectionForField "sourceUrl" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__RepositoryMigration MigrationState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder
