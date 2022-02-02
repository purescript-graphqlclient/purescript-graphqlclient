module Examples.Github.Object.CreateDiscussionPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CreateDiscussionPayload, Scope__Discussion)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__CreateDiscussionPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

discussion
  :: forall r
   . SelectionSet Scope__Discussion r
  -> SelectionSet Scope__CreateDiscussionPayload (Maybe r)
discussion = selectionForCompositeField
             "discussion"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
