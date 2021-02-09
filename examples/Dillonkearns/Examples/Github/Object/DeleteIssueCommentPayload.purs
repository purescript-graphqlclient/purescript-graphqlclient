module Dillonkearns.Examples.Github.Object.DeleteIssueCommentPayload where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__DeleteIssueCommentPayload)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__DeleteIssueCommentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
