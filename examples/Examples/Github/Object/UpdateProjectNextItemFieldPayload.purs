module Examples.Github.Object.UpdateProjectNextItemFieldPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__UpdateProjectNextItemFieldPayload, Scope__ProjectNextItem)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateProjectNextItemFieldPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

projectNextItem
  :: forall r
   . SelectionSet Scope__ProjectNextItem r
  -> SelectionSet Scope__UpdateProjectNextItemFieldPayload (Maybe r)
projectNextItem = selectionForCompositeField
                  "projectNextItem"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer
