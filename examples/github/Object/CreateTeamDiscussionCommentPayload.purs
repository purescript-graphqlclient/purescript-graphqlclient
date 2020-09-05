module Examples.Github.Object.CreateTeamDiscussionCommentPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CreateTeamDiscussionCommentPayload, Scope__TeamDiscussionComment)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__CreateTeamDiscussionCommentPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

teamDiscussionComment :: forall r . SelectionSet
                                    Scope__TeamDiscussionComment
                                    r -> SelectionSet
                                         Scope__CreateTeamDiscussionCommentPayload
                                         (Maybe
                                          r)
teamDiscussionComment = selectionForCompositeField
                        "teamDiscussionComment"
                        []
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
