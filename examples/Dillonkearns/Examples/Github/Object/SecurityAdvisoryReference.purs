module Dillonkearns.Examples.Github.Object.SecurityAdvisoryReference where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__SecurityAdvisoryReference)
import Dillonkearns.Examples.Github.Scalars (Uri)

url :: SelectionSet Scope__SecurityAdvisoryReference Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
