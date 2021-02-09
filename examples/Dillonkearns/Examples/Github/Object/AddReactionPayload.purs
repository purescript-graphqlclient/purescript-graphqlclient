module Dillonkearns.Examples.Github.Object.AddReactionPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__AddReactionPayload, Scope__Reaction, Scope__Reactable)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__AddReactionPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

reaction
  :: forall r
   . SelectionSet Scope__Reaction r
  -> SelectionSet Scope__AddReactionPayload (Maybe r)
reaction = selectionForCompositeField
           "reaction"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

subject
  :: forall r
   . SelectionSet Scope__Reactable r
  -> SelectionSet Scope__AddReactionPayload (Maybe r)
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
