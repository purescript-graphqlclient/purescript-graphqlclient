module Dillonkearns.Examples.Github.Object.AcceptTopicSuggestionPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__AcceptTopicSuggestionPayload, Scope__Topic)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__AcceptTopicSuggestionPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

topic
  :: forall r
   . SelectionSet Scope__Topic r
  -> SelectionSet Scope__AcceptTopicSuggestionPayload (Maybe r)
topic = selectionForCompositeField
        "topic"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
