module Examples.Github.Object.CreateProjectPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__CreateProjectPayload, Scope__Project)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__CreateProjectPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

project :: forall r . SelectionSet
                      Scope__Project
                      r -> SelectionSet
                           Scope__CreateProjectPayload
                           (Maybe
                            r)
project = selectionForCompositeField
          "project"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
