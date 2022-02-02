module Examples.Github.Object.UpdateDiscussionCommentPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__UpdateDiscussionCommentPayload, Scope__DiscussionComment)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateDiscussionCommentPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

comment
  :: forall r
   . SelectionSet Scope__DiscussionComment r
  -> SelectionSet Scope__UpdateDiscussionCommentPayload (Maybe r)
comment = selectionForCompositeField
          "comment"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
