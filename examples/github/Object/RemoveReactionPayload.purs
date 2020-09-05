module Examples.Github.Object.RemoveReactionPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__RemoveReactionPayload, Scope__Reaction, Scope__Reactable)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__RemoveReactionPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

reaction :: forall r . SelectionSet
                       Scope__Reaction
                       r -> SelectionSet
                            Scope__RemoveReactionPayload
                            (Maybe
                             r)
reaction = selectionForCompositeField
           "reaction"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

subject :: forall r . SelectionSet
                      Scope__Reactable
                      r -> SelectionSet
                           Scope__RemoveReactionPayload
                           (Maybe
                            r)
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
