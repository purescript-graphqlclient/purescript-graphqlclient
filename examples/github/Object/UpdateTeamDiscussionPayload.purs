module Examples.Github.Object.UpdateTeamDiscussionPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__UpdateTeamDiscussionPayload, Scope__TeamDiscussion)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateTeamDiscussionPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

teamDiscussion
  :: forall r
   . SelectionSet Scope__TeamDiscussion r
  -> SelectionSet Scope__UpdateTeamDiscussionPayload (Maybe r)
teamDiscussion = selectionForCompositeField
                 "teamDiscussion"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer
