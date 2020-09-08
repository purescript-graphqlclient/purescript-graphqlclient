module Examples.Github.Object.AddAssigneesToAssignablePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Assignable, Scope__AddAssigneesToAssignablePayload)
import Data.Maybe (Maybe)

assignable :: forall r . SelectionSet
                         Scope__Assignable
                         r -> SelectionSet
                              Scope__AddAssigneesToAssignablePayload
                              (Maybe
                               r)
assignable = selectionForCompositeField
             "assignable"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet
                    Scope__AddAssigneesToAssignablePayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
