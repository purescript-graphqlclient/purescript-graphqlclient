module Examples.Github.Object.InviteEnterpriseAdminPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__InviteEnterpriseAdminPayload
  , Scope__EnterpriseAdministratorInvitation
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__InviteEnterpriseAdminPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

invitation :: forall r . SelectionSet Scope__EnterpriseAdministratorInvitation r -> SelectionSet Scope__InviteEnterpriseAdminPayload (Maybe r)
invitation = selectionForCompositeField "invitation" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
