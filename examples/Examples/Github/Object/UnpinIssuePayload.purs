module Examples.Github.Object.UnpinIssuePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__UnpinIssuePayload, Scope__Issue)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__UnpinIssuePayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

issue
  :: forall r
   . SelectionSet Scope__Issue r
  -> SelectionSet Scope__UnpinIssuePayload (Maybe r)
issue = selectionForCompositeField
        "issue"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
