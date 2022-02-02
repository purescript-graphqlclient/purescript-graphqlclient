module Examples.Github.Object.UpdateEnvironmentPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__UpdateEnvironmentPayload, Scope__Environment)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__UpdateEnvironmentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

environment
  :: forall r
   . SelectionSet Scope__Environment r
  -> SelectionSet Scope__UpdateEnvironmentPayload (Maybe r)
environment = selectionForCompositeField
              "environment"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
