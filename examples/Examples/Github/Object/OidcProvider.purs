module Examples.Github.Object.OidcProvider where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphQLArguments
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Enterprise, Scope__OidcProvider, Scope__ExternalIdentityConnection)
import Data.Maybe (Maybe)
import Type.Row (type (+))
import Examples.Github.Scalars (Id)
import Examples.Github.Enum.OidcProviderType (OidcProviderType)

enterprise
  :: forall r
   . SelectionSet Scope__Enterprise r
  -> SelectionSet Scope__OidcProvider (Maybe r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

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
  -> SelectionSet Scope__OidcProvider r
externalIdentities input = selectionForCompositeField
                           "externalIdentities"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__OidcProvider Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

providerType :: SelectionSet Scope__OidcProvider OidcProviderType
providerType = selectionForField
               "providerType"
               []
               graphqlDefaultResponseScalarDecoder

tenantId :: SelectionSet Scope__OidcProvider String
tenantId = selectionForField "tenantId" [] graphqlDefaultResponseScalarDecoder
