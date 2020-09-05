module Examples.Github.Object.EnterpriseIdentityProvider where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphqlArguments
  )
import Examples.Github.Scopes
  ( Scope__EnterpriseIdentityProvider
  , Scope__Enterprise
  , Scope__ExternalIdentityConnection
  )
import Data.Maybe (Maybe)
import Examples.Github.Enum.SamlDigestAlgorithm (SamlDigestAlgorithm)
import Type.Row (type (+))
import Examples.Github.Scalars (Id, X509Certificate, Uri)
import Examples.Github.Enum.SamlSignatureAlgorithm (SamlSignatureAlgorithm)

digestMethod :: SelectionSet
                Scope__EnterpriseIdentityProvider
                (Maybe
                 SamlDigestAlgorithm)
digestMethod = selectionForField
               "digestMethod"
               []
               graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet
                         Scope__Enterprise
                         r -> SelectionSet
                              Scope__EnterpriseIdentityProvider
                              (Maybe
                               r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ExternalIdentitiesInputRowOptional r = ( after :: Optional
                                                       String
                                            , before :: Optional String
                                            , first :: Optional Int
                                            , last :: Optional Int
                                            | r
                                            )

type ExternalIdentitiesInput = { | ExternalIdentitiesInputRowOptional + () }

externalIdentities :: forall r . ExternalIdentitiesInput -> SelectionSet
                                                            Scope__ExternalIdentityConnection
                                                            r -> SelectionSet
                                                                 Scope__EnterpriseIdentityProvider
                                                                 r
externalIdentities input = selectionForCompositeField
                           "externalIdentities"
                           (toGraphqlArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__EnterpriseIdentityProvider Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

idpCertificate :: SelectionSet
                  Scope__EnterpriseIdentityProvider
                  (Maybe
                   X509Certificate)
idpCertificate = selectionForField
                 "idpCertificate"
                 []
                 graphqlDefaultResponseScalarDecoder

issuer :: SelectionSet Scope__EnterpriseIdentityProvider (Maybe String)
issuer = selectionForField "issuer" [] graphqlDefaultResponseScalarDecoder

recoveryCodes :: SelectionSet
                 Scope__EnterpriseIdentityProvider
                 (Maybe
                  (Array
                   String))
recoveryCodes = selectionForField
                "recoveryCodes"
                []
                graphqlDefaultResponseScalarDecoder

signatureMethod :: SelectionSet
                   Scope__EnterpriseIdentityProvider
                   (Maybe
                    SamlSignatureAlgorithm)
signatureMethod = selectionForField
                  "signatureMethod"
                  []
                  graphqlDefaultResponseScalarDecoder

ssoUrl :: SelectionSet Scope__EnterpriseIdentityProvider (Maybe Uri)
ssoUrl = selectionForField "ssoUrl" [] graphqlDefaultResponseScalarDecoder
