module Examples.Github.Object.CancelEnterpriseAdminInvitationPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__CancelEnterpriseAdminInvitationPayload
  , Scope__EnterpriseAdministratorInvitation
  )
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__CancelEnterpriseAdminInvitationPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

invitation :: forall r . SelectionSet
                         Scope__EnterpriseAdministratorInvitation
                         r -> SelectionSet
                              Scope__CancelEnterpriseAdminInvitationPayload
                              (Maybe
                               r)
invitation = selectionForCompositeField
             "invitation"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message :: SelectionSet
           Scope__CancelEnterpriseAdminInvitationPayload
           (Maybe
            String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
