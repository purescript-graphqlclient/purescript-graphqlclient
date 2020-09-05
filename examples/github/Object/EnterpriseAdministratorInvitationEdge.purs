module Examples.Github.Object.EnterpriseAdministratorInvitationEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__EnterpriseAdministratorInvitationEdge
  , Scope__EnterpriseAdministratorInvitation
  )
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__EnterpriseAdministratorInvitationEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__EnterpriseAdministratorInvitation
                   r -> SelectionSet
                        Scope__EnterpriseAdministratorInvitationEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
