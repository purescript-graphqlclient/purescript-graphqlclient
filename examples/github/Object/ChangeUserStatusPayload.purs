module Examples.Github.Object.ChangeUserStatusPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__ChangeUserStatusPayload, Scope__UserStatus)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__ChangeUserStatusPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

status
  :: forall r
   . SelectionSet Scope__UserStatus r
  -> SelectionSet Scope__ChangeUserStatusPayload (Maybe r)
status = selectionForCompositeField
         "status"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
