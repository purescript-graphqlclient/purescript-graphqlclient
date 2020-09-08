module Examples.Github.Object.DeleteIssueCommentPayload where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__DeleteIssueCommentPayload)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__DeleteIssueCommentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
