module Examples.Github.Object.AddDiscussionCommentPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__AddDiscussionCommentPayload, Scope__DiscussionComment)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__AddDiscussionCommentPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

comment
  :: forall r
   . SelectionSet Scope__DiscussionComment r
  -> SelectionSet Scope__AddDiscussionCommentPayload (Maybe r)
comment = selectionForCompositeField
          "comment"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
