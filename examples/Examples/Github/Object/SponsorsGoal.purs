module Examples.Github.Object.SponsorsGoal where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__SponsorsGoal)
import Data.Maybe (Maybe)
import Examples.Github.Enum.SponsorsGoalKind (SponsorsGoalKind)

description :: SelectionSet Scope__SponsorsGoal (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

kind :: SelectionSet Scope__SponsorsGoal SponsorsGoalKind
kind = selectionForField "kind" [] graphqlDefaultResponseScalarDecoder

percentComplete :: SelectionSet Scope__SponsorsGoal Int
percentComplete = selectionForField
                  "percentComplete"
                  []
                  graphqlDefaultResponseScalarDecoder

targetValue :: SelectionSet Scope__SponsorsGoal Int
targetValue = selectionForField
              "targetValue"
              []
              graphqlDefaultResponseScalarDecoder

title :: SelectionSet Scope__SponsorsGoal String
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder
