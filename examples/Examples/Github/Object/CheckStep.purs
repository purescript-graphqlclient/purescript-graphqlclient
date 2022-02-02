module Examples.Github.Object.CheckStep where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__CheckStep)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime)
import Examples.Github.Enum.CheckConclusionState (CheckConclusionState)
import Examples.Github.Enum.CheckStatusState (CheckStatusState)

completedAt :: SelectionSet Scope__CheckStep (Maybe DateTime)
completedAt = selectionForField
              "completedAt"
              []
              graphqlDefaultResponseScalarDecoder

conclusion :: SelectionSet Scope__CheckStep (Maybe CheckConclusionState)
conclusion = selectionForField
             "conclusion"
             []
             graphqlDefaultResponseScalarDecoder

externalId :: SelectionSet Scope__CheckStep (Maybe String)
externalId = selectionForField
             "externalId"
             []
             graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__CheckStep String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

number :: SelectionSet Scope__CheckStep Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

secondsToCompletion :: SelectionSet Scope__CheckStep (Maybe Int)
secondsToCompletion = selectionForField
                      "secondsToCompletion"
                      []
                      graphqlDefaultResponseScalarDecoder

startedAt :: SelectionSet Scope__CheckStep (Maybe DateTime)
startedAt = selectionForField "startedAt" [] graphqlDefaultResponseScalarDecoder

status :: SelectionSet Scope__CheckStep CheckStatusState
status = selectionForField "status" [] graphqlDefaultResponseScalarDecoder
