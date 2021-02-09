module Dillonkearns.Examples.Github.Object.UpdateEnterpriseOrganizationProjectsSettingPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UpdateEnterpriseOrganizationProjectsSettingPayload, Scope__Enterprise)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateEnterpriseOrganizationProjectsSettingPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

enterprise
  :: forall r
   . SelectionSet Scope__Enterprise r
  -> SelectionSet
        Scope__UpdateEnterpriseOrganizationProjectsSettingPayload
        (Maybe r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message
  :: SelectionSet
     Scope__UpdateEnterpriseOrganizationProjectsSettingPayload
     (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
