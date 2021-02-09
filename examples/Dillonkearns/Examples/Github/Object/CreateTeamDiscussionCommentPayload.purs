module Dillonkearns.Examples.Github.Object.CreateTeamDiscussionCommentPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__CreateTeamDiscussionCommentPayload, Scope__TeamDiscussionComment)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__CreateTeamDiscussionCommentPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

teamDiscussionComment
  :: forall r
   . SelectionSet Scope__TeamDiscussionComment r
  -> SelectionSet Scope__CreateTeamDiscussionCommentPayload (Maybe r)
teamDiscussionComment = selectionForCompositeField
                        "teamDiscussionComment"
                        []
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
