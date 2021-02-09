module Dillonkearns.Examples.Github.Object.DeleteProjectColumnPayload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__DeleteProjectColumnPayload, Scope__Project)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Id)

clientMutationId
  :: SelectionSet
     Scope__DeleteProjectColumnPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

deletedColumnId :: SelectionSet Scope__DeleteProjectColumnPayload (Maybe Id)
deletedColumnId = selectionForField
                  "deletedColumnId"
                  []
                  graphqlDefaultResponseScalarDecoder

project
  :: forall r
   . SelectionSet Scope__Project r
  -> SelectionSet Scope__DeleteProjectColumnPayload (Maybe r)
project = selectionForCompositeField
          "project"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
