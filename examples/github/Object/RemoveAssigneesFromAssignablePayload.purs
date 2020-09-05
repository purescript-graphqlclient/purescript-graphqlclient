module Examples.Github.Object.RemoveAssigneesFromAssignablePayload where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Assignable, Scope__RemoveAssigneesFromAssignablePayload)
import Data.Maybe (Maybe)

assignable :: forall r . SelectionSet
                         Scope__Assignable
                         r -> SelectionSet
                              Scope__RemoveAssigneesFromAssignablePayload
                              (Maybe
                               r)
assignable = selectionForCompositeField
             "assignable"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet
                    Scope__RemoveAssigneesFromAssignablePayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
