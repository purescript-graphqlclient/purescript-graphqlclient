module Dillonkearns.Examples.Github.Object.UpdateNotificationRestrictionSettingPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__UpdateNotificationRestrictionSettingPayload
  , Scope__VerifiableDomainOwner
  )
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateNotificationRestrictionSettingPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

owner
  :: forall r
   . SelectionSet Scope__VerifiableDomainOwner r
  -> SelectionSet Scope__UpdateNotificationRestrictionSettingPayload (Maybe r)
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
