module Examples.Github.Object.Cvss where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__Cvss)
import Data.Maybe (Maybe)

score :: SelectionSet Scope__Cvss Number
score = selectionForField "score" [] graphqlDefaultResponseScalarDecoder

vectorString :: SelectionSet Scope__Cvss (Maybe String)
vectorString = selectionForField
               "vectorString"
               []
               graphqlDefaultResponseScalarDecoder
