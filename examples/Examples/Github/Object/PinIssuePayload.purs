module Examples.Github.Object.PinIssuePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__PinIssuePayload, Scope__Issue)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__PinIssuePayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

issue
  :: forall r
   . SelectionSet Scope__Issue r
  -> SelectionSet Scope__PinIssuePayload (Maybe r)
issue = selectionForCompositeField
        "issue"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
