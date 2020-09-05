module Examples.Github.Object.UpdateEnterpriseMembersCanMakePurchasesSettingPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdateEnterpriseMembersCanMakePurchasesSettingPayload
  , Scope__Enterprise
  )
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__UpdateEnterpriseMembersCanMakePurchasesSettingPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet
                         Scope__Enterprise
                         r -> SelectionSet
                              Scope__UpdateEnterpriseMembersCanMakePurchasesSettingPayload
                              (Maybe
                               r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message :: SelectionSet
           Scope__UpdateEnterpriseMembersCanMakePurchasesSettingPayload
           (Maybe
            String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
