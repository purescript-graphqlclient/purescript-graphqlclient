module Dillonkearns.Examples.Github.Object.PackageVersionStatistics where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__PackageVersionStatistics)

downloadsTotalCount :: SelectionSet Scope__PackageVersionStatistics Int
downloadsTotalCount = selectionForField
                      "downloadsTotalCount"
                      []
                      graphqlDefaultResponseScalarDecoder
