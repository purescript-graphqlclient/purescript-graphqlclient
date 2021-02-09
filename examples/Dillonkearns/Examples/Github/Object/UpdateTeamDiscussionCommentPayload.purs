module Dillonkearns.Examples.Github.Object.UpdateTeamDiscussionCommentPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UpdateTeamDiscussionCommentPayload, Scope__TeamDiscussionComment)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateTeamDiscussionCommentPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

teamDiscussionComment
  :: forall r
   . SelectionSet Scope__TeamDiscussionComment r
  -> SelectionSet Scope__UpdateTeamDiscussionCommentPayload (Maybe r)
teamDiscussionComment = selectionForCompositeField
                        "teamDiscussionComment"
                        []
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
