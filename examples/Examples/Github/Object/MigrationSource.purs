module Examples.Github.Object.MigrationSource where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__MigrationSource)
import Examples.Github.Scalars (Id, Uri)
import Examples.Github.Enum.MigrationSourceType (MigrationSourceType)

id :: SelectionSet Scope__MigrationSource Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__MigrationSource String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type_ :: SelectionSet Scope__MigrationSource MigrationSourceType
type_ = selectionForField "type" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__MigrationSource Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
