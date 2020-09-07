module Examples.Github.Object.UpdateEnterpriseRepositoryProjectsSettingPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__UpdateEnterpriseRepositoryProjectsSettingPayload, Scope__Enterprise)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__UpdateEnterpriseRepositoryProjectsSettingPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet
                         Scope__Enterprise
                         r -> SelectionSet
                              Scope__UpdateEnterpriseRepositoryProjectsSettingPayload
                              (Maybe
                               r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message :: SelectionSet
           Scope__UpdateEnterpriseRepositoryProjectsSettingPayload
           (Maybe
            String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
