module Dillonkearns.Examples.Github.Object.RemoveEnterpriseOrganizationPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__RemoveEnterpriseOrganizationPayload
  , Scope__Enterprise
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__RemoveEnterpriseOrganizationPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

enterprise
  :: forall r
   . SelectionSet Scope__Enterprise r
  -> SelectionSet Scope__RemoveEnterpriseOrganizationPayload (Maybe r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__RemoveEnterpriseOrganizationPayload (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewer
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__RemoveEnterpriseOrganizationPayload (Maybe r)
viewer = selectionForCompositeField
         "viewer"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
