module Examples.Github.Object.AddProjectColumnPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__AddProjectColumnPayload, Scope__ProjectColumnEdge, Scope__Project)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__AddProjectColumnPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

columnEdge
  :: forall r
   . SelectionSet Scope__ProjectColumnEdge r
  -> SelectionSet Scope__AddProjectColumnPayload (Maybe r)
columnEdge = selectionForCompositeField
             "columnEdge"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

project
  :: forall r
   . SelectionSet Scope__Project r
  -> SelectionSet Scope__AddProjectColumnPayload (Maybe r)
project = selectionForCompositeField
          "project"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
