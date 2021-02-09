module Dillonkearns.Examples.Github.Object.GenericHovercardContext where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__GenericHovercardContext)

message :: SelectionSet Scope__GenericHovercardContext String
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

octicon :: SelectionSet Scope__GenericHovercardContext String
octicon = selectionForField "octicon" [] graphqlDefaultResponseScalarDecoder
