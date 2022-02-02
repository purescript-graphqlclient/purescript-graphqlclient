module Examples.Github.Object.AddProjectNextItemPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__AddProjectNextItemPayload, Scope__ProjectNextItem)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__AddProjectNextItemPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

projectNextItem
  :: forall r
   . SelectionSet Scope__ProjectNextItem r
  -> SelectionSet Scope__AddProjectNextItemPayload (Maybe r)
projectNextItem = selectionForCompositeField
                  "projectNextItem"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer
