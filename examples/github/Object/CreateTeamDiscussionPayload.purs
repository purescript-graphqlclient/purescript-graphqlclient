module Examples.Github.Object.CreateTeamDiscussionPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CreateTeamDiscussionPayload, Scope__TeamDiscussion)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__CreateTeamDiscussionPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

teamDiscussion :: forall r . SelectionSet
                             Scope__TeamDiscussion
                             r -> SelectionSet
                                  Scope__CreateTeamDiscussionPayload
                                  (Maybe
                                   r)
teamDiscussion = selectionForCompositeField
                 "teamDiscussion"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer
