module Examples.Github.Object.RegenerateEnterpriseIdentityProviderRecoveryCodesPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__RegenerateEnterpriseIdentityProviderRecoveryCodesPayload
  , Scope__EnterpriseIdentityProvider
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__RegenerateEnterpriseIdentityProviderRecoveryCodesPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

identityProvider :: forall r . SelectionSet Scope__EnterpriseIdentityProvider r -> SelectionSet Scope__RegenerateEnterpriseIdentityProviderRecoveryCodesPayload (Maybe r)
identityProvider = selectionForCompositeField "identityProvider" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
