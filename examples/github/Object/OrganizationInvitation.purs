module Examples.Github.Object.OrganizationInvitation where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrganizationInvitation
  , Scope__User
  , Scope__Organization
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Enum.OrganizationInvitationType
  ( OrganizationInvitationType
  )
import Examples.Github.Enum.OrganizationInvitationRole
  ( OrganizationInvitationRole
  )

createdAt :: SelectionSet Scope__OrganizationInvitation DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

email :: SelectionSet Scope__OrganizationInvitation (Maybe String)
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrganizationInvitation Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

invitationType :: SelectionSet Scope__OrganizationInvitation OrganizationInvitationType
invitationType = selectionForField "invitationType" [] graphqlDefaultResponseScalarDecoder

invitee :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__OrganizationInvitation (Maybe r)
invitee = selectionForCompositeField "invitee" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

inviter :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__OrganizationInvitation r
inviter = selectionForCompositeField "inviter" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organization :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__OrganizationInvitation r
organization = selectionForCompositeField "organization" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

role :: SelectionSet Scope__OrganizationInvitation OrganizationInvitationRole
role = selectionForField "role" [] graphqlDefaultResponseScalarDecoder
