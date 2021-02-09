module Dillonkearns.Examples.Github.Object.Deployment where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , toGraphQLArguments
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__Commit
  , Scope__Deployment
  , Scope__Actor
  , Scope__DeploymentStatus
  , Scope__Ref
  , Scope__Repository
  , Scope__DeploymentStatusConnection
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id)
import Dillonkearns.Examples.Github.Enum.DeploymentState (DeploymentState)
import Type.Row (type (+))

commit
  :: forall r
   . SelectionSet Scope__Commit r
  -> SelectionSet Scope__Deployment (Maybe r)
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commitOid :: SelectionSet Scope__Deployment String
commitOid = selectionForField "commitOid" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Deployment DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

creator
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__Deployment r
creator = selectionForCompositeField
          "creator"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

databaseId :: SelectionSet Scope__Deployment (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Deployment (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

environment :: SelectionSet Scope__Deployment (Maybe String)
environment = selectionForField
              "environment"
              []
              graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Deployment Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

latestEnvironment :: SelectionSet Scope__Deployment (Maybe String)
latestEnvironment = selectionForField
                    "latestEnvironment"
                    []
                    graphqlDefaultResponseScalarDecoder

latestStatus
  :: forall r
   . SelectionSet Scope__DeploymentStatus r
  -> SelectionSet Scope__Deployment (Maybe r)
latestStatus = selectionForCompositeField
               "latestStatus"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

originalEnvironment :: SelectionSet Scope__Deployment (Maybe String)
originalEnvironment = selectionForField
                      "originalEnvironment"
                      []
                      graphqlDefaultResponseScalarDecoder

payload :: SelectionSet Scope__Deployment (Maybe String)
payload = selectionForField "payload" [] graphqlDefaultResponseScalarDecoder

ref
  :: forall r
   . SelectionSet Scope__Ref r
  -> SelectionSet Scope__Deployment (Maybe r)
ref = selectionForCompositeField
      "ref"
      []
      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__Deployment r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

state :: SelectionSet Scope__Deployment (Maybe DeploymentState)
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

type StatusesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type StatusesInput = { | StatusesInputRowOptional + () }

statuses
  :: forall r
   . StatusesInput
  -> SelectionSet Scope__DeploymentStatusConnection r
  -> SelectionSet Scope__Deployment (Maybe r)
statuses input = selectionForCompositeField
                 "statuses"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

task :: SelectionSet Scope__Deployment (Maybe String)
task = selectionForField "task" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Deployment DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
