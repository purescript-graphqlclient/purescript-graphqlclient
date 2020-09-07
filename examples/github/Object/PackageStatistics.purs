module Examples.Github.Object.PackageStatistics where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__PackageStatistics)

downloadsTotalCount :: SelectionSet Scope__PackageStatistics Int
downloadsTotalCount = selectionForField
                      "downloadsTotalCount"
                      []
                      graphqlDefaultResponseScalarDecoder
