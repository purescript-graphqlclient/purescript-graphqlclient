module Dillonkearns.Examples.Github.Object.MoveProjectCardPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__ProjectCardEdge, Scope__MoveProjectCardPayload)
import Data.Maybe (Maybe)

cardEdge
  :: forall r
   . SelectionSet Scope__ProjectCardEdge r
  -> SelectionSet Scope__MoveProjectCardPayload (Maybe r)
cardEdge = selectionForCompositeField
           "cardEdge"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet Scope__MoveProjectCardPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
