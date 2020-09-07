module Examples.Github.Object.UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingPayload
  , Scope__Enterprise
  )
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet
                         Scope__Enterprise
                         r -> SelectionSet
                              Scope__UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingPayload
                              (Maybe
                               r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message :: SelectionSet
           Scope__UpdateEnterpriseMembersCanUpdateProtectedBranchesSettingPayload
           (Maybe
            String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
