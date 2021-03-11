module Examples.Github.Object.SecurityAdvisoryIdentifier where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__SecurityAdvisoryIdentifier)

type_ :: SelectionSet Scope__SecurityAdvisoryIdentifier String
type_ = selectionForField "type" [] graphqlDefaultResponseScalarDecoder

value :: SelectionSet Scope__SecurityAdvisoryIdentifier String
value = selectionForField "value" [] graphqlDefaultResponseScalarDecoder
