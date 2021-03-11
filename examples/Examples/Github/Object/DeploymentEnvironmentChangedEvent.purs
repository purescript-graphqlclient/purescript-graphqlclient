module Examples.Github.Object.DeploymentEnvironmentChangedEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__DeploymentEnvironmentChangedEvent
  , Scope__DeploymentStatus
  , Scope__PullRequest
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__DeploymentEnvironmentChangedEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__DeploymentEnvironmentChangedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

deploymentStatus
  :: forall r
   . SelectionSet Scope__DeploymentStatus r
  -> SelectionSet Scope__DeploymentEnvironmentChangedEvent r
deploymentStatus = selectionForCompositeField
                   "deploymentStatus"
                   []
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__DeploymentEnvironmentChangedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__DeploymentEnvironmentChangedEvent r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
