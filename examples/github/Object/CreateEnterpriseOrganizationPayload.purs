module Examples.Github.Object.CreateEnterpriseOrganizationPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__CreateEnterpriseOrganizationPayload
  , Scope__Enterprise
  , Scope__Organization
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__CreateEnterpriseOrganizationPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet Scope__Enterprise r -> SelectionSet Scope__CreateEnterpriseOrganizationPayload (Maybe r)
enterprise = selectionForCompositeField "enterprise" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organization :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__CreateEnterpriseOrganizationPayload (Maybe r)
organization = selectionForCompositeField "organization" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
