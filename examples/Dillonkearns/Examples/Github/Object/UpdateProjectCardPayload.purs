module Dillonkearns.Examples.Github.Object.UpdateProjectCardPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UpdateProjectCardPayload, Scope__ProjectCard)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__UpdateProjectCardPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

projectCard
  :: forall r
   . SelectionSet Scope__ProjectCard r
  -> SelectionSet Scope__UpdateProjectCardPayload (Maybe r)
projectCard = selectionForCompositeField
              "projectCard"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
