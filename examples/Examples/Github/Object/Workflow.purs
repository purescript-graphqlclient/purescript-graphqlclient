module Examples.Github.Object.Workflow where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__Workflow)
import Examples.Github.Scalars (DateTime, Id)
import Data.Maybe (Maybe)

createdAt :: SelectionSet Scope__Workflow DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Workflow (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Workflow Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Workflow String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Workflow DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
