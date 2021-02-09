module Dillonkearns.Examples.Github.Object.ClearLabelsFromLabelablePayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__ClearLabelsFromLabelablePayload, Scope__Labelable)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__ClearLabelsFromLabelablePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

labelable
  :: forall r
   . SelectionSet Scope__Labelable r
  -> SelectionSet Scope__ClearLabelsFromLabelablePayload (Maybe r)
labelable = selectionForCompositeField
            "labelable"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer
