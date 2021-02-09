module Dillonkearns.Examples.Github.Object.PullRequestChangedFile where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__PullRequestChangedFile)
import Dillonkearns.Examples.Github.Enum.FileViewedState (FileViewedState)

additions :: SelectionSet Scope__PullRequestChangedFile Int
additions = selectionForField "additions" [] graphqlDefaultResponseScalarDecoder

deletions :: SelectionSet Scope__PullRequestChangedFile Int
deletions = selectionForField "deletions" [] graphqlDefaultResponseScalarDecoder

path :: SelectionSet Scope__PullRequestChangedFile String
path = selectionForField "path" [] graphqlDefaultResponseScalarDecoder

viewerViewedState :: SelectionSet Scope__PullRequestChangedFile FileViewedState
viewerViewedState = selectionForField
                    "viewerViewedState"
                    []
                    graphqlDefaultResponseScalarDecoder
