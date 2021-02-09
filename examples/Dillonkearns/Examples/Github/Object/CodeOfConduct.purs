module Dillonkearns.Examples.Github.Object.CodeOfConduct where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__CodeOfConduct)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Id, Uri)

body :: SelectionSet Scope__CodeOfConduct (Maybe String)
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__CodeOfConduct Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

key :: SelectionSet Scope__CodeOfConduct String
key = selectionForField "key" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__CodeOfConduct String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__CodeOfConduct (Maybe Uri)
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__CodeOfConduct (Maybe Uri)
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
