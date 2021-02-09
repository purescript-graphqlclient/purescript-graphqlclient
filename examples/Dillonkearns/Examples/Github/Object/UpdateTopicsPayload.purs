module Dillonkearns.Examples.Github.Object.UpdateTopicsPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UpdateTopicsPayload, Scope__Repository)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__UpdateTopicsPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

invalidTopicNames
  :: SelectionSet
     Scope__UpdateTopicsPayload
     (Maybe (Array String))
invalidTopicNames = selectionForField
                    "invalidTopicNames"
                    []
                    graphqlDefaultResponseScalarDecoder

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__UpdateTopicsPayload (Maybe r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
