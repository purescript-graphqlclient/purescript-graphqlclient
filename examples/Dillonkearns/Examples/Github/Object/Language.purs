module Dillonkearns.Examples.Github.Object.Language where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__Language)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Id)

color :: SelectionSet Scope__Language (Maybe String)
color = selectionForField "color" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Language Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Language String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder
