module Dillonkearns.Examples.Github.Object.UpdateEnterpriseTwoFactorAuthenticationRequiredSettingPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__UpdateEnterpriseTwoFactorAuthenticationRequiredSettingPayload
  , Scope__Enterprise
  )
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateEnterpriseTwoFactorAuthenticationRequiredSettingPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

enterprise
  :: forall r
   . SelectionSet Scope__Enterprise r
  -> SelectionSet
        Scope__UpdateEnterpriseTwoFactorAuthenticationRequiredSettingPayload
        (Maybe r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message
  :: SelectionSet
     Scope__UpdateEnterpriseTwoFactorAuthenticationRequiredSettingPayload
     (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
