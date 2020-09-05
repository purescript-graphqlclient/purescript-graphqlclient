module Examples.Github.Object.EnterpriseAdministratorInvitation where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__EnterpriseAdministratorInvitation, Scope__Enterprise, Scope__User)
import Examples.Github.Scalars (DateTime, Id)
import Data.Maybe (Maybe)
import Examples.Github.Enum.EnterpriseAdministratorRole
  (EnterpriseAdministratorRole)

createdAt :: SelectionSet Scope__EnterpriseAdministratorInvitation DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

email :: SelectionSet Scope__EnterpriseAdministratorInvitation (Maybe String)
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet
                         Scope__Enterprise
                         r -> SelectionSet
                              Scope__EnterpriseAdministratorInvitation
                              r
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__EnterpriseAdministratorInvitation Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

invitee :: forall r . SelectionSet
                      Scope__User
                      r -> SelectionSet
                           Scope__EnterpriseAdministratorInvitation
                           (Maybe
                            r)
invitee = selectionForCompositeField
          "invitee"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

inviter :: forall r . SelectionSet
                      Scope__User
                      r -> SelectionSet
                           Scope__EnterpriseAdministratorInvitation
                           (Maybe
                            r)
inviter = selectionForCompositeField
          "inviter"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

role :: SelectionSet
        Scope__EnterpriseAdministratorInvitation
        EnterpriseAdministratorRole
role = selectionForField "role" [] graphqlDefaultResponseScalarDecoder
