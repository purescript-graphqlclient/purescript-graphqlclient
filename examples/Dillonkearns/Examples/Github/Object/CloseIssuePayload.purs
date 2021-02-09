module Dillonkearns.Examples.Github.Object.CloseIssuePayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__CloseIssuePayload, Scope__Issue)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__CloseIssuePayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

issue
  :: forall r
   . SelectionSet Scope__Issue r
  -> SelectionSet Scope__CloseIssuePayload (Maybe r)
issue = selectionForCompositeField
        "issue"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
