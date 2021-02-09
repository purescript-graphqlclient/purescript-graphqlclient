module Dillonkearns.Examples.Github.Object.DeleteTeamDiscussionPayload where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__DeleteTeamDiscussionPayload)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__DeleteTeamDiscussionPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
