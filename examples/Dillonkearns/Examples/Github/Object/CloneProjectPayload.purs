module Dillonkearns.Examples.Github.Object.CloneProjectPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__CloneProjectPayload, Scope__Project)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__CloneProjectPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

jobStatusId :: SelectionSet Scope__CloneProjectPayload (Maybe String)
jobStatusId = selectionForField
              "jobStatusId"
              []
              graphqlDefaultResponseScalarDecoder

project
  :: forall r
   . SelectionSet Scope__Project r
  -> SelectionSet Scope__CloneProjectPayload (Maybe r)
project = selectionForCompositeField
          "project"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
