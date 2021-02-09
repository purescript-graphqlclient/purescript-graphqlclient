module Dillonkearns.Examples.Github.Object.DeclineTopicSuggestionPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__DeclineTopicSuggestionPayload, Scope__Topic)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__DeclineTopicSuggestionPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

topic
  :: forall r
   . SelectionSet Scope__Topic r
  -> SelectionSet Scope__DeclineTopicSuggestionPayload (Maybe r)
topic = selectionForCompositeField
        "topic"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
