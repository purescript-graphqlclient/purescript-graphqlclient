module Examples.Github.Object.DeleteProjectNextItemPayload where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__DeleteProjectNextItemPayload)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id)

clientMutationId
  :: SelectionSet
     Scope__DeleteProjectNextItemPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

deletedItemId :: SelectionSet Scope__DeleteProjectNextItemPayload (Maybe Id)
deletedItemId = selectionForField
                "deletedItemId"
                []
                graphqlDefaultResponseScalarDecoder
