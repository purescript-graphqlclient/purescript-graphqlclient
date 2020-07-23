module Examples.Github.Object.UpdateEnterpriseActionExecutionCapabilitySettingPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdateEnterpriseActionExecutionCapabilitySettingPayload
  , Scope__Enterprise
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__UpdateEnterpriseActionExecutionCapabilitySettingPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet Scope__Enterprise r -> SelectionSet Scope__UpdateEnterpriseActionExecutionCapabilitySettingPayload (Maybe r)
enterprise = selectionForCompositeField "enterprise" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message :: SelectionSet Scope__UpdateEnterpriseActionExecutionCapabilitySettingPayload (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
