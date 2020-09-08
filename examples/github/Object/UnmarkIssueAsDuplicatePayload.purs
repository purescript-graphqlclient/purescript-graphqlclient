module Examples.Github.Object.UnmarkIssueAsDuplicatePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__UnmarkIssueAsDuplicatePayload, Scope__IssueOrPullRequest)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__UnmarkIssueAsDuplicatePayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

duplicate :: forall r . SelectionSet
                        Scope__IssueOrPullRequest
                        r -> SelectionSet
                             Scope__UnmarkIssueAsDuplicatePayload
                             (Maybe
                              r)
duplicate = selectionForCompositeField
            "duplicate"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer
