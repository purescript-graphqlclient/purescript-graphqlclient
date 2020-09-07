module Examples.Github.Object.ReopenIssuePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__ReopenIssuePayload, Scope__Issue)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__ReopenIssuePayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

issue :: forall r . SelectionSet
                    Scope__Issue
                    r -> SelectionSet
                         Scope__ReopenIssuePayload
                         (Maybe
                          r)
issue = selectionForCompositeField
        "issue"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
