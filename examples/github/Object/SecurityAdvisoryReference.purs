module Examples.Github.Object.SecurityAdvisoryReference where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__SecurityAdvisoryReference)
import Examples.Github.Scalars (Uri)

url :: SelectionSet Scope__SecurityAdvisoryReference Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
