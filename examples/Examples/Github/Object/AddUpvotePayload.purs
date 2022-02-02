module Examples.Github.Object.AddUpvotePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__AddUpvotePayload, Scope__Votable)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__AddUpvotePayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

subject
  :: forall r
   . SelectionSet Scope__Votable r
  -> SelectionSet Scope__AddUpvotePayload (Maybe r)
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
