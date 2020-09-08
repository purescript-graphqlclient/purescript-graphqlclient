module Examples.Github.Object.DeployedEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__DeployedEvent
  , Scope__Deployment
  , Scope__PullRequest
  , Scope__Ref
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor :: forall r . SelectionSet
                    Scope__Actor
                    r -> SelectionSet
                         Scope__DeployedEvent
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__DeployedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__DeployedEvent (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

deployment :: forall r . SelectionSet
                         Scope__Deployment
                         r -> SelectionSet
                              Scope__DeployedEvent
                              r
deployment = selectionForCompositeField
             "deployment"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__DeployedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet
                          Scope__PullRequest
                          r -> SelectionSet
                               Scope__DeployedEvent
                               r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ref :: forall r . SelectionSet
                  Scope__Ref
                  r -> SelectionSet
                       Scope__DeployedEvent
                       (Maybe
                        r)
ref = selectionForCompositeField
      "ref"
      []
      graphqlDefaultResponseFunctorOrScalarDecoderTransformer
