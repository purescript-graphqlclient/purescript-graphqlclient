module Dillonkearns.Examples.Github.Object.UpdateEnterpriseMembersCanViewDependencyInsightsSettingPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__UpdateEnterpriseMembersCanViewDependencyInsightsSettingPayload
  , Scope__Enterprise
  )
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateEnterpriseMembersCanViewDependencyInsightsSettingPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

enterprise
  :: forall r
   . SelectionSet Scope__Enterprise r
  -> SelectionSet
        Scope__UpdateEnterpriseMembersCanViewDependencyInsightsSettingPayload
        (Maybe r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message
  :: SelectionSet
     Scope__UpdateEnterpriseMembersCanViewDependencyInsightsSettingPayload
     (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
