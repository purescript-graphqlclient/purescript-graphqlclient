module Examples.Github.Object.DeleteDiscussionPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeleteDiscussionPayload, Scope__Discussion)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__DeleteDiscussionPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

discussion
  :: forall r
   . SelectionSet Scope__Discussion r
  -> SelectionSet Scope__DeleteDiscussionPayload (Maybe r)
discussion = selectionForCompositeField
             "discussion"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
