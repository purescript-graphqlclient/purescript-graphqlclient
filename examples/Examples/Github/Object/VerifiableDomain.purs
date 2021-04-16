module Examples.Github.Object.VerifiableDomain where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__VerifiableDomain, Scope__VerifiableDomainOwner)
import Examples.Github.Scalars (DateTime, Uri, Id)
import Data.Maybe (Maybe)

createdAt :: SelectionSet Scope__VerifiableDomain DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__VerifiableDomain (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

dnsHostName :: SelectionSet Scope__VerifiableDomain (Maybe Uri)
dnsHostName = selectionForField
              "dnsHostName"
              []
              graphqlDefaultResponseScalarDecoder

domain :: SelectionSet Scope__VerifiableDomain Uri
domain = selectionForField "domain" [] graphqlDefaultResponseScalarDecoder

hasFoundHostName :: SelectionSet Scope__VerifiableDomain Boolean
hasFoundHostName = selectionForField
                   "hasFoundHostName"
                   []
                   graphqlDefaultResponseScalarDecoder

hasFoundVerificationToken :: SelectionSet Scope__VerifiableDomain Boolean
hasFoundVerificationToken = selectionForField
                            "hasFoundVerificationToken"
                            []
                            graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__VerifiableDomain Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isRequiredForPolicyEnforcement :: SelectionSet Scope__VerifiableDomain Boolean
isRequiredForPolicyEnforcement = selectionForField
                                 "isRequiredForPolicyEnforcement"
                                 []
                                 graphqlDefaultResponseScalarDecoder

isVerified :: SelectionSet Scope__VerifiableDomain Boolean
isVerified = selectionForField
             "isVerified"
             []
             graphqlDefaultResponseScalarDecoder

owner
  :: forall r
   . SelectionSet Scope__VerifiableDomainOwner r
  -> SelectionSet Scope__VerifiableDomain r
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

punycodeEncodedDomain :: SelectionSet Scope__VerifiableDomain Uri
punycodeEncodedDomain = selectionForField
                        "punycodeEncodedDomain"
                        []
                        graphqlDefaultResponseScalarDecoder

tokenExpirationTime :: SelectionSet Scope__VerifiableDomain (Maybe DateTime)
tokenExpirationTime = selectionForField
                      "tokenExpirationTime"
                      []
                      graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__VerifiableDomain DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

verificationToken :: SelectionSet Scope__VerifiableDomain (Maybe String)
verificationToken = selectionForField
                    "verificationToken"
                    []
                    graphqlDefaultResponseScalarDecoder
