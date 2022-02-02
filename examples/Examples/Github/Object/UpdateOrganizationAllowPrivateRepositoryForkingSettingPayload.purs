module Examples.Github.Object.UpdateOrganizationAllowPrivateRepositoryForkingSettingPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdateOrganizationAllowPrivateRepositoryForkingSettingPayload
  , Scope__Organization
  )
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateOrganizationAllowPrivateRepositoryForkingSettingPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

message
  :: SelectionSet
     Scope__UpdateOrganizationAllowPrivateRepositoryForkingSettingPayload
     (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet
        Scope__UpdateOrganizationAllowPrivateRepositoryForkingSettingPayload
        (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer
