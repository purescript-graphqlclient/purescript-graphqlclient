module Examples.Github.Object.RefUpdateRule where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__RefUpdateRule)
import Data.Maybe (Maybe)

allowsDeletions :: SelectionSet Scope__RefUpdateRule Boolean
allowsDeletions = selectionForField
                  "allowsDeletions"
                  []
                  graphqlDefaultResponseScalarDecoder

allowsForcePushes :: SelectionSet Scope__RefUpdateRule Boolean
allowsForcePushes = selectionForField
                    "allowsForcePushes"
                    []
                    graphqlDefaultResponseScalarDecoder

pattern :: SelectionSet Scope__RefUpdateRule String
pattern = selectionForField "pattern" [] graphqlDefaultResponseScalarDecoder

requiredApprovingReviewCount :: SelectionSet Scope__RefUpdateRule (Maybe Int)
requiredApprovingReviewCount = selectionForField
                               "requiredApprovingReviewCount"
                               []
                               graphqlDefaultResponseScalarDecoder

requiredStatusCheckContexts
  :: SelectionSet
     Scope__RefUpdateRule
     (Maybe (Array (Maybe String)))
requiredStatusCheckContexts = selectionForField
                              "requiredStatusCheckContexts"
                              []
                              graphqlDefaultResponseScalarDecoder

requiresLinearHistory :: SelectionSet Scope__RefUpdateRule Boolean
requiresLinearHistory = selectionForField
                        "requiresLinearHistory"
                        []
                        graphqlDefaultResponseScalarDecoder

requiresSignatures :: SelectionSet Scope__RefUpdateRule Boolean
requiresSignatures = selectionForField
                     "requiresSignatures"
                     []
                     graphqlDefaultResponseScalarDecoder

viewerCanPush :: SelectionSet Scope__RefUpdateRule Boolean
viewerCanPush = selectionForField
                "viewerCanPush"
                []
                graphqlDefaultResponseScalarDecoder
