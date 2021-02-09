module Dillonkearns.Examples.Github.Object.UnminimizeCommentPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UnminimizeCommentPayload, Scope__Minimizable)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__UnminimizeCommentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

unminimizedComment
  :: forall r
   . SelectionSet Scope__Minimizable r
  -> SelectionSet Scope__UnminimizeCommentPayload (Maybe r)
unminimizedComment = selectionForCompositeField
                     "unminimizedComment"
                     []
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer
