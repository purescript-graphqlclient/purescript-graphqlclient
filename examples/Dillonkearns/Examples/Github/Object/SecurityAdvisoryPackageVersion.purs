module Dillonkearns.Examples.Github.Object.SecurityAdvisoryPackageVersion where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes
  (Scope__SecurityAdvisoryPackageVersion)

identifier :: SelectionSet Scope__SecurityAdvisoryPackageVersion String
identifier = selectionForField
             "identifier"
             []
             graphqlDefaultResponseScalarDecoder
