module Examples.Github.Object.MarkFileAsViewedPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__MarkFileAsViewedPayload, Scope__PullRequest)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__MarkFileAsViewedPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet
                          Scope__PullRequest
                          r -> SelectionSet
                               Scope__MarkFileAsViewedPayload
                               (Maybe
                                r)
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
