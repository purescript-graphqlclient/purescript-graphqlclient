module Dillonkearns.Examples.Github.Object.UpdateProjectColumnPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UpdateProjectColumnPayload, Scope__ProjectColumn)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateProjectColumnPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

projectColumn
  :: forall r
   . SelectionSet Scope__ProjectColumn r
  -> SelectionSet Scope__UpdateProjectColumnPayload (Maybe r)
projectColumn = selectionForCompositeField
                "projectColumn"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer
