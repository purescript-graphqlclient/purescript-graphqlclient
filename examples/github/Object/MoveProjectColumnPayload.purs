module Examples.Github.Object.MoveProjectColumnPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__MoveProjectColumnPayload, Scope__ProjectColumnEdge)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__MoveProjectColumnPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

columnEdge :: forall r . SelectionSet
                         Scope__ProjectColumnEdge
                         r -> SelectionSet
                              Scope__MoveProjectColumnPayload
                              (Maybe
                               r)
columnEdge = selectionForCompositeField
             "columnEdge"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
