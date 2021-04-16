module Examples.Github.Object.DeploymentStatus where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeploymentStatus, Scope__Actor, Scope__Deployment)
import Examples.Github.Scalars (DateTime, Uri, Id)
import Data.Maybe (Maybe)
import Examples.Github.Enum.DeploymentStatusState (DeploymentStatusState)

createdAt :: SelectionSet Scope__DeploymentStatus DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

creator
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__DeploymentStatus r
creator = selectionForCompositeField
          "creator"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

deployment
  :: forall r
   . SelectionSet Scope__Deployment r
  -> SelectionSet Scope__DeploymentStatus r
deployment = selectionForCompositeField
             "deployment"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

description :: SelectionSet Scope__DeploymentStatus (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

environmentUrl :: SelectionSet Scope__DeploymentStatus (Maybe Uri)
environmentUrl = selectionForField
                 "environmentUrl"
                 []
                 graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__DeploymentStatus Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

logUrl :: SelectionSet Scope__DeploymentStatus (Maybe Uri)
logUrl = selectionForField "logUrl" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__DeploymentStatus DeploymentStatusState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__DeploymentStatus DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
