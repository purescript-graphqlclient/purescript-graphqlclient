module Dillonkearns.Examples.Github.Object.RemoveOutsideCollaboratorPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__RemoveOutsideCollaboratorPayload, Scope__User)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__RemoveOutsideCollaboratorPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

removedUser
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__RemoveOutsideCollaboratorPayload (Maybe r)
removedUser = selectionForCompositeField
              "removedUser"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
