module Dillonkearns.Examples.Github.Object.PackageStatistics where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__PackageStatistics)

downloadsTotalCount :: SelectionSet Scope__PackageStatistics Int
downloadsTotalCount = selectionForField
                      "downloadsTotalCount"
                      []
                      graphqlDefaultResponseScalarDecoder
