module Dillonkearns.Examples.Github.Object.AddLabelsToLabelablePayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__AddLabelsToLabelablePayload, Scope__Labelable)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__AddLabelsToLabelablePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

labelable
  :: forall r
   . SelectionSet Scope__Labelable r
  -> SelectionSet Scope__AddLabelsToLabelablePayload (Maybe r)
labelable = selectionForCompositeField
            "labelable"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer
