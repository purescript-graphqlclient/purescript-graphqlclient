module Dillonkearns.Examples.Github.Object.EnablePullRequestAutoMergePayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Actor, Scope__EnablePullRequestAutoMergePayload, Scope__PullRequest)
import Data.Maybe (Maybe)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__EnablePullRequestAutoMergePayload (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId
  :: SelectionSet
     Scope__EnablePullRequestAutoMergePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__EnablePullRequestAutoMergePayload (Maybe r)
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
