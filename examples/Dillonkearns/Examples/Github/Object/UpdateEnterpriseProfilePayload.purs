module Dillonkearns.Examples.Github.Object.UpdateEnterpriseProfilePayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UpdateEnterpriseProfilePayload, Scope__Enterprise)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateEnterpriseProfilePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

enterprise
  :: forall r
   . SelectionSet Scope__Enterprise r
  -> SelectionSet Scope__UpdateEnterpriseProfilePayload (Maybe r)
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
