module Dillonkearns.Examples.Github.Object.DeleteTeamDiscussionCommentPayload where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes
  (Scope__DeleteTeamDiscussionCommentPayload)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__DeleteTeamDiscussionCommentPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
