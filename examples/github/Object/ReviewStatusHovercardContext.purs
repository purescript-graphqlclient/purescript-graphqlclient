module Examples.Github.Object.ReviewStatusHovercardContext where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__ReviewStatusHovercardContext)
import Data.Maybe (Maybe)
import Examples.Github.Enum.PullRequestReviewDecision
  (PullRequestReviewDecision)

message :: SelectionSet Scope__ReviewStatusHovercardContext String
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

octicon :: SelectionSet Scope__ReviewStatusHovercardContext String
octicon = selectionForField "octicon" [] graphqlDefaultResponseScalarDecoder

reviewDecision :: SelectionSet
                  Scope__ReviewStatusHovercardContext
                  (Maybe
                   PullRequestReviewDecision)
reviewDecision = selectionForField
                 "reviewDecision"
                 []
                 graphqlDefaultResponseScalarDecoder
