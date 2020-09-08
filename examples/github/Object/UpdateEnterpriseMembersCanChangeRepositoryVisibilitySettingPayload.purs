module Examples.Github.Object.UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingPayload
  , Scope__Enterprise
  )
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet
                         Scope__Enterprise
                         r -> SelectionSet
                              Scope__UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingPayload
                              (Maybe
                               r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message :: SelectionSet
           Scope__UpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingPayload
           (Maybe
            String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
