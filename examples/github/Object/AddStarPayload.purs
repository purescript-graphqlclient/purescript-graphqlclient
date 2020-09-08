module Examples.Github.Object.AddStarPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__AddStarPayload, Scope__Starrable)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__AddStarPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

starrable :: forall r . SelectionSet
                        Scope__Starrable
                        r -> SelectionSet
                             Scope__AddStarPayload
                             (Maybe
                              r)
starrable = selectionForCompositeField
            "starrable"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer
