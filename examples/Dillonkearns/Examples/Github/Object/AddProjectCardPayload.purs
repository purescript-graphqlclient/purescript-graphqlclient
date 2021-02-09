module Dillonkearns.Examples.Github.Object.AddProjectCardPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__ProjectCardEdge, Scope__AddProjectCardPayload, Scope__ProjectColumn)
import Data.Maybe (Maybe)

cardEdge
  :: forall r
   . SelectionSet Scope__ProjectCardEdge r
  -> SelectionSet Scope__AddProjectCardPayload (Maybe r)
cardEdge = selectionForCompositeField
           "cardEdge"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet Scope__AddProjectCardPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

projectColumn
  :: forall r
   . SelectionSet Scope__ProjectColumn r
  -> SelectionSet Scope__AddProjectCardPayload (Maybe r)
projectColumn = selectionForCompositeField
                "projectColumn"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer
