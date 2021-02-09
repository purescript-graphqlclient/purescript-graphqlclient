module Dillonkearns.Examples.Github.Object.ReopenPullRequestPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__ReopenPullRequestPayload, Scope__PullRequest)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__ReopenPullRequestPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__ReopenPullRequestPayload (Maybe r)
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
