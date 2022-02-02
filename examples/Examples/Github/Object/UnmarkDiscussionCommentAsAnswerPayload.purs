module Examples.Github.Object.UnmarkDiscussionCommentAsAnswerPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__UnmarkDiscussionCommentAsAnswerPayload, Scope__Discussion)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UnmarkDiscussionCommentAsAnswerPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

discussion
  :: forall r
   . SelectionSet Scope__Discussion r
  -> SelectionSet Scope__UnmarkDiscussionCommentAsAnswerPayload (Maybe r)
discussion = selectionForCompositeField
             "discussion"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
