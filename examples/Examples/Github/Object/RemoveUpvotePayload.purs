module Examples.Github.Object.RemoveUpvotePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__RemoveUpvotePayload, Scope__Votable)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__RemoveUpvotePayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

subject
  :: forall r
   . SelectionSet Scope__Votable r
  -> SelectionSet Scope__RemoveUpvotePayload (Maybe r)
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
