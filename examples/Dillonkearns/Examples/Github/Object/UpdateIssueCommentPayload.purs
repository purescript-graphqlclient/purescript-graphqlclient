module Dillonkearns.Examples.Github.Object.UpdateIssueCommentPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UpdateIssueCommentPayload, Scope__IssueComment)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__UpdateIssueCommentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

issueComment
  :: forall r
   . SelectionSet Scope__IssueComment r
  -> SelectionSet Scope__UpdateIssueCommentPayload (Maybe r)
issueComment = selectionForCompositeField
               "issueComment"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer
