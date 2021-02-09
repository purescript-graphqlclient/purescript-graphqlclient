module Dillonkearns.Examples.Github.Object.ReviewStatusHovercardContext where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__ReviewStatusHovercardContext)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Enum.PullRequestReviewDecision
  (PullRequestReviewDecision)

message :: SelectionSet Scope__ReviewStatusHovercardContext String
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

octicon :: SelectionSet Scope__ReviewStatusHovercardContext String
octicon = selectionForField "octicon" [] graphqlDefaultResponseScalarDecoder

reviewDecision
  :: SelectionSet
     Scope__ReviewStatusHovercardContext
     (Maybe PullRequestReviewDecision)
reviewDecision = selectionForField
                 "reviewDecision"
                 []
                 graphqlDefaultResponseScalarDecoder
