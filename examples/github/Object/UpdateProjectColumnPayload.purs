module Examples.Github.Object.UpdateProjectColumnPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__UpdateProjectColumnPayload, Scope__ProjectColumn)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__UpdateProjectColumnPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

projectColumn :: forall r . SelectionSet
                            Scope__ProjectColumn
                            r -> SelectionSet
                                 Scope__UpdateProjectColumnPayload
                                 (Maybe
                                  r)
projectColumn = selectionForCompositeField
                "projectColumn"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer
