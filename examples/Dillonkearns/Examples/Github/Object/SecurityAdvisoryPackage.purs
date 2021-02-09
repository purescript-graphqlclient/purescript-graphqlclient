module Dillonkearns.Examples.Github.Object.SecurityAdvisoryPackage where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__SecurityAdvisoryPackage)
import Dillonkearns.Examples.Github.Enum.SecurityAdvisoryEcosystem
  (SecurityAdvisoryEcosystem)

ecosystem
  :: SelectionSet
     Scope__SecurityAdvisoryPackage
     SecurityAdvisoryEcosystem
ecosystem = selectionForField "ecosystem" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__SecurityAdvisoryPackage String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder
