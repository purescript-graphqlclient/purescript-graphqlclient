module Examples.Github.Object.SetRepositoryInteractionLimitPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__SetRepositoryInteractionLimitPayload, Scope__Repository)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__SetRepositoryInteractionLimitPayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__SetRepositoryInteractionLimitPayload
                              (Maybe
                               r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
