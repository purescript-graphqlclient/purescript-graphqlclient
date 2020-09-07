module Examples.Github.Object.PullRequestChangedFile where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__PullRequestChangedFile)

additions :: SelectionSet Scope__PullRequestChangedFile Int
additions = selectionForField "additions" [] graphqlDefaultResponseScalarDecoder

deletions :: SelectionSet Scope__PullRequestChangedFile Int
deletions = selectionForField "deletions" [] graphqlDefaultResponseScalarDecoder

path :: SelectionSet Scope__PullRequestChangedFile String
path = selectionForField "path" [] graphqlDefaultResponseScalarDecoder
