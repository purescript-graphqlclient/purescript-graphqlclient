module Examples.Github.Object.AcceptEnterpriseAdministratorInvitationPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__AcceptEnterpriseAdministratorInvitationPayload
  , Scope__EnterpriseAdministratorInvitation
  )
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__AcceptEnterpriseAdministratorInvitationPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

invitation
  :: forall r
   . SelectionSet Scope__EnterpriseAdministratorInvitation r
  -> SelectionSet
        Scope__AcceptEnterpriseAdministratorInvitationPayload
        (Maybe r)
invitation = selectionForCompositeField
             "invitation"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message
  :: SelectionSet
     Scope__AcceptEnterpriseAdministratorInvitationPayload
     (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
