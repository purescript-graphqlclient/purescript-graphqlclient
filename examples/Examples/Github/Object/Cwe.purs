module Examples.Github.Object.Cwe where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__Cwe)
import Examples.Github.Scalars (Id)

cweId :: SelectionSet Scope__Cwe String
cweId = selectionForField "cweId" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Cwe String
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Cwe Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Cwe String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder
