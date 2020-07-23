module Examples.Github.Object.UpdateEnterpriseMembersCanInviteCollaboratorsSettingPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdateEnterpriseMembersCanInviteCollaboratorsSettingPayload
  , Scope__Enterprise
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__UpdateEnterpriseMembersCanInviteCollaboratorsSettingPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet Scope__Enterprise r -> SelectionSet Scope__UpdateEnterpriseMembersCanInviteCollaboratorsSettingPayload (Maybe r)
enterprise = selectionForCompositeField "enterprise" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message :: SelectionSet Scope__UpdateEnterpriseMembersCanInviteCollaboratorsSettingPayload (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
