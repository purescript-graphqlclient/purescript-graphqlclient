module Examples.Github.Object.DeleteDiscussionCommentPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeleteDiscussionCommentPayload, Scope__DiscussionComment)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__DeleteDiscussionCommentPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

comment
  :: forall r
   . SelectionSet Scope__DiscussionComment r
  -> SelectionSet Scope__DeleteDiscussionCommentPayload (Maybe r)
comment = selectionForCompositeField
          "comment"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
