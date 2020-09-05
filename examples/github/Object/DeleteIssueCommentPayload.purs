module Examples.Github.Object.DeleteIssueCommentPayload where

import GraphqlClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__DeleteIssueCommentPayload)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__DeleteIssueCommentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
