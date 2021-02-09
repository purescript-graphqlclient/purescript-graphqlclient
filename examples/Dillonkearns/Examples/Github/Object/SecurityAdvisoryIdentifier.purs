module Dillonkearns.Examples.Github.Object.SecurityAdvisoryIdentifier where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__SecurityAdvisoryIdentifier)

type_ :: SelectionSet Scope__SecurityAdvisoryIdentifier String
type_ = selectionForField "type" [] graphqlDefaultResponseScalarDecoder

value :: SelectionSet Scope__SecurityAdvisoryIdentifier String
value = selectionForField "value" [] graphqlDefaultResponseScalarDecoder
