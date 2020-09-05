module Examples.Github.Object.RemoveEnterpriseAdminPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__User, Scope__RemoveEnterpriseAdminPayload, Scope__Enterprise)
import Data.Maybe (Maybe)

admin :: forall r . SelectionSet
                    Scope__User
                    r -> SelectionSet
                         Scope__RemoveEnterpriseAdminPayload
                         (Maybe
                          r)
admin = selectionForCompositeField
        "admin"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet
                    Scope__RemoveEnterpriseAdminPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet
                         Scope__Enterprise
                         r -> SelectionSet
                              Scope__RemoveEnterpriseAdminPayload
                              (Maybe
                               r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message :: SelectionSet Scope__RemoveEnterpriseAdminPayload (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

viewer :: forall r . SelectionSet
                     Scope__User
                     r -> SelectionSet
                          Scope__RemoveEnterpriseAdminPayload
                          (Maybe
                           r)
viewer = selectionForCompositeField
         "viewer"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
