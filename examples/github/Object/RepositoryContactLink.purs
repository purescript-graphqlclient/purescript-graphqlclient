module Examples.Github.Object.RepositoryContactLink where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__RepositoryContactLink)
import Examples.Github.Scalars (Uri)

about :: SelectionSet Scope__RepositoryContactLink String
about = selectionForField "about" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__RepositoryContactLink String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__RepositoryContactLink Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
