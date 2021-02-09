module Dillonkearns.Examples.Github.Object.RemoveLabelsFromLabelablePayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__RemoveLabelsFromLabelablePayload, Scope__Labelable)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__RemoveLabelsFromLabelablePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

labelable
  :: forall r
   . SelectionSet Scope__Labelable r
  -> SelectionSet Scope__RemoveLabelsFromLabelablePayload (Maybe r)
labelable = selectionForCompositeField
            "labelable"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer
