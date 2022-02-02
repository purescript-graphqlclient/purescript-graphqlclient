module Examples.Github.Object.OrganizationIdentityProvider where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrganizationIdentityProvider
  , Scope__ExternalIdentityConnection
  , Scope__Organization
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, Id, X509Certificate)
import Type.Row (type (+))

digestMethod :: SelectionSet Scope__OrganizationIdentityProvider (Maybe Uri)
digestMethod = selectionForField
               "digestMethod"
               []
               graphqlDefaultResponseScalarDecoder

type ExternalIdentitiesInputRowOptional r
  = ( membersOnly :: Optional Boolean
    , login :: Optional String
    , userName :: Optional String
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type ExternalIdentitiesInput = { | ExternalIdentitiesInputRowOptional + () }

externalIdentities
  :: forall r
   . ExternalIdentitiesInput
  -> SelectionSet Scope__ExternalIdentityConnection r
  -> SelectionSet Scope__OrganizationIdentityProvider r
externalIdentities input = selectionForCompositeField
                           "externalIdentities"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__OrganizationIdentityProvider Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

idpCertificate
  :: SelectionSet
     Scope__OrganizationIdentityProvider
     (Maybe X509Certificate)
idpCertificate = selectionForField
                 "idpCertificate"
                 []
                 graphqlDefaultResponseScalarDecoder

issuer :: SelectionSet Scope__OrganizationIdentityProvider (Maybe String)
issuer = selectionForField "issuer" [] graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__OrganizationIdentityProvider (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

signatureMethod :: SelectionSet Scope__OrganizationIdentityProvider (Maybe Uri)
signatureMethod = selectionForField
                  "signatureMethod"
                  []
                  graphqlDefaultResponseScalarDecoder

ssoUrl :: SelectionSet Scope__OrganizationIdentityProvider (Maybe Uri)
ssoUrl = selectionForField "ssoUrl" [] graphqlDefaultResponseScalarDecoder
