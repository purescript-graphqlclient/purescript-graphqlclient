module Examples.Github.Object.UpdateEnterpriseTeamDiscussionsSettingPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdateEnterpriseTeamDiscussionsSettingPayload
  , Scope__Enterprise
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__UpdateEnterpriseTeamDiscussionsSettingPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

enterprise :: forall r . SelectionSet Scope__Enterprise r -> SelectionSet Scope__UpdateEnterpriseTeamDiscussionsSettingPayload (Maybe r)
enterprise = selectionForCompositeField "enterprise" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message :: SelectionSet Scope__UpdateEnterpriseTeamDiscussionsSettingPayload (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder
