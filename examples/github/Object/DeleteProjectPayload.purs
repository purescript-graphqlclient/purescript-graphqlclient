module Examples.Github.Object.DeleteProjectPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__DeleteProjectPayload, Scope__ProjectOwner)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__DeleteProjectPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

owner :: forall r . SelectionSet
                    Scope__ProjectOwner
                    r -> SelectionSet
                         Scope__DeleteProjectPayload
                         (Maybe
                          r)
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
