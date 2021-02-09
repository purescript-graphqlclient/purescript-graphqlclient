module Dillonkearns.Examples.Github.Object.RepositoryContactLink where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__RepositoryContactLink)
import Dillonkearns.Examples.Github.Scalars (Uri)

about :: SelectionSet Scope__RepositoryContactLink String
about = selectionForField "about" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__RepositoryContactLink String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__RepositoryContactLink Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
