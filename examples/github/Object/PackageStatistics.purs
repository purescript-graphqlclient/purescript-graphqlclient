module Examples.Github.Object.PackageStatistics where

import GraphqlClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__PackageStatistics)

downloadsTotalCount :: SelectionSet Scope__PackageStatistics Int
downloadsTotalCount = selectionForField
                      "downloadsTotalCount"
                      []
                      graphqlDefaultResponseScalarDecoder
