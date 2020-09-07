module Examples.Github.Object.UpdateProjectPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__UpdateProjectPayload, Scope__Project)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__UpdateProjectPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

project :: forall r . SelectionSet
                      Scope__Project
                      r -> SelectionSet
                           Scope__UpdateProjectPayload
                           (Maybe
                            r)
project = selectionForCompositeField
          "project"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
