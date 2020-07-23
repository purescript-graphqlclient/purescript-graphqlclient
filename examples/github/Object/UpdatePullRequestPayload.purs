module Examples.Github.Object.UpdatePullRequestPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__UpdatePullRequestPayload
  , Scope__PullRequest
  )
import Data.Maybe
  ( Maybe
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__UpdatePullRequestPayload (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet Scope__UpdatePullRequestPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__UpdatePullRequestPayload (Maybe r)
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
