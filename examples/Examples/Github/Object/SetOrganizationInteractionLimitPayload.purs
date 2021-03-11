module Examples.Github.Object.SetOrganizationInteractionLimitPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__SetOrganizationInteractionLimitPayload, Scope__Organization)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__SetOrganizationInteractionLimitPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__SetOrganizationInteractionLimitPayload (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer
