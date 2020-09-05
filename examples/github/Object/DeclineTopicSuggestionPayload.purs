module Examples.Github.Object.DeclineTopicSuggestionPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeclineTopicSuggestionPayload, Scope__Topic)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__DeclineTopicSuggestionPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

topic :: forall r . SelectionSet
                    Scope__Topic
                    r -> SelectionSet
                         Scope__DeclineTopicSuggestionPayload
                         (Maybe
                          r)
topic = selectionForCompositeField
        "topic"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
