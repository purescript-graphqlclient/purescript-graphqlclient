module Examples.Github.Object.CreateEnvironmentPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CreateEnvironmentPayload, Scope__Environment)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__CreateEnvironmentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

environment
  :: forall r
   . SelectionSet Scope__Environment r
  -> SelectionSet Scope__CreateEnvironmentPayload (Maybe r)
environment = selectionForCompositeField
              "environment"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
