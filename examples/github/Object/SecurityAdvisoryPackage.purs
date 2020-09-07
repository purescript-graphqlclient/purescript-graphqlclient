module Examples.Github.Object.SecurityAdvisoryPackage where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__SecurityAdvisoryPackage)
import Examples.Github.Enum.SecurityAdvisoryEcosystem
  (SecurityAdvisoryEcosystem)

ecosystem :: SelectionSet
             Scope__SecurityAdvisoryPackage
             SecurityAdvisoryEcosystem
ecosystem = selectionForField "ecosystem" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__SecurityAdvisoryPackage String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder
