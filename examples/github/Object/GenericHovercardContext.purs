module Examples.Github.Object.GenericHovercardContext where

import GraphqlClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__GenericHovercardContext)

message :: SelectionSet Scope__GenericHovercardContext String
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

octicon :: SelectionSet Scope__GenericHovercardContext String
octicon = selectionForField "octicon" [] graphqlDefaultResponseScalarDecoder
