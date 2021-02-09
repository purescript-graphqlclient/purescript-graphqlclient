module Examples.Github.Object.ProjectProgress where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__ProjectProgress)

doneCount :: SelectionSet Scope__ProjectProgress Int
doneCount = selectionForField "doneCount" [] graphqlDefaultResponseScalarDecoder

donePercentage :: SelectionSet Scope__ProjectProgress Number
donePercentage = selectionForField
                 "donePercentage"
                 []
                 graphqlDefaultResponseScalarDecoder

enabled :: SelectionSet Scope__ProjectProgress Boolean
enabled = selectionForField "enabled" [] graphqlDefaultResponseScalarDecoder

inProgressCount :: SelectionSet Scope__ProjectProgress Int
inProgressCount = selectionForField
                  "inProgressCount"
                  []
                  graphqlDefaultResponseScalarDecoder

inProgressPercentage :: SelectionSet Scope__ProjectProgress Number
inProgressPercentage = selectionForField
                       "inProgressPercentage"
                       []
                       graphqlDefaultResponseScalarDecoder

todoCount :: SelectionSet Scope__ProjectProgress Int
todoCount = selectionForField "todoCount" [] graphqlDefaultResponseScalarDecoder

todoPercentage :: SelectionSet Scope__ProjectProgress Number
todoPercentage = selectionForField
                 "todoPercentage"
                 []
                 graphqlDefaultResponseScalarDecoder
