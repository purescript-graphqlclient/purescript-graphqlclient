module Examples.Github.Object.UserEmailMetadata where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__UserEmailMetadata)
import Data.Maybe (Maybe)

primary :: SelectionSet Scope__UserEmailMetadata (Maybe Boolean)
primary = selectionForField "primary" [] graphqlDefaultResponseScalarDecoder

type_ :: SelectionSet Scope__UserEmailMetadata (Maybe String)
type_ = selectionForField "type" [] graphqlDefaultResponseScalarDecoder

value :: SelectionSet Scope__UserEmailMetadata String
value = selectionForField "value" [] graphqlDefaultResponseScalarDecoder
