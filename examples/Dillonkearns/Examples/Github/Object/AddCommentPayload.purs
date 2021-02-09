module Dillonkearns.Examples.Github.Object.AddCommentPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__AddCommentPayload
  , Scope__IssueCommentEdge
  , Scope__Node
  , Scope__IssueTimelineItemEdge
  )
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__AddCommentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

commentEdge
  :: forall r
   . SelectionSet Scope__IssueCommentEdge r
  -> SelectionSet Scope__AddCommentPayload (Maybe r)
commentEdge = selectionForCompositeField
              "commentEdge"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

subject
  :: forall r
   . SelectionSet Scope__Node r
  -> SelectionSet Scope__AddCommentPayload (Maybe r)
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

timelineEdge
  :: forall r
   . SelectionSet Scope__IssueTimelineItemEdge r
  -> SelectionSet Scope__AddCommentPayload (Maybe r)
timelineEdge = selectionForCompositeField
               "timelineEdge"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer
