module Examples.Github.Object.UpdateEnterpriseMembersCanDeleteRepositoriesSettingPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdateEnterpriseMembersCanDeleteRepositoriesSettingPayload
  , Scope__Enterprise
  )
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__UpdateEnterpriseMembersCanDeleteRepositoriesSettingPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet
                         Scope__Enterprise
                         r -> SelectionSet
                              Scope__UpdateEnterpriseMembersCanDeleteRepositoriesSettingPayload
                              (Maybe
                               r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message :: SelectionSet
           Scope__UpdateEnterpriseMembersCanDeleteRepositoriesSettingPayload
           (Maybe
            String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
