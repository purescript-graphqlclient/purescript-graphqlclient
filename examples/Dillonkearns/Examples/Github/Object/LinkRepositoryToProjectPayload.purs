module Dillonkearns.Examples.Github.Object.LinkRepositoryToProjectPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__LinkRepositoryToProjectPayload, Scope__Project, Scope__Repository)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__LinkRepositoryToProjectPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

project
  :: forall r
   . SelectionSet Scope__Project r
  -> SelectionSet Scope__LinkRepositoryToProjectPayload (Maybe r)
project = selectionForCompositeField
          "project"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__LinkRepositoryToProjectPayload (Maybe r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
