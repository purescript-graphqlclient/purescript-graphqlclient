module Examples.Github.Object.MarkDiscussionCommentAsAnswerPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__MarkDiscussionCommentAsAnswerPayload, Scope__Discussion)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__MarkDiscussionCommentAsAnswerPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

discussion
  :: forall r
   . SelectionSet Scope__Discussion r
  -> SelectionSet Scope__MarkDiscussionCommentAsAnswerPayload (Maybe r)
discussion = selectionForCompositeField
             "discussion"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
