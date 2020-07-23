module Examples.Github.Object.RemoveEnterpriseIdentityProviderPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__RemoveEnterpriseIdentityProviderPayload
  , Scope__EnterpriseIdentityProvider
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__RemoveEnterpriseIdentityProviderPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

identityProvider :: forall r . SelectionSet Scope__EnterpriseIdentityProvider r -> SelectionSet Scope__RemoveEnterpriseIdentityProviderPayload (Maybe r)
identityProvider = selectionForCompositeField "identityProvider" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
