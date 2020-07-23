module Examples.Github.Object.PackageVersionStatistics where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__PackageVersionStatistics
  )

downloadsTotalCount :: SelectionSet Scope__PackageVersionStatistics Int
downloadsTotalCount = selectionForField "downloadsTotalCount" [] graphqlDefaultResponseScalarDecoder
