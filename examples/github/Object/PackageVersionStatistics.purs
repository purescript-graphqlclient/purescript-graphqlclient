module Examples.Github.Object.PackageVersionStatistics where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__PackageVersionStatistics)

downloadsTotalCount :: SelectionSet Scope__PackageVersionStatistics Int
downloadsTotalCount = selectionForField
                      "downloadsTotalCount"
                      []
                      graphqlDefaultResponseScalarDecoder
