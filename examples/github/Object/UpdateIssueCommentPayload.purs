module Examples.Github.Object.UpdateIssueCommentPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__UpdateIssueCommentPayload, Scope__IssueComment)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__UpdateIssueCommentPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

issueComment :: forall r . SelectionSet
                           Scope__IssueComment
                           r -> SelectionSet
                                Scope__UpdateIssueCommentPayload
                                (Maybe
                                 r)
issueComment = selectionForCompositeField
               "issueComment"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer
