module Examples.Github.Interface.Migration where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  (Scope__Migration, Scope__MigrationSource, Scope__RepositoryMigration)
import Examples.Github.Scalars (DateTime, Id, Uri)
import Data.Maybe (Maybe(..))
import Examples.Github.Enum.MigrationState (MigrationState)
import Prelude (pure)

continueOnError :: SelectionSet Scope__Migration Boolean
continueOnError = selectionForField
                  "continueOnError"
                  []
                  graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Migration DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

failureReason :: SelectionSet Scope__Migration (Maybe String)
failureReason = selectionForField
                "failureReason"
                []
                graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Migration Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

migrationSource
  :: forall r
   . SelectionSet Scope__MigrationSource r
  -> SelectionSet Scope__Migration r
migrationSource = selectionForCompositeField
                  "migrationSource"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sourceUrl :: SelectionSet Scope__Migration Uri
sourceUrl = selectionForField "sourceUrl" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__Migration MigrationState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onRepositoryMigration :: SelectionSet Scope__RepositoryMigration decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__Migration decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "RepositoryMigration"
                         selections.onRepositoryMigration
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onRepositoryMigration: pure Nothing }
