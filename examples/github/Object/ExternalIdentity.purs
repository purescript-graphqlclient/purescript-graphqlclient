module Examples.Github.Object.ExternalIdentity where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__ExternalIdentity
  , Scope__OrganizationInvitation
  , Scope__ExternalIdentitySamlAttributes
  , Scope__ExternalIdentityScimAttributes
  , Scope__User
  )
import Examples.Github.Scalars (Id)
import Data.Maybe (Maybe)

guid :: SelectionSet Scope__ExternalIdentity String
guid = selectionForField "guid" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ExternalIdentity Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

organizationInvitation
  :: forall r
   . SelectionSet Scope__OrganizationInvitation r
  -> SelectionSet Scope__ExternalIdentity (Maybe r)
organizationInvitation = selectionForCompositeField
                         "organizationInvitation"
                         []
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

samlIdentity
  :: forall r
   . SelectionSet Scope__ExternalIdentitySamlAttributes r
  -> SelectionSet Scope__ExternalIdentity (Maybe r)
samlIdentity = selectionForCompositeField
               "samlIdentity"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

scimIdentity
  :: forall r
   . SelectionSet Scope__ExternalIdentityScimAttributes r
  -> SelectionSet Scope__ExternalIdentity (Maybe r)
scimIdentity = selectionForCompositeField
               "scimIdentity"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__ExternalIdentity (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
