module Dillonkearns.Examples.Github.Object.DisablePullRequestAutoMergePayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Actor, Scope__DisablePullRequestAutoMergePayload, Scope__PullRequest)
import Data.Maybe (Maybe)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__DisablePullRequestAutoMergePayload (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId
  :: SelectionSet
     Scope__DisablePullRequestAutoMergePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__DisablePullRequestAutoMergePayload (Maybe r)
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
